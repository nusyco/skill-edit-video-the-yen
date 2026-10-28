# Kiến Trúc JSON CapCut PC (Multi-Timeline) & Thuật Toán Chống Ghi Đè RAM

Tài liệu kỹ thuật này hướng dẫn A.I thao tác trực tiếp trên cấu trúc file dự án của **CapCut PC (Windows)**, giúp dựng mới hoặc cập nhật bất kỳ Timeline nào chỉ trong vài giây mà không cần thao tác kéo thả thủ công.

---

## 1. Cấu trúc Thư mục Dự án Đa Timeline (`Multi-Timeline Project`)

Khi một Project CapCut PC (ví dụ: `D:\Capcut\Projects\CapCut Drafts\1012`) sử dụng tính năng Đa dòng thời gian (Multi-Timeline Dock), dữ liệu không nằm ở `draft_content.json` ngoài thư mục gốc mà được phân bổ như sau:

1. `Timelines\<TIMELINE_UUID>\draft_content.json`:
   - Chứa toàn bộ nội dung của một Timeline cụ thể (`canvas_config`, `duration`, `materials`, `tracks`).
   - Ví dụ trong Project `1012`:
     - `Dòng thời gian 11`: `Timelines\BD74A443-6B73-4b89-A9BB-70FED2F23531\draft_content.json`
     - `Dòng thời gian 12`: `Timelines\C1200012-84CC-4AB6-A510-6CD4AA1BA612\draft_content.json`
2. `project.json`:
   - Khai báo danh sách toàn bộ các Timeline con trong mảng `timelines` (`id`, `name`, `cover`, `create_time`, `update_time`) và chỉ định `active_timeline_id`.
3. `timeline_layout.json`:
   - Khai báo các tab hiển thị trên thanh Dock của giao diện CapCut (`dockItems[0].timelineIds` và `dockItems[0].timelineNames`).
   - **Lưu ý quan trọng:** Nếu tạo Timeline mới mà không thêm `UUID` và `Name` vào `timeline_layout.json`, tab của Timeline đó sẽ không xuất hiện trên thanh Dock của CapCut!
4. `draft_biz_config.json`:
   - Lưu cấu hình vùng chọn (`SelectionRange`) theo từng `TIMELINE_UUID`.

---

## 2. Cơ chế Bộ nhớ RAM của CapCut PC & Daemon Bảo Vệ (`protect-capcut-project.ps1`)

### Hiện tượng:
- Khi người dùng mở một Project trên CapCut PC, CapCut nạp toàn bộ `project.json`, `timeline_layout.json` và tất cả `Timelines\*\draft_content.json` vào **RAM**.
- Khi chuyển qua lại giữa các tab `Dòng thời gian 01..12` trong lúc Project đang mở, CapCut **chỉ đọc từ RAM**, không đọc lại từ ổ cứng.
- Nguy hiểm hơn: Khi người dùng **đóng Project** hoặc **tắt CapCut**, CapCut sẽ lấy bản cũ trong RAM **ghi đè (flush) ngược xuống ổ cứng**, xóa mất các chỉnh sửa bên ngoài nếu không có cơ chế bảo vệ.

### Giải pháp chuẩn (`scripts/protect-capcut-project.ps1`):
- Luôn lưu bản chuẩn sau khi A.I dựng xong vào thư mục tạm/backup.
- Chạy một vòng lặp PowerShell nhẹ (`150ms`/lần) theo dõi kích thước byte (`Length`) của `project.json` và `draft_content.json`.
- Ngay khoảnh khắc Sếp đóng Project (CapCut vừa ghi đè bản RAM cũ xuống đĩa làm thay đổi kích thước file), Daemon lập tức chép đè bản mới chuẩn xác trở lại trong `120ms`. Khi Sếp bấm mở lại Project, CapCut nạp đúng 100% bản dựng mới vào RAM.

---

## 3. Cấu trúc 4 Track Chuẩn trong `draft_content.json`

Mỗi Timeline của `skill-edit-video-the-yen` gồm các Track chuẩn sau:

1. **Track 0 (`type: "video"`):**
   - Chứa chuỗi `N` segment B-Roll liên tiếp (`target_timerange.start` nối đuôi nhau, `source_timerange` cắt đoạn đẹp nhất của clip gốc).
   - Đặt `volume = 0.0` trên mọi video segment (tắt tiếng ồn môi trường của clip gốc).
   - Mỗi segment từ `0` đến `N - 2` chứa mảng `extra_material_refs: ["<TRANSITION_UUID>"]` trỏ tới object chuyển cảnh trong `materials.transitions`.
2. **Track 1 (`type: "audio"`):**
   - Chứa segment âm thanh Voiceover / Nhạc nền (`materials.audios`).
3. **Track 2 (`type: "text"` — Dòng 1 Tiêu đề chính):**
   - Chứa các segment chữ Dòng 1 (`clip.transform.y = Y1`, `clip.scale.x = clip.scale.y = scale1`).
4. **Track 3 (`type: "text"` — Dòng 2 Phụ đề viết tay / chữ ký):**
   - Chứa các segment chữ Dòng 2 (`clip.transform.y = Y2`, `clip.scale.x = clip.scale.y = scale2`).

---

## 4. Cấu trúc JSON của Chuyển Cảnh Lấp Lánh (`materials.transitions`)

Để gắn một chuyển cảnh Lấp lánh vào điểm cắt sau segment thứ `i` (`0 <= i < N - 1`):

1. Thêm một phần tử vào `materials.transitions`:
```json
{
  "category_id": "38842",
  "category_name": "Lấp lánh",
  "duration": 500000,
  "effect_id": "7269672934933795329",
  "id": "<NEW_TRANSITION_UUID>",
  "is_overlap": true,
  "name": "Lấp lánh mờ",
  "path": "C:/Users/nusyc/AppData/Local/CapCut/User Data/Cache/effect/7269672934933795329/...",
  "platform": "all",
  "resource_id": "7269672934933795329",
  "type": "transition"
}
```
2. Thêm `<NEW_TRANSITION_UUID>` vào mảng `extra_material_refs` của video segment thứ `i` trên `Track 0`.

---

## 5. Cấu trúc JSON của Text Material & Bảo toàn Tiếng Việt (`UTF-8 no BOM`)

Mỗi phần tử trong `materials.texts` có trường `content` là một chuỗi JSON lồng bên trong (escaped JSON string):
```json
{
  "styles": [
    {
      "fill": {
        "content": {
          "solid": { "color": [0.97647, 0.87058, 0.56470] }
        }
      },
      "font": {
        "id": "",
        "path": "C:/Users/nusyc/AppData/Local/Microsoft/Windows/Fonts/VN-Prata-Regular.ttf"
      },
      "range": [0, 14],
      "size": 13.0,
      "strokes": [
        {
          "content": {
            "solid": { "color": [0.34509, 0.23921, 0.15294] }
          },
          "width": 0.08
        }
      ]
    }
  ],
  "text": "Quà tặng 20/10"
}
```
- **Quy tắc quan trọng số 1:** `styles[0].range` phải luôn bằng `[0, text.Length]` (độ dài chuỗi UTF-16). Nếu `range[1]` nhỏ hơn độ dài chuỗi, các ký tự cuối sẽ bị mất định dạng font/màu.
- **Quy tắc quan trọng số 2:** Luôn ghi file bằng `[System.IO.File]::WriteAllText($path, $json, (New-Object System.Text.UTF8Encoding($false)))`. Tuyệt đối không dùng `Out-File` hay `Set-Content` mặc định của Windows PowerShell 5.1 vì sẽ gây lỗi font tiếng Việt (Mojibake) hoặc chèn BOM làm CapCut từ chối đọc file.

---
name: skill-edit-video-the-yen
description: "Dựng video ngắn TikTok/Reels/Shorts (1080x1920, 30fps) cho sản phẩm trang sức & vòng tay phong thủy/thời trang theo DNA 'The Yên' trực tiếp thành Timeline CapCut PC (hoặc xuất MP4): Công thức kịch bản 5 nhịp chuyển đổi cao, 100% điểm cắt gắn Chuyển cảnh Lấp lánh (Sparkle Transitions), kho 22 bộ Font Việt hóa cách điệu & viết tay (2 dòng/cụm), tự động cân chỉnh cỡ chữ chống tràn (48%–62% chiều ngang), nằm gọn trong Khung An Toàn TikTok và tuyệt đối KHÔNG che mặt mẫu hay che sản phẩm. Kích hoạt khi Sếp gọi $skill-edit-video-the-yen."
metadata:
  version: "1.0.0"
  status: "Chờ duyệt"
  reference: "23 Video Thành Phẩm Vòng Tay The Yên & CapCut Project 1012 (Dòng thời gian 11 & 12)"
---

# Skill Edit Video Vòng Tay "The Yên" (`skill-edit-video-the-yen`)

> **Trạng thái tài liệu:** **Chờ duyệt** (Bản đóng gói `1.0.0` trình Sếp Nguyễn Sỹ Cường phê duyệt).

## 1. Kết quả đầu ra bắt buộc

Từ kho **Video Nguồn (Raw B-Roll)**, **File Voiceover (VO) / Nhạc nền** và **Kịch bản chi tiết** của sản phẩm vòng tay, tạo ra:
1. **Timeline hoàn chỉnh trực tiếp trong Project CapCut PC** (`draft_content.json` + đăng ký đồng bộ vào `project.json`, `timeline_layout.json`, `draft_biz_config.json`) để Sếp hoặc Editor mở lên xem/tinh chỉnh được ngay lập tức.
2. **Ảnh kiểm duyệt trực quan Khung An Toàn TikTok & Chống che chủ thể (`safezone-composite.png`)**: Ghép các frame đại diện của từng phân cảnh kèm lưới vùng chết TikTok (màu đỏ), khung an toàn (màu xanh lá) và vị trí chữ thực tế.
3. **Thông số chuẩn kỹ thuật:**
   - Khung hình dọc: **`1080×1920` (9:16)**, `30 fps`.
   - Thời lượng tiêu chuẩn: **`18s – 30s`** (`6 – 9` phân đoạn B-Roll, trung bình `2.0s – 3.8s`/cảnh).
   - Âm thanh: Track Voiceover rõ nét + Nhạc nền Acoustic/Piano/Healing dịu nhẹ làm nền.

---

## 2. Bất biến đã chốt (7 Nguyên tắc Vàng - Invariants)

1. **100% Điểm cắt phải có Chuyển cảnh Lấp lánh (`Sparkle Transition Rule`):**
   - Với `N` phân đoạn video trên Track 1, bắt buộc có đủ **`N - 1` chuyển cảnh** gắn vào mọi điểm cắt (`duration = 500000` µs = `0.5s`).
   - Ưu tiên tuyệt đối nhóm **Chuyển cảnh Lấp lánh (Sparkle)** trong CapCut để tôn độ bắt sáng của đá tự nhiên, vỏ sò, ngọc trai và charm bạc:
     1. **Lấp lánh mờ** (`resource_id: 7269672934933795329`)
     2. **Biến hình lấp lánh** (`resource_id: 7452646287318454785`)
     3. **Lấp lánh** (`resource_id: 7361758943661527569`)
     4. **Mờ kim sa** (`resource_id: 7682682952043547911`)
     5. **Mờ lấp lánh** (`resource_id: 7522416272844295441`)
     6. **Thu phóng lấp lánh** (`resource_id: 7452646287326843393`)

2. **Cỡ chữ cân đối & Chống tràn màn hình tuyệt đối (`Text Sizing & Anti-Overflow Rule`):**
   - Mỗi thông điệp hiển thị theo **Cấu trúc Cặp 2 Dòng (Dual-Track Text Pair)**:
     - **Dòng 1 (Track 2):** Font tiêu đề (Luxury Serif / Display hoặc Chữ viết thường thanh lịch), màu vàng kem ấm `#F9DE90` hoặc trắng ngà `#FFFFFF`, viền nâu trầm `#583D27` (`width = 0.08`).
     - **Dòng 2 (Track 3):** Font chữ ký / viết tay mềm mại (Script / Handwritten), màu trắng `#FFFFFF` kèm đổ bóng đen dịu (`alpha = 0.65`, `smoothing = 0.25`) hoặc viền nâu mảnh.
   - **Độ dài văn bản:** Mỗi dòng chỉ từ **`10 – 22 ký tự`** (`3 – 5 chữ`), súc tích như tạp chí thời trang.
   - **Độ rộng hiển thị thực tế:** Sau khi nhân `font_size` (`11 – 15`) và `clip.scale` (`1.02 – 1.45`), chiều ngang chữ phải nằm trong dải **`48% – 62%` chiều rộng khung hình** (`520px – 670px` trên nền `1080px`). Tuyệt đối không vượt ngưỡng ngắt dòng tự động của CapCut (`line_max_width = 0.82`) và không tràn lề.

3. **Nằm gọn trong Khung An Toàn TikTok (`TikTok Safe Zone Rule`):**
   - Trong hệ tọa độ CapCut (`X, Y ∈ [-1.0, +1.0]`):
     - **Vùng cấm Đỉnh (`Y > +0.82`):** Bị che bởi thanh tìm kiếm, nút LIVE và tai thỏ điện thoại (`150px` trên cùng).
     - **Vùng cấm Đáy (`Y < -0.50`):** Bị che bởi giỏ hàng TikTok Shop, tên kênh, caption và thanh nhạc chạy (`420px` dưới cùng).
     - **Vùng cấm Cạnh Phải (`X > +0.72` khi `Y ∈ [-0.50, +0.20]`):** Bị che bởi cột Avatar, Tim, Bình luận, Lưu, Chia sẻ (`150px` bên phải).
   - **Tọa độ cho phép của mọi dòng Text:**
     - Trục ngang: **`X = 0.0`** (căn giữa), biên trái/phải của chữ nằm trong **`[-0.65, +0.65]`**.
     - Trục dọc: **`Y ∈ [-0.48, +0.76]`**, khoảng cách giữa Dòng 1 và Dòng 2 là **`ΔY = 0.08 – 0.09`**.

4. **Tuyệt đối KHÔNG che mặt mẫu và KHÔNG che sản phẩm (`Zero Subject/Product Occlusion Rule`):**
   - Trước khi gán tọa độ `Y` cho từng cặp chữ, bắt buộc trích xuất frame đại diện của từng clip bằng `ffmpeg` để xác định vị trí **Mặt mẫu** và **Cổ tay đeo vòng / Sản phẩm**:
     - **Trường hợp A – Cảnh cận sản phẩm ở chính giữa khung hình (`Y ∈ [-0.25, +0.35]`):** Đặt cặp Text ở **Vùng An Toàn Dưới** (`Y1 = -0.35..-0.39`, `Y2 = -0.44..-0.47`).
     - **Trường hợp B – Cảnh có mặt mẫu ở giữa (`Y ∈ [-0.05, +0.45]`) VÀ tay đeo vòng ở dưới (`Y ∈ [-0.50, -0.15]`):** Tự động đưa cặp Text lên **Vùng An Toàn Trên Đỉnh Đầu Mẫu** (`Y1 = +0.64..+0.66`, `Y2 = +0.55..+0.57`) để né hoàn toàn cả gương mặt lẫn chiếc vòng tay.
     - **Trường hợp C – Cảnh mặt mẫu ở cao (`Y > +0.15`) và tay kéo dây rút vòng ở thấp (`Y < -0.45`):** Đặt cặp Text vào **Khe trống ngang ngực áo** (`Y1 = -0.25`, `Y2 = -0.34`).

5. **Kho 22 Bộ Font Việt hóa Cách điệu & Viết tay (`100% Vietnamese Diacritics Verified`):**
   - Chỉ sử dụng các bộ font đã kiểm định 100% dấu tiếng Việt (`ă, â, đ, ê, ô, ơ, ư` và 5 thanh điệu không lỗi ô vuông hay nhảy font), lưu trữ tại `e:\DỰ ÁN LỚN\VÒNG TAY\FONT VIET HOA CACH DIEU` và đã cài vào Windows (`C:\Users\nusyc\AppData\Local\Microsoft\Windows\Fonts`):
     - **Nhóm 1 (`Bộ 01` → `Bộ 12`):** Dòng 1 Luxury Display/Serif Cách điệu + Dòng 2 Script Nghệ thuật.
     - **Nhóm 2 (`Bộ 13` → `Bộ 22`):** Dòng 1 Chữ viết thường (Regular/Medium Sans & Serif thanh lịch) + Dòng 2 Chữ viết tay (Handwritten tự nhiên).

6. **Bảo toàn UTF-8 không BOM & Đồng bộ Đa Timeline CapCut (`CapCut Multi-Timeline Sync`):**
   - Mọi thao tác đọc/ghi JSON của CapCut bằng PowerShell/Python bắt buộc dùng `UTF8Encoding($false)` (UTF-8 without BOM) để không làm hỏng dấu tiếng Việt hoặc cấu trúc đọc của CapCut.
   - Khi thêm hoặc cập nhật Timeline trong Project đang mở trên CapCut PC, phải kích hoạt tiến trình bảo vệ ngầm (`scripts/protect-capcut-project.ps1`) để chống cơ chế ghi đè RAM của CapCut khi đóng/mở lại Project.

7. **Cấu trúc Kịch bản 5 Nhịp Chuyển Đổi (`The Yên 5-Stage Storytelling`):**
   - **Nhịp 1 (`0 – 4s`) – Emotional Hook:** Đánh trúng tâm lý quà tặng / vẻ đẹp nữ tính kèm cảnh mẫu đeo vòng tự nhiên.
   - **Nhịp 2 (`4 – 8s`) – Product Hero & Giải quyết rào cản:** Cận cảnh vòng + thao tác khóa rút điều chỉnh ("nàng nào cũng vừa size").
   - **Nhịp 3 (`8 – 14s`) – Chất liệu & Độ hoàn thiện:** Quay sát hạt đá phong thủy (thạch anh dâu tây, mắt hổ...), vỏ sò, ngọc trai, charm bạc.
   - **Nhịp 4 (`14 – 19s`) – Ý nghĩa Phong thủy / Cảm xúc:** Thông điệp bình an, thanh xuân, may mắn.
   - **Nhịp 5 (`19 – 24s+`) – Packaging & CTA:** Hộp quà chỉn chu, túi giấy, thiệp viết tay ("Nhắn cho The Yên ngay nhé").

---

## 3. Tài liệu tham chiếu và công cụ trong Skill

1. **Bản thiết kế phong cách chi tiết (Style Blueprint):** [references/style-blueprint.md](references/style-blueprint.md)
2. **Danh mục 22 Bộ Font Việt hóa (`Bộ 01` → `Bộ 22`):** [references/font-catalog-22-sets.md](references/font-catalog-22-sets.md) & [config/font-pairings-catalog.json](config/font-pairings-catalog.json)
3. **Kiến trúc JSON CapCut PC & Thuật toán Chống ghi đè RAM:** [references/capcut-json-architecture.md](references/capcut-json-architecture.md)
4. **Danh mục nghiệm thu trước khi bàn giao (QA Checklist):** [references/acceptance-checklist.md](references/acceptance-checklist.md)
5. **Bộ Script thực thi tự động:**
   - [scripts/build-capcut-timeline.ps1](scripts/build-capcut-timeline.ps1): Tự động dựng Timeline CapCut hoàn chỉnh từ file kế hoạch `edit-plan.json`.
   - [scripts/verify-safezone-and-width.ps1](scripts/verify-safezone-and-width.ps1): Tự động trích xuất frame, đo độ rộng pixel và xuất ảnh kiểm duyệt `safezone-composite.png`.
   - [scripts/protect-capcut-project.ps1](scripts/protect-capcut-project.ps1): Daemon bảo vệ các Timeline trong CapCut Project không bị ghi đè khi đóng/mở ứng dụng.
6. **File mẫu & Hình ảnh trực quan:**
   - [assets/edit-plan.example.json](assets/edit-plan.example.json)
   - [assets/font-pairings-01-12-preview.png](assets/font-pairings-01-12-preview.png)
   - [assets/font-pairings-13-22-preview.png](assets/font-pairings-13-22-preview.png)
   - [assets/safezone-composite-example.png](assets/safezone-composite-example.png)

---

## 4. Quy trình thực thi chuẩn 6 bước

1. **Bước 1 – Khảo sát Source & Kịch bản:**
   - Đọc kịch bản trong file Excel/Doc và kiểm tra các clip B-Roll trong thư mục `VIDEO NGUỒN` bằng `ffprobe` + trích xuất nhanh frame giữa của mỗi clip.
2. **Bước 2 – Lập Kế hoạch Dựng (`edit-plan.json`):**
   - Chọn chuỗi clip B-Roll bám sát 5 nhịp kịch bản.
   - Gán `N - 1` chuyển cảnh Lấp lánh (`Sparkle Transitions`) vào toàn bộ điểm cắt.
   - Chọn mã bộ Font (`Bộ 01` → `Bộ 22`) phù hợp cá tính sản phẩm.
   - Soạn các cặp chữ 2 dòng (`10 – 22` ký tự/dòng) và chọn vùng tọa độ `Y` (`Upper Safe Zone`, `Lower Safe Zone` hoặc `Mid-Lower Gap`) dựa trên frame thực tế của từng cảnh để không che mặt mẫu hay vòng tay.
3. **Bước 3 – Cân chỉnh Cỡ chữ tự động & Dựng Timeline CapCut (`scripts/build-capcut-timeline.ps1`):**
   - Script tự động đo độ rộng pixel của từng câu tiếng Việt và tính `font_size` + `clip.scale` sao cho độ rộng hiển thị đạt `52% – 60%` khung hình.
   - Khởi tạo/cập nhật `draft_content.json` của Timeline đích và đồng bộ vào `project.json`, `timeline_layout.json`, `draft_biz_config.json`.
4. **Bước 4 – Xuất Ảnh Kiểm Duyệt Safe Zone & Anti-Occlusion (`scripts/verify-safezone-and-width.ps1`):**
   - Tạo ảnh `safezone-composite.png` hiển thị toàn bộ các cảnh có chữ kèm vùng cấm TikTok màu đỏ và khung an toàn màu xanh lá.
   - Kiểm tra bằng mắt trên ảnh ghép: đảm bảo 0% chữ chạm vào mặt mẫu, 0% chữ đè lên chiếc vòng tay, 0% chữ lọt vào vùng đỏ TikTok.
5. **Bước 5 – Kích hoạt Daemon Bảo Vệ CapCut (`scripts/protect-capcut-project.ps1`):**
   - Chạy ngầm tiến trình bảo vệ để khi Sếp đóng/mở lại Project trên CapCut PC, Timeline mới hiện ra đầy đủ 100%.
6. **Bước 6 – Nghiệm thu theo `references/acceptance-checklist.md` và Báo cáo Sếp:**
   - Gửi Sếp tên Timeline vừa tạo trên CapCut kèm ảnh `safezone-composite.png` và bảng tóm tắt các cảnh.

---

## 5. Cổng dừng an toàn (Stop Gates)

- `SOURCE_MISSING`: Thiếu clip B-Roll hoặc file âm thanh gốc được chỉ định trong kịch bản.
- `FONT_MISSING`: Máy chưa cài bộ font được chọn trong `FONT VIET HOA CACH DIEU` (tự động cài bổ sung từ `e:\DỰ ÁN LỚN\VÒNG TAY\FONT VIET HOA CACH DIEU` trước khi chạy).
- `SAFEZONE_VIOLATION`: Khi phát hiện bất kỳ dòng chữ nào vượt quá `65%` chiều rộng khung hình, lọt vào vùng chết TikTok (`Y > 0.82` hoặc `Y < -0.50`), hoặc che khuất mặt mẫu / sản phẩm trên `safezone-composite.png`.

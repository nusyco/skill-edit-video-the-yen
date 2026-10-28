# Danh Mục Nghiệm Thu Trước Khi Bàn Giao (`Acceptance Checklist`)

Trước khi báo cáo hoàn thành một Timeline video vòng tay cho Sếp, A.I bắt buộc kiểm tra và tích đủ **6 hạng mục** dưới đây:

---

## 1. Kiểm tra Chuyển cảnh Lấp lánh (`100% Sparkle Transitions`)
- [ ] Số lượng chuyển cảnh trong `materials.transitions` bằng đúng **`N - 1`** (với `N` là tổng số segment video trên Track 0).
- [ ] Mọi segment video từ `0` đến `N - 2` đều có `extra_material_refs` chứa UUID của chuyển cảnh tương ứng.
- [ ] 100% chuyển cảnh thuộc danh mục **Lấp lánh (`category_name: "Lấp lánh"`)** của CapCut (`Lấp lánh mờ`, `Biến hình lấp lánh`, `Lấp lánh`, `Mờ kim sa`, `Mờ lấp lánh`, `Thu phóng lấp lánh`), thời lượng `500000` µs (`0.5s`).

## 2. Kiểm tra Cỡ chữ & Chống tràn màn hình (`Text Sizing & Anti-Overflow`)
- [ ] Độ dài mỗi dòng chữ từ `10 – 22` ký tự (`3 – 5` từ), không có câu dài lê thê.
- [ ] Đã đo chiều rộng hiển thị thực tế (`MeasureString(45px) * (font_size / 15) * clip.scale`) cho từng dòng.
- [ ] 100% các dòng chữ có chiều rộng hiển thị nằm trong dải **`48% – 62%` chiều rộng khung hình `1080px`**, không bị ngắt xuống dòng ngoài ý muốn và không chạm/tràn lề trái phải.

## 3. Kiểm tra Khung An Toàn TikTok (`TikTok Safe Zone`)
- [ ] Toàn bộ các dòng chữ có tọa độ ngang `X = 0.0` (nằm gọn trong `[-0.72, +0.72]`, không chạm vào cột nút Tim/Bình luận/Chia sẻ bên phải).
- [ ] Toàn bộ các dòng chữ có tọa độ dọc `Y ∈ [-0.48, +0.76]`:
  - Không cao hơn `+0.76` (tránh thanh tìm kiếm TikTok phía trên `Y > +0.82`).
  - Không thấp hơn `-0.48` (tránh giỏ hàng TikTok Shop, tên kênh và caption phía dưới `Y < -0.50`).

## 4. Kiểm tra Tuyệt đối KHÔNG Che Mặt Mẫu & Sản Phẩm (`Zero Occlusion`)
- [ ] Đã chạy script `scripts/verify-safezone-and-width.ps1` để xuất ảnh ghép thực tế `safezone-composite.png`.
- [ ] Đã mở xem trực tiếp ảnh `safezone-composite.png` và xác nhận bằng mắt:
  - **0% chữ đè lên gương mặt người mẫu** (mắt, mũi, miệng, cằm).
  - **0% chữ đè lên chiếc vòng tay / hộp sản phẩm** đang là tâm điểm của cảnh quay.

## 5. Kiểm tra Font chữ Tiếng Việt (`100% Vietnamese Diacritics`)
- [ ] File font `.ttf` của cả Dòng 1 và Dòng 2 đều tồn tại trong `C:\Users\nusyc\AppData\Local\Microsoft\Windows\Fonts`.
- [ ] `styles[0].range` trong JSON bằng đúng `[0, text.Length]`.
- [ ] Không có bất kỳ ký tự tiếng Việt có dấu nào bị lỗi ô vuông, mất dấu hoặc nhảy sang font mặc định hệ thống.

## 6. Kiểm tra Đồng bộ Đa Timeline CapCut (`CapCut Dock & RAM Protection`)
- [ ] Timeline mới/cập nhật đã được khai báo trong `project.json`, `timeline_layout.json` và `draft_biz_config.json`.
- [ ] Tiến trình bảo vệ ngầm `scripts/protect-capcut-project.ps1` đang chạy để đảm bảo khi Sếp đóng và mở lại Project trên CapCut PC, Timeline hiển thị đầy đủ 100%.

# Style Blueprint — Chuẩn Dựng Video Vòng Tay "The Yên"

Tài liệu này đúc kết toàn bộ DNA dựng phim từ **23 video thành phẩm** của dự án Vòng Tay "The Yên" và **Project CapCut `1012`** (`Dòng thời gian 01..12`), kết hợp các tiêu chuẩn bắt buộc của Sếp Nguyễn Sỹ Cường.

---

## 1. Cấu trúc Kịch bản 5 Nhịp Chuyển Đổi (`18s – 30s`)

Mọi video bán hàng / xây kênh của "The Yên" đều tuân theo mạch cảm xúc 5 nhịp nhằm giữ chân người xem 3 giây đầu và thúc đẩy chuyển đổi TikTok Shop / Inbox:

| Nhịp | Thời điểm | Mục tiêu | Góc máy B-Roll chuẩn | Cấu trúc Text 2 Dòng |
| :--- | :--- | :--- | :--- | :--- |
| **1. Emotional Hook** | `0.0s – 4.4s` | Chạm cảm xúc người mua quà hoặc tự thưởng cho bản thân | Mẫu nữ mặc váy sáng màu cầm/đeo vòng tự nhiên dưới nắng hoặc trong quán cafe ấm cúng | Dòng 1: Chủ đề quà tặng / dịp lễ<br>Dòng 2: Phá bỏ rào cản giá / tâm lý |
| **2. Product Hero & Fit** | `4.4s – 8.3s` | Giới thiệu tên vòng & xóa rào cản kích cỡ cổ tay | Cảnh cận vòng tay đặt trên nền cỏ/khăn lụa → Cảnh hai tay kéo khóa dây rút điều chỉnh | Cặp 2: Tên sản phẩm + `by The Yên`<br>Cặp 3: `Dây rút điều chỉnh` / `nàng nào cũng vừa size` |
| **3. Material & Craft** | `8.3s – 13.5s` | Chứng minh giá trị thật của đá tự nhiên & charm | Cận cảnh xoay cổ tay dưới nắng, đặt cạnh thẻ đen thương hiệu để nổi bật độ trong của hạt đá, vỏ sò, ngọc trai | Cặp 4: Tên loại đá chủ đạo / chất liệu phối kèm |
| **4. Meaning & Vibe** | `13.5s – 17.5s` | Gắn kết ý nghĩa phong thủy, bình an, thanh xuân | Góc trung cảnh mẫu mỉm cười nhẹ nhàng, nâng tách trà hoặc vuốt tóc lộ vòng tay | Cặp 5: Thông điệp thanh xuân / bình an / may mắn |
| **5. Packaging & CTA** | `17.5s – 24.0s` | Tăng uy tín quà tặng & kêu gọi hành động | Cận cảnh đóng hộp quà cứng cáp, túi giấy, thiệp viết tay chỉn chu | (Để trống chữ hoặc CTA ngắn gọn để người xem tập trung vào hộp quà & lời kết VO) |

---

## 2. Quy chuẩn Chuyển cảnh: 100% Điểm cắt gắn Chuyển cảnh Lấp lánh (`Sparkle Transitions`)

- **Quy tắc bắt buộc:** Không để bất kỳ điểm cắt thô (hard cut) nào giữa các phân đoạn B-Roll. Nếu có `N` đoạn video thì phải có đủ **`N - 1` chuyển cảnh**.
- **Nhóm chuyển cảnh ưu tiên tuyệt đối:** Nhóm **Lấp lánh (Sparkle)** của CapCut với thời lượng `0.5s` (`500000` µs), `is_overlap = true`. Hiệu ứng ánh sao lấp lánh tại điểm giao chuyển giúp:
  - Tạo cảm giác viên đá phong thủy và charm bạc đang bắt sáng lấp lánh.
  - Làm mượt hoàn toàn sự thay đổi góc máy từ cảnh trung sang cảnh cận (macro).

| STT | Tên hiệu ứng trong CapCut | `resource_id` / `effect_id` | Thời lượng chuẩn |
| :---: | :--- | :--- | :---: |
| 1 | **Lấp lánh mờ** | `7269672934933795329` | `0.5s` (`500000` µs) |
| 2 | **Biến hình lấp lánh** | `7452646287318454785` | `0.5s` (`500000` µs) |
| 3 | **Lấp lánh** | `7361758943661527569` | `0.5s` (`500000` µs) |
| 4 | **Mờ kim sa** | `7682682952043547911` | `0.5s` (`500000` µs) |
| 5 | **Mờ lấp lánh** | `7522416272844295441` | `0.5s` (`500000` µs) |
| 6 | **Thu phóng lấp lánh** | `7452646287326843393` | `0.5s` (`500000` µs) |

---

## 3. Quy chuẩn Typography, Kích thước Chữ & Màu sắc

### 3.1. Cấu trúc Cặp 2 Dòng (`Dual-Track Text Overlay`)
Mỗi cụm chữ xuất hiện trên màn hình luôn gồm 2 layer tách biệt trên 2 track độc lập (`Track 2` và `Track 3`) nhưng đồng bộ thời gian bắt đầu/kết thúc:
- **Dòng 1 (`Track 2` - Tiêu đề chính):**
  - Font: Chữ có chân sang trọng (Luxury Serif / Display) hoặc chữ viết thường thanh lịch (`Bộ 01` → `Bộ 22`).
  - Màu chữ (`fill`): Vàng kem ấm **`#F9DE90`** (`rgb: [0.976, 0.871, 0.565]`).
  - Viền chữ (`stroke`): Nâu trầm **`#583D27`** (`rgb: [0.345, 0.239, 0.153]`), độ dày `width = 0.08`.
- **Dòng 2 (`Track 3` - Phụ đề cảm xúc):**
  - Font: Chữ ký / chữ viết tay mềm mại (Script / Handwritten).
  - Màu chữ (`fill`): Trắng tinh khôi **`#FFFFFF`** (`rgb: [1.0, 1.0, 1.0]`).
  - Đổ bóng (`shadow`) hoặc viền nâu mảnh: Giúp chữ trắng luôn nổi bật kể cả khi nền video là váy trắng hoặc ánh nắng gắt.

### 3.2. Công thức Cân chỉnh Cỡ chữ Chống Tràn (`48% – 62%` Chiều ngang)
- Trong CapCut, mỗi text material có `line_max_width = 0.82` (tự động xuống dòng nếu độ rộng chưa scale vượt `82%` màn hình).
- Để chữ **không quá bé** (khó đọc trên điện thoại) và **không quá to / tràn màn hình**:
  - Giới hạn số ký tự mỗi dòng: **`10 – 22 ký tự`** (`3 – 5 từ`).
  - Đo độ rộng thực tế bằng `System.Drawing.Graphics.MeasureString(text, font_45px)` (`rawW`).
  - Chọn `font_size ∈ [11, 15]` và `clip.scale ∈ [1.02, 1.45]` sao cho:
    $$\text{EffectiveWidth} = \text{rawW} \times \frac{\text{font\_size}}{15.0} \times \text{clip.scale} \in [310, 355]$$
  - Tương đương **`52% – 60%` chiều rộng khung hình `1080px`** (cách đều hai lề trái/phải mỗi bên `215px – 260px`).

---

## 4. Khung An Toàn TikTok & Quy tắc Tuyệt đối KHÔNG Che Mặt Mẫu / Sản Phẩm

### 4.1. Bản đồ Vùng Chết Giao Diện TikTok (`1080×1920`)
Trong hệ tọa độ chuẩn hóa của CapCut (`X ∈ [-1.0, +1.0]` từ trái sang phải; `Y ∈ [-1.0, +1.0]` từ dưới lên trên):
- **Vùng chết Đỉnh (`Y > +0.82`, tương đương `150px` trên cùng):** Bị che bởi thanh trạng thái điện thoại, nút LIVE, tab "Đang Follow / Dành cho bạn" và thanh tìm kiếm.
- **Vùng chết Đáy (`Y < -0.50`, tương đương `420px` dưới cùng):** Bị che bởi gắn giỏ hàng vàng TikTok Shop, tên tài khoản `@theyen`, mô tả video (caption), tên bài nhạc và thanh điều hướng.
- **Vùng chết Cạnh Phải (`X > +0.72` tại `Y ∈ [-0.50, +0.20]`, tương đương `150px` bên phải):** Bị che bởi cột nút tương tác (Avatar, Thả tim, Bình luận, Lưu, Chia sẻ, Đĩa nhạc xoay).

### 4.2. Ba Vùng Đặt Chữ Chuẩn (Tự động chọn theo bố cục chủ thể của từng cảnh)
Trước khi đặt chữ cho bất kỳ phân đoạn nào, phải kiểm tra vị trí **Gương mặt người mẫu** và **Chiếc vòng tay** trên frame hình của phân đoạn đó:

1. **Vùng An Toàn Dưới (`Lower Safe Zone`: `Y1 = -0.35..-0.39`, `Y2 = -0.44..-0.47`):**
   - **Khi nào dùng:** Khi cảnh quay là **cận cảnh sản phẩm (Macro/Close-up)** đặt ở chính giữa khung hình (`Y ∈ [-0.25, +0.35]`), không có vật thể quan trọng ở phần tư dưới.
   - **Hiệu quả:** Nằm ngay dưới sản phẩm nhưng vẫn cao hơn giỏ hàng TikTok Shop (`Y = -0.50`).
2. **Vùng An Toàn Trên Đỉnh Đầu (`Upper Safe Zone`: `Y1 = +0.64..+0.66`, `Y2 = +0.55..+0.57`):**
   - **Khi nào dùng:** Khi cảnh quay **có mặt người mẫu ở vùng giữa (`Y ∈ [-0.05, +0.45]`) VÀ cổ tay đeo vòng nằm ở vùng dưới (`Y ∈ [-0.50, -0.15]`)**.
   - **Hiệu quả:** Nếu đặt chữ ở dưới sẽ đè thẳng lên chiếc vòng tay; đưa chữ lên vùng trống phía trên đầu mẫu (`+0.55..+0.66`) giúp **100% gương mặt và 100% chiếc vòng tay hoàn toàn thông thoáng**, đồng thời vẫn nằm dưới vùng chết đỉnh TikTok (`+0.82`).
3. **Khe Trống Trung Tâm Dưới (`Mid-Lower Gap`: `Y1 = -0.25`, `Y2 = -0.34`):**
   - **Khi nào dùng:** Khi mặt mẫu ở nửa trên cao (`Y > +0.15`) và hai bàn tay thao tác kéo dây rút vòng ở sát biên dưới (`Y ≈ -0.48`), tạo ra vùng ngực áo trơn màu ở khoảng `Y ∈ [-0.36, -0.18]`.

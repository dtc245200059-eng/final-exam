# BÀI KIỂM TRA CUỐI MODULE: PHÁT TRIỂN ỨNG DỤNG WEB VỚI JSP & SERVLET

**Hệ Thống Quản Lý Sản Phẩm (Product Management Web Application)**

---

## 📌 THÔNG TIN HỌC VIÊN / SINH VIÊN
- **Họ và tên:** dtc245200059-eng
- **Mã sinh viên:** `DTC245200059`
- **Email:** `dtc245200059@ictu.edu.vn`
- **Tên file nộp bài:** `DTC245200059_FinalExam.zip`

---

## 🚀 GIỚI THIỆU DỰ ÁN
Dự án được xây dựng theo mô hình kiến trúc **MVC (Model - View - Controller)** kết hợp với tầng **DAO (Data Access Object)** chuẩn trong lập trình Java Web. Ứng dụng cung cấp các chức năng quản trị danh mục sản phẩm hoàn chỉnh, kết nối cơ sở dữ liệu MySQL thông qua JDBC.

### ✨ Các Tính Năng Chính
1. **Hiển thị danh sách sản phẩm:**
   - Hiển thị danh sách sản phẩm dưới dạng bảng hiện đại, trực quan.
   - Hiển thị đầy đủ các trường: `Mã ID`, `Tên sản phẩm`, `Giá bán (VNĐ)`, `Số lượng tồn kho`, `Trạng thái hàng`, và `Thao tác`.
   - Định dạng tiền tệ tự động theo chuẩn VNĐ.
   - Hiển thị badge trạng thái trực quan: *Còn hàng* (xanh lá), *Sắp hết* (vàng), *Hết hàng* (đỏ).
2. **Thêm sản phẩm mới:**
   - Cung cấp form nhập thông tin sản phẩm mới (`Tên sản phẩm`, `Giá bán`, `Số lượng`).
   - Kiểm tra tính hợp lệ dữ liệu (Validation) ở cả giao diện (Client) và Servlet (Server): tên không được rỗng, giá > 0, số lượng >= 0.
   - Hiển thị thông báo Alert thành công hoặc thông báo lỗi nếu dữ liệu không hợp lệ.
3. **Chỉnh sửa thông tin sản phẩm:**
   - Cho phép chọn sản phẩm bất kỳ từ danh sách để sửa.
   - Form chỉnh sửa tự động điền sẵn các thông tin hiện tại của sản phẩm.
   - Cập nhật an toàn và chuyển hướng về trang danh sách với thông báo thành công.
4. **Xóa sản phẩm (Có xác nhận an toàn):**
   - Hộp thoại Modal hiện đại xuất hiện yêu cầu người dùng xác nhận trước khi xóa, ngăn ngừa việc vô tình bấm nhầm.
   - Xóa trực tiếp trong MySQL và cập nhật danh sách ngay lập tức.
5. **Tìm kiếm sản phẩm theo tên (Tính năng mở rộng):**
   - Thanh tìm kiếm tức thời theo từ khóa tên sản phẩm.
   - Hỗ trợ nút đặt lại danh sách (Reset filter) tiện lợi.

---

## 🛠️ CÔNG NGHỆ SỬ DỤNG
- **Ngôn ngữ & Nền tảng:** Java 17+ (hoặc tương thích Java 11/8)
- **Backend:** Java Servlet (Jakarta Servlet API 6.0)
- **Frontend:** JSP (JavaServer Pages), JSTL (Jakarta Standard Tag Library), HTML5, CSS3, JavaScript ES6
- **Database:** MySQL 8.0+
- **Kết nối CSDL:** JDBC (MySQL Connector/J)
- **Quản lý dự án:** Apache Maven
- **Server:** Apache Tomcat 10.x / 10.1.x

---

## 📂 CẤU TRÚC THƯ MỤC DỰ ÁN
```text
DTC245200059_FinalExam/
├── .gitignore
├── pom.xml                                  # Cấu hình dependency Maven
├── README.md                                # Tài liệu hướng dẫn sử dụng
├── database.sql                             # Script khởi tạo Database & Bảng & Dữ liệu mẫu
├── DTC245200059_FinalExam.zip               # File nén toàn bộ mã nguồn để nộp bài
└── src/
    └── main/
        ├── java/
        │   └── com/codegym/
        │       ├── controller/
        │       │   └── ProductServlet.java   # Servlet điều hướng và xử lý request
        │       ├── dao/
        │       │   ├── DBConnection.java     # Quản lý kết nối JDBC MySQL
        │       │   ├── IProductDAO.java      # Interface các phương thức DAO
        │       │   └── ProductDAO.java       # Thực thi CRUD với PreparedStatement
        │       └── model/
        │           └── Product.java          # Đối tượng thực thể Sản phẩm (JavaBean)
        ├── resources/
        │   ├── database.sql                  # Bản sao script SQL
        │   └── db.properties                 # File cấu hình kết nối CSDL
        └── webapp/
            ├── assets/
            │   ├── css/
            │   │   └── style.css             # Giao diện CSS tùy biến cao cấp
            │   └── js/
            │       └── app.js                # Xử lý Modal, Alert và xác thực form
            ├── views/
            │   ├── common/
            │   │   ├── header.jsp            # Header & Navbar dùng chung
            │   │   └── footer.jsp            # Footer & Script dùng chung
            │   ├── product/
            │   │   ├── list.jsp              # Trang danh sách & Modal xóa
            │   │   ├── create.jsp            # Trang form thêm sản phẩm
            │   │   └── edit.jsp              # Trang form chỉnh sửa sản phẩm
            │   └── error/
            │       └── 404.jsp               # Trang xử lý lỗi 404
            ├── WEB-INF/
            │   └── web.xml                   # Cấu hình Deployment Descriptor
            └── index.jsp                     # Trang gốc tự động chuyển hướng vào /products
```

---

## ⚙️ HƯỚNG DẪN CÀI ĐẶT & CHẠY ỨNG DỤNG

### Bước 1: Khởi tạo Cơ sở dữ liệu MySQL
1. Mở **MySQL Workbench**, **DBeaver**, **Navicat** hoặc terminal MySQL:
   ```bash
   mysql -u root -p
   ```
2. Chạy toàn bộ file script [database.sql](database.sql) có sẵn trong dự án. Script sẽ tự động:
   - Tạo cơ sở dữ liệu `product_management`
   - Tạo bảng `products` với các cột: `id`, `name`, `price`, `quantity`
   - Chèn 10 sản phẩm mẫu đa dạng để kiểm tra.

### Bước 2: Cấu hình thông tin kết nối Cơ sở dữ liệu
Mở file [src/main/resources/db.properties](src/main/resources/db.properties) và điều chỉnh mật khẩu MySQL phù hợp với máy của bạn:
```properties
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/product_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8
db.user=root
db.password=root   # <-- Đổi thành mật khẩu root MySQL trên máy của bạn (ví dụ: 123456 hoặc để trống)
```

### Bước 3: Chạy ứng dụng trên Apache Tomcat
#### Cách 1: Chạy bằng IntelliJ IDEA Ultimate (Khuyên dùng)
1. Mở thư mục dự án trong IntelliJ IDEA (`Open` -> chọn thư mục dự án).
2. Chờ Maven tải các dependency.
3. Vào menu **Run** -> **Edit Configurations...** -> Click **+** -> chọn **Tomcat Server** -> **Local**.
4. Chọn đường dẫn tới thư mục **Apache Tomcat 10.x**.
5. Trong tab **Deployment**: Nhấn dấu **+** -> Chọn **Artifact...** -> Chọn `product-management:war exploded`.
6. Đặt **Application context** là: `/` (hoặc `/product-management`).
7. Nhấn **Apply** -> **Run**. Trình duyệt sẽ tự động mở trang web.

#### Cách 2: Đóng gói WAR và deploy thủ công
1. Chạy lệnh đóng gói Maven:
   ```bash
   mvn clean package
   ```
2. Copy file `target/product-management.war` vào thư mục `webapps/` của Apache Tomcat 10.
3. Khởi động Tomcat (`bin/startup.bat` trên Windows hoặc `bin/startup.sh` trên Linux/macOS).
4. Truy cập trình duyệt:
   ```text
   http://localhost:8080/product-management/products
   ```

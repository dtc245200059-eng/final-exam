-- ======================================================
-- BÀI KIỂM TRA CUỐI MODULE: PHÁT TRIỂN ỨNG DỤNG WEB VỚI JSP & SERVLET
-- HỌC VIÊN / SINH VIÊN: DTC245200059
-- CƠ SỞ DỮ LIỆU: QUẢN LÝ SẢN PHẨM (product_management)
-- ======================================================

CREATE DATABASE IF NOT EXISTS `product_management`
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE `product_management`;

-- Tạo bảng products
DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `price` DOUBLE NOT NULL,
    `quantity` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu mẫu (Sample data)
INSERT INTO `products` (`name`, `price`, `quantity`) VALUES
('iPhone 15 Pro Max 256GB', 29990000, 15),
('Samsung Galaxy S24 Ultra 512GB', 27490000, 20),
('MacBook Air M2 13 inch 16GB', 24990000, 8),
('Laptop Asus ROG Zephyrus G16', 38990000, 5),
('Bàn phím cơ Logitech MX Mechanical', 3690000, 25),
('Chuột công thái học Logitech MX Master 3S', 2290000, 40),
('Tai nghe chống ồn Sony WH-1000XM5', 6890000, 12),
('Màn hình Dell UltraSharp U2724D 27 inch 2K', 9590000, 10),
('Apple Watch Series 9 GPS 45mm', 9990000, 18),
('Loa Bluetooth Marshall Acton III', 6490000, 14);

-- Kiểm tra dữ liệu vừa thêm
SELECT * FROM `products`;

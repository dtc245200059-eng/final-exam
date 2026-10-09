package com.codegym.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Lớp tiện ích quản lý kết nối cơ sở dữ liệu MySQL qua JDBC
 */
public class DBConnection {

    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/product_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8";
    private static String user = "root";
    private static String password = "root";

    static {
        loadProperties();
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy MySQL Driver: " + e.getMessage());
        }
    }

    /**
     * Đọc cấu hình từ file db.properties nếu tồn tại
     */
    private static void loadProperties() {
        Properties props = new Properties();
        try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input != null) {
                props.load(input);
                if (props.getProperty("db.driver") != null) driver = props.getProperty("db.driver");
                if (props.getProperty("db.url") != null) url = props.getProperty("db.url");
                if (props.getProperty("db.user") != null) user = props.getProperty("db.user");
                if (props.getProperty("db.password") != null) password = props.getProperty("db.password");
            }
        } catch (IOException e) {
            System.err.println("Không thể đọc db.properties, sử dụng cấu hình mặc định: " + e.getMessage());
        }
    }

    /**
     * Mở một kết nối mới tới MySQL database
     *
     * @return Connection đối tượng kết nối
     * @throws SQLException nếu có lỗi kết nối
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    /**
     * Đóng an toàn kết nối
     *
     * @param connection kết nối cần đóng
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng kết nối: " + e.getMessage());
            }
        }
    }
}

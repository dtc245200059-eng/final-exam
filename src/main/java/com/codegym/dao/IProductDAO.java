package com.codegym.dao;

import com.codegym.model.Product;
import java.util.List;

/**
 * Interface định nghĩa các phương thức thao tác dữ liệu với bảng products
 */
public interface IProductDAO {

    /**
     * Lấy toàn bộ danh sách sản phẩm
     *
     * @return danh sách sản phẩm
     */
    List<Product> selectAllProducts();

    /**
     * Tìm sản phẩm theo mã ID
     *
     * @param id mã sản phẩm
     * @return đối tượng Product nếu tìm thấy, null nếu không tồn tại
     */
    Product selectProduct(int id);

    /**
     * Thêm mới một sản phẩm vào cơ sở dữ liệu
     *
     * @param product sản phẩm cần thêm
     * @return true nếu thêm thành công, false nếu thất bại
     */
    boolean insertProduct(Product product);

    /**
     * Cập nhật thông tin sản phẩm
     *
     * @param product sản phẩm với thông tin mới
     * @return true nếu cập nhật thành công, false nếu thất bại
     */
    boolean updateProduct(Product product);

    /**
     * Xóa sản phẩm khỏi cơ sở dữ liệu theo mã ID
     *
     * @param id mã sản phẩm cần xóa
     * @return true nếu xóa thành công, false nếu thất bại
     */
    boolean deleteProduct(int id);

    /**
     * Tìm kiếm sản phẩm theo tên (hỗ trợ tìm gần đúng)
     *
     * @param keyword từ khóa tìm kiếm
     * @return danh sách sản phẩm phù hợp
     */
    List<Product> searchByName(String keyword);
}

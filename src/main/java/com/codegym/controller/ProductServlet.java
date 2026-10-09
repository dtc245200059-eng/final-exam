package com.codegym.controller;

import com.codegym.dao.IProductDAO;
import com.codegym.dao.ProductDAO;
import com.codegym.model.Product;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet điều hướng và xử lý các yêu cầu liên quan đến Sản phẩm
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            case "list":
            default:
                listProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    /**
     * Hiển thị danh sách tất cả sản phẩm
     */
    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productDAO.selectAllProducts();
        request.setAttribute("products", products);

        String message = request.getParameter("message");
        if (message != null) {
            switch (message) {
                case "create_success":
                    request.setAttribute("successMessage", "Thêm sản phẩm mới thành công!");
                    break;
                case "update_success":
                    request.setAttribute("successMessage", "Cập nhật thông tin sản phẩm thành công!");
                    break;
                case "delete_success":
                    request.setAttribute("successMessage", "Xóa sản phẩm thành công!");
                    break;
                case "delete_error":
                    request.setAttribute("errorMessage", "Không thể xóa sản phẩm. Vui lòng thử lại!");
                    break;
                case "not_found":
                    request.setAttribute("errorMessage", "Sản phẩm không tồn tại!");
                    break;
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Hiển thị biểu mẫu thêm mới sản phẩm
     */
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/create.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Xử lý thêm sản phẩm mới
     */
    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        String errorMessage = validateProductInput(name, priceStr, quantityStr);
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("name", name);
            request.setAttribute("price", priceStr);
            request.setAttribute("quantity", quantityStr);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/create.jsp");
            dispatcher.forward(request, response);
            return;
        }

        double price = Double.parseDouble(priceStr.trim());
        int quantity = Integer.parseInt(quantityStr.trim());

        Product newProduct = new Product(name.trim(), price, quantity);
        boolean success = productDAO.insertProduct(newProduct);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/products?message=create_success");
        } else {
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi lưu vào cơ sở dữ liệu!");
            request.setAttribute("product", newProduct);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/create.jsp");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Hiển thị biểu mẫu sửa thông tin sản phẩm
     */
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/products?message=not_found");
            return;
        }

        try {
            int id = Integer.parseInt(idStr.trim());
            Product existingProduct = productDAO.selectProduct(id);
            if (existingProduct != null) {
                request.setAttribute("product", existingProduct);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/edit.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/products?message=not_found");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/products?message=not_found");
        }
    }

    /**
     * Xử lý cập nhật thông tin sản phẩm
     */
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        int id;
        try {
            id = Integer.parseInt(idStr.trim());
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/products?message=not_found");
            return;
        }

        String errorMessage = validateProductInput(name, priceStr, quantityStr);
        if (errorMessage != null) {
            Product currentProduct = new Product(id, name, 0, 0);
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("product", currentProduct);
            request.setAttribute("priceInput", priceStr);
            request.setAttribute("quantityInput", quantityStr);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/edit.jsp");
            dispatcher.forward(request, response);
            return;
        }

        double price = Double.parseDouble(priceStr.trim());
        int quantity = Integer.parseInt(quantityStr.trim());

        Product product = new Product(id, name.trim(), price, quantity);
        boolean success = productDAO.updateProduct(product);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/products?message=update_success");
        } else {
            request.setAttribute("errorMessage", "Không thể cập nhật sản phẩm. Vui lòng thử lại!");
            request.setAttribute("product", product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Xử lý xóa sản phẩm theo ID
     */
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr.trim());
                boolean success = productDAO.deleteProduct(id);
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/products?message=delete_success");
                    return;
                }
            } catch (NumberFormatException ignored) {
            }
        }
        response.sendRedirect(request.getContextPath() + "/products?message=delete_error");
    }

    /**
     * Tìm kiếm sản phẩm theo tên
     */
    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> products;
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productDAO.searchByName(keyword.trim());
            request.setAttribute("keyword", keyword.trim());
        } else {
            products = productDAO.selectAllProducts();
        }
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Kiểm tra tính hợp lệ của dữ liệu đầu vào
     */
    private String validateProductInput(String name, String priceStr, String quantityStr) {
        if (name == null || name.trim().isEmpty()) {
            return "Tên sản phẩm không được để trống!";
        }
        if (name.trim().length() > 255) {
            return "Tên sản phẩm không được vượt quá 255 ký tự!";
        }

        if (priceStr == null || priceStr.trim().isEmpty()) {
            return "Giá sản phẩm không được để trống!";
        }
        try {
            double price = Double.parseDouble(priceStr.trim());
            if (price <= 0) {
                return "Giá sản phẩm phải lớn hơn 0!";
            }
        } catch (NumberFormatException e) {
            return "Giá sản phẩm phải là một số hợp lệ!";
        }

        if (quantityStr == null || quantityStr.trim().isEmpty()) {
            return "Số lượng không được để trống!";
        }
        try {
            int quantity = Integer.parseInt(quantityStr.trim());
            if (quantity < 0) {
                return "Số lượng không được là số âm!";
            }
        } catch (NumberFormatException e) {
            return "Số lượng phải là một số nguyên hợp lệ!";
        }

        return null;
    }
}

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/views/common/header.jsp">
    <jsp:param name="title" value="Chỉnh Sửa Sản Phẩm - ProductHub" />
    <jsp:param name="active" value="list" />
</jsp:include>

<main class="main-content">
    <div class="form-container">
        <!-- Page Header -->
        <div class="page-header">
            <div>
                <h1 class="page-title">
                    <i class="fa-solid fa-pen-to-square text-primary"></i>
                    Cập Nhật Thông Tin Sản Phẩm
                </h1>
                <p class="page-subtitle">Chỉnh sửa thông tin cho sản phẩm #${product.id}</p>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">
                    <i class="fa-solid fa-arrow-left"></i>
                    <span>Quay lại</span>
                </a>
            </div>
        </div>

        <!-- Error Alert -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <div class="alert-content">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    <span>${errorMessage}</span>
                </div>
                <button type="button" class="alert-close">&times;</button>
            </div>
        </c:if>

        <!-- Form Card -->
        <div class="card">
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/products" method="post">
                    <input type="hidden" name="action" value="edit" />
                    <input type="hidden" name="id" value="${product.id}" />

                    <!-- Product ID (Read-only Display) -->
                    <div class="form-group">
                        <label class="form-label">Mã Sản Phẩm (ID)</label>
                        <input type="text" 
                               class="form-control" 
                               value="#${product.id}" 
                               disabled 
                               style="background-color: var(--slate-100); color: var(--slate-600); cursor: not-allowed;" />
                        <div class="form-help">Mã ID là khóa chính tự động tăng, không thể thay đổi.</div>
                    </div>

                    <!-- Product Name -->
                    <div class="form-group">
                        <label for="name" class="form-label">
                            Tên Sản Phẩm <span class="required">*</span>
                        </label>
                        <input type="text" 
                               id="name" 
                               name="name" 
                               class="form-control" 
                               value="${product.name}" 
                               required 
                               maxlength="255" />
                        <div class="form-help">Tên hiển thị của sản phẩm (tối đa 255 ký tự).</div>
                    </div>

                    <!-- Product Price -->
                    <div class="form-group">
                        <label for="price" class="form-label">
                            Giá Bán (VNĐ) <span class="required">*</span>
                        </label>
                        <input type="number" 
                               step="1000" 
                               min="1000" 
                               id="price" 
                               name="price" 
                               class="form-control" 
                               value="${priceInput != null ? priceInput : product.price}" 
                               required />
                        <div class="form-help">Giá bán sản phẩm tính theo đồng Việt Nam (phải lớn hơn 0).</div>
                    </div>

                    <!-- Product Quantity -->
                    <div class="form-group">
                        <label for="quantity" class="form-label">
                            Số Lượng Tồn Kho <span class="required">*</span>
                        </label>
                        <input type="number" 
                               min="0" 
                               id="quantity" 
                               name="quantity" 
                               class="form-control" 
                               value="${quantityInput != null ? quantityInput : product.quantity}" 
                               required />
                        <div class="form-help">Số lượng hiện có sẵn trong kho hàng (không âm).</div>
                    </div>

                    <!-- Form Actions -->
                    <div class="form-actions">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">
                            <i class="fa-solid fa-xmark"></i> Hủy Bỏ
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-floppy-disk"></i> Cập Nhật Thay Đổi
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/common/footer.jsp" />

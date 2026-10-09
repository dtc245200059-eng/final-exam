<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/views/common/header.jsp">
    <jsp:param name="title" value="Thêm Sản Phẩm Mới - ProductHub" />
    <jsp:param name="active" value="create" />
</jsp:include>

<main class="main-content">
    <div class="form-container">
        <!-- Page Header -->
        <div class="page-header">
            <div>
                <h1 class="page-title">
                    <i class="fa-solid fa-plus-circle text-primary"></i>
                    Thêm Sản Phẩm Mới
                </h1>
                <p class="page-subtitle">Nhập thông tin chi tiết để thêm sản phẩm vào hệ thống</p>
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
                    <input type="hidden" name="action" value="create" />

                    <!-- Product Name -->
                    <div class="form-group">
                        <label for="name" class="form-label">
                            Tên Sản Phẩm <span class="required">*</span>
                        </label>
                        <input type="text" 
                               id="name" 
                               name="name" 
                               class="form-control" 
                               placeholder="Ví dụ: iPhone 15 Pro Max 256GB" 
                               value="${name != null ? name : (product != null ? product.name : '')}" 
                               required 
                               maxlength="255" />
                        <div class="form-help">Tên định danh hiển thị của sản phẩm (tối đa 255 ký tự).</div>
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
                               placeholder="Ví dụ: 29990000" 
                               value="${price != null ? price : (product != null && product.price > 0 ? product.price : '')}" 
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
                               placeholder="Ví dụ: 50" 
                               value="${quantity != null ? quantity : (product != null && product.quantity >= 0 ? product.quantity : '0')}" 
                               required />
                        <div class="form-help">Số lượng hiện có sẵn trong kho hàng (không âm).</div>
                    </div>

                    <!-- Form Actions -->
                    <div class="form-actions">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">
                            <i class="fa-solid fa-xmark"></i> Hủy Bỏ
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-floppy-disk"></i> Lưu Sản Phẩm
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/common/footer.jsp" />

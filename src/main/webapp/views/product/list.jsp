<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="/views/common/header.jsp">
    <jsp:param name="title" value="Danh Sách Sản Phẩm - ProductHub" />
    <jsp:param name="active" value="list" />
</jsp:include>

<main class="main-content">
    <!-- Success Alert -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
            <div class="alert-content">
                <i class="fa-solid fa-circle-check"></i>
                <span>${successMessage}</span>
            </div>
            <button type="button" class="alert-close">&times;</button>
        </div>
    </c:if>

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

    <!-- Header Section -->
    <div class="page-header">
        <div>
            <h1 class="page-title">
                <i class="fa-solid fa-layer-group text-primary"></i>
                Danh Sách Sản Phẩm
            </h1>
            <p class="page-subtitle">Quản lý toàn bộ thông tin sản phẩm trong cơ sở dữ liệu hệ thống</p>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-primary">
                <i class="fa-solid fa-plus"></i>
                <span>Thêm Sản Phẩm Mới</span>
            </a>
        </div>
    </div>

    <!-- Product Card -->
    <div class="card">
        <div class="card-header">
            <div>
                <strong>Tổng số sản phẩm:</strong> 
                <span class="badge badge-in-stock">${products.size()} sản phẩm</span>
            </div>

            <!-- Search Form -->
            <form action="${pageContext.request.contextPath}/products" method="get" class="search-form">
                <input type="hidden" name="action" value="search" />
                <div class="search-input-group">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" 
                           name="keyword" 
                           class="search-input" 
                           placeholder="Tìm kiếm theo tên sản phẩm..." 
                           value="${keyword != null ? keyword : ''}" />
                </div>
                <button type="submit" class="btn btn-secondary">
                    <i class="fa-solid fa-search"></i>
                    <span>Tìm</span>
                </button>
                <c:if test="${not empty keyword}">
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary" title="Xóa tìm kiếm">
                        <i class="fa-solid fa-rotate-left"></i>
                        <span>Đặt lại</span>
                    </a>
                </c:if>
            </form>
        </div>

        <!-- Product Table -->
        <div class="table-responsive">
            <c:choose>
                <c:when test="${not empty products}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width: 80px;">Mã ID</th>
                                <th>Tên Sản Phẩm</th>
                                <th style="width: 180px;">Giá Bán</th>
                                <th style="width: 140px;">Số Lượng</th>
                                <th style="width: 140px;">Trạng Thái</th>
                                <th style="width: 180px; text-align: center;">Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="prod" items="${products}">
                                <tr>
                                    <td>
                                        <span class="product-id-badge">#${prod.id}</span>
                                    </td>
                                    <td>
                                        <div class="product-name">${prod.name}</div>
                                    </td>
                                    <td>
                                        <div class="product-price">
                                            <fmt:formatNumber value="${prod.price}" type="currency" currencySymbol="₫" maxFractionDigits="0" />
                                        </div>
                                    </td>
                                    <td>
                                        <strong>${prod.quantity}</strong> cái
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${prod.quantity == 0}">
                                                <span class="badge badge-out-of-stock">
                                                    <i class="fa-solid fa-circle-xmark"></i> Hết hàng
                                                </span>
                                            </c:when>
                                            <c:when test="${prod.quantity <= 10}">
                                                <span class="badge badge-low-stock">
                                                    <i class="fa-solid fa-triangle-exclamation"></i> Sắp hết
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-in-stock">
                                                    <i class="fa-solid fa-check"></i> Còn hàng
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="action-buttons" style="justify-content: center;">
                                            <a href="${pageContext.request.contextPath}/products?action=edit&id=${prod.id}" 
                                               class="btn btn-sm btn-edit" 
                                               title="Sửa thông tin sản phẩm">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                                <span>Sửa</span>
                                            </a>
                                            <button type="button" 
                                                    class="btn btn-sm btn-delete" 
                                                    onclick="confirmDelete(${prod.id}, '${prod.name}')" 
                                                    title="Xóa sản phẩm">
                                                <i class="fa-solid fa-trash-can"></i>
                                                <span>Xóa</span>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon">
                            <i class="fa-solid fa-box-open"></i>
                        </div>
                        <h3 class="empty-title">Không tìm thấy sản phẩm nào!</h3>
                        <p class="empty-text">
                            <c:choose>
                                <c:when test="${not empty keyword}">
                                    Không có sản phẩm nào khớp với từ khóa "<strong>${keyword}</strong>".
                                </c:when>
                                <c:otherwise>
                                    Hiện tại chưa có sản phẩm nào trong cơ sở dữ liệu.
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-primary">
                            <i class="fa-solid fa-plus"></i> Thêm sản phẩm đầu tiên
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

<!-- Delete Confirmation Modal Dialog -->
<div id="deleteModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <div class="modal-icon-danger">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>
            <h3 class="modal-title">Xác Nhận Xóa Sản Phẩm</h3>
        </div>
        <div class="modal-body">
            <p>Bạn có chắc chắn muốn xóa sản phẩm:</p>
            <p style="margin: 0.75rem 0; font-weight: 700; color: var(--dark); font-size: 1.05rem;" id="deleteProductName"></p>
            <p style="color: var(--danger); font-size: 0.85rem;">
                <i class="fa-solid fa-circle-info"></i> Thao tác này sẽ xóa vĩnh viễn sản phẩm khỏi cơ sở dữ liệu và không thể hoàn tác!
            </p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="closeDeleteModal()">
                Hủy Bỏ
            </button>
            <form id="deleteForm" method="get" action="" style="margin: 0;">
                <button type="submit" class="btn btn-danger">
                    <i class="fa-solid fa-trash-can"></i> Xác Nhận Xóa
                </button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/views/common/footer.jsp" />

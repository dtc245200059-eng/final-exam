<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title != null ? param.title : "Hệ Thống Quản Lý Sản Phẩm"}</title>
    
    <!-- Google Fonts & Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <!-- Top Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="${pageContext.request.contextPath}/products" class="brand-logo">
                <div class="brand-icon">
                    <i class="fa-solid fa-boxes-stacked"></i>
                </div>
                <span>ProductHub</span>
                <span class="brand-badge">JSP & Servlet</span>
            </a>
            
            <ul class="nav-links">
                <li>
                    <a href="${pageContext.request.contextPath}/products" class="nav-link ${param.active == 'list' ? 'active' : ''}">
                        <i class="fa-solid fa-list-check"></i>
                        <span>Danh Sách Sản Phẩm</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/products?action=create" class="nav-link ${param.active == 'create' ? 'active' : ''}">
                        <i class="fa-solid fa-plus-circle"></i>
                        <span>Thêm Sản Phẩm Mới</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    
    <script>
        const contextPath = "${pageContext.request.contextPath}";
    </script>

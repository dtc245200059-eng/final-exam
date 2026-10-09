<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Không Tìm Thấy Trang</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div style="min-height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; padding: 2rem;">
        <div>
            <div style="font-size: 5rem; font-weight: 800; color: var(--primary); line-height: 1;">404</div>
            <h1 style="font-size: 1.75rem; margin: 1rem 0 0.5rem; color: var(--dark);">Trang Không Tồn Tại</h1>
            <p style="color: var(--slate-600); margin-bottom: 2rem; max-width: 450px;">
                Đường dẫn bạn yêu cầu không tồn tại hoặc đã bị xóa khỏi hệ thống.
            </p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">
                <i class="fa-solid fa-house"></i> Quay Về Trang Quản Lý
            </a>
        </div>
    </div>
</body>
</html>

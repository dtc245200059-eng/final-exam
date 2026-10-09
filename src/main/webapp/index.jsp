<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.sendRedirect(request.getContextPath() + "/products");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đang chuyển hướng...</title>
    <meta http-equiv="refresh" content="0;url=${pageContext.request.contextPath}/products">
</head>
<body style="font-family: Arial, sans-serif; text-align: center; margin-top: 50px;">
    <p>Đang chuyển hướng tới Hệ thống Quản lý Sản phẩm...</p>
    <p>Nếu trang không tự chuyển, vui lòng <a href="${pageContext.request.contextPath}/products">bấm vào đây</a>.</p>
</body>
</html>

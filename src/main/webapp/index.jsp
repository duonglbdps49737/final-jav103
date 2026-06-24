<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/list">Danh sách sinh viên</a>
<a href="${pageContext.request.contextPath}/change-password">Thay đổi mật khẩu</a>
<a href="${pageContext.request.contextPath}/detail">Tìm sinh viên theo email</a>
<a href="${pageContext.request.contextPath}/regiter">Đăng ký thêm sinh viên</a>
</body>
</html>
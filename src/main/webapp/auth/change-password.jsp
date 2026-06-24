<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark text-center">
                    <h4 class="mb-0">Đổi Mật Khẩu</h4>
                </div>
                <div class="card-body">

                    <%-- Hiển thị lỗi nếu có --%>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">${errorMessage}</div>
                    </c:if>
                    <%-- Hiển thị thành công nếu có --%>
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">${successMessage}</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/change-password" method="post">
                        <div class="mb-3">
                            <label for="matKhauCu" class="form-label">
                                Mật khẩu hiện tại <span class="text-danger">*</span>
                            </label>
                            <input type="password" id="matKhauCu" name="matKhauCu"
                                   class="form-control" required
                                   placeholder="Nhập mật khẩu hiện tại">
                        </div>

                        <div class="mb-3">
                            <label for="matKhauMoi" class="form-label">
                                Mật khẩu mới <span class="text-danger">*</span>
                            </label>
                            <input type="password" id="matKhauMoi" name="matKhauMoi"
                                   class="form-control" required
                                   placeholder="Tối thiểu 6 ký tự">
                        </div>

                        <div class="mb-3">
                            <label for="xacNhanMatKhauMoi" class="form-label">
                                Xác nhận mật khẩu mới <span class="text-danger">*</span>
                            </label>
                            <input type="password" id="xacNhanMatKhauMoi" name="xacNhanMatKhauMoi"
                                   class="form-control" required
                                   placeholder="Nhập lại mật khẩu mới">
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-warning">Đổi mật khẩu</button>
                            <a href="${pageContext.request.contextPath}/students"
                               class="btn btn-outline-secondary">Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

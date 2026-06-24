<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Sinh Viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">Đăng Ký Sinh Viên</h4>
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

                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <div class="mb-3">
                            <label for="maSV" class="form-label">
                                Mã sinh viên <span class="text-danger">*</span>
                            </label>
                            <input type="text" id="maSV" name="maSV"
                                   class="form-control" required
                                   value="${param.maSV}"
                                   placeholder="VD: PS49737">
                        </div>

                        <div class="mb-3">
                            <label for="hoTen" class="form-label">
                                Họ và tên <span class="text-danger">*</span>
                            </label>
                            <input type="text" id="hoTen" name="hoTen"
                                   class="form-control" required
                                   value="${param.hoTen}">
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">
                                Email <span class="text-danger">*</span>
                            </label>
                            <input type="email" id="email" name="email"
                                   class="form-control" required
                                   value="${param.email}">
                        </div>

                        <div class="mb-3">
                            <label for="soDienThoai" class="form-label">Số điện thoại</label>
                            <input type="tel" id="soDienThoai" name="soDienThoai"
                                   class="form-control"
                                   value="${param.soDienThoai}">
                        </div>

                        <div class="mb-3">
                            <label for="ngaySinh" class="form-label">Ngày sinh</label>
                            <input type="date" id="ngaySinh" name="ngaySinh"
                                   class="form-control"
                                   value="${param.ngaySinh}">
                        </div>

                        <div class="mb-3">
                            <label for="diaChi" class="form-label">Địa chỉ</label>
                            <input type="text" id="diaChi" name="diaChi"
                                   class="form-control"
                                   value="${param.diaChi}">
                        </div>

                        <div class="mb-3">
                            <label for="anhUrl" class="form-label">URL ảnh đại diện</label>
                            <input type="text" id="anhUrl" name="anhUrl"
                                   class="form-control"
                                   placeholder="https://example.com/avatar.jpg"
                                   value="${param.anhUrl}">
                        </div>

                        <div class="mb-3">
                            <label for="matKhau" class="form-label">
                                Mật khẩu <span class="text-danger">*</span>
                            </label>
                            <input type="password" id="matKhau" name="matKhau"
                                   class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="xacNhanMatKhau" class="form-label">
                                Xác nhận mật khẩu <span class="text-danger">*</span>
                            </label>
                            <input type="password" id="xacNhanMatKhau" name="xacNhanMatKhau"
                                   class="form-control" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Đăng ký</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center text-muted">
                    Đã có tài khoản?
                    <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<form action="${pageContext.request.contextPath}/register"
      method="post">

    <input type="email"
           name="email"
           class="form-control">

    <input type="password"
           name="password"
           class="form-control">

    <input type="text"
           name="fullname"
           class="form-control">

    <button class="btn btn-primary">
        Đăng ký
    </button>

</form>
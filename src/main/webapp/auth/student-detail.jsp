<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sinh Viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .info-label { font-weight: 600; color: #495057; }
        .avatar-img { width: 120px; height: 120px; object-fit: cover; border-radius: 50%; }
        .avatar-placeholder {
            width: 120px; height: 120px; border-radius: 50%;
            background-color: #dee2e6;
            display: flex; align-items: center; justify-content: center;
            font-size: 2.5rem; color: #6c757d;
        }
    </style>
</head>
<body class="bg-light">
<div class="container mt-4">

    <%-- Kiểm tra nếu không tìm thấy sinh viên --%>
    <c:if test="${empty student}">
        <div class="alert alert-danger">
            Không tìm thấy sinh viên. <a href="${pageContext.request.contextPath}/list">Quay lại danh sách</a>
        </div>
    </c:if>

    <%-- Hiển thị thông tin sinh viên --%>
    <c:if test="${not empty student}">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card shadow">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">Thông Tin Sinh Viên</h4>
                    </div>
                    <div class="card-body">

                        <%-- Ảnh đại diện --%>
                        <div class="text-center mb-4">
                            <c:choose>
                                <c:when test="${not empty student.photo}">
                                    <img src="${student.photo}" alt="Ảnh đại diện"
                                         class="avatar-img border border-2 border-info">
                                </c:when>
                                <c:otherwise>
                                    <div class="avatar-placeholder mx-auto">
                                        &#128100;
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <%-- Bảng thông tin --%>
                        <table class="table table-borderless">
                            <tr>
                                <td class="info-label" style="width: 40%;">Mã sinh viên</td>
                                <td>${student.maSV}</td>
                            </tr>
                            <tr>
                                <td class="info-label">Họ và tên</td>
                                <td>${student.hoTen}</td>
                            </tr>
                            <tr>
                                <td class="info-label">Email</td>
                                <td>${student.email}</td>
                            </tr>
                            <tr>
                                <td class="info-label">Số điện thoại</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty student.soDienThoai}">${student.soDienThoai}</c:when>
                                        <c:otherwise><span class="text-muted">Chưa cập nhật</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <td class="info-label">Ngày sinh</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty student.ngaySinh}">${student.ngaySinh}</c:when>
                                        <c:otherwise><span class="text-muted">Chưa cập nhật</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <td class="info-label">Địa chỉ</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty student.diaChi}">${student.diaChi}</c:when>
                                        <c:otherwise><span class="text-muted">Chưa cập nhật</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>

                        <%-- Nút điều hướng --%>
                        <div class="d-flex gap-2">
                            <a href="${pageContext.request.contextPath}/students"
                               class="btn btn-outline-secondary">← Danh sách</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

</div>
</body>
</html>

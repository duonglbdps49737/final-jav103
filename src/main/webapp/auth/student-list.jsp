<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sinh Viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">

    <%-- Header --%>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="mb-0">Danh Sách Sinh Viên</h3>
        <div>
            <a href="${pageContext.request.contextPath}/register"
               class="btn btn-success me-2">+ Thêm sinh viên</a>
            <a href="${pageContext.request.contextPath}/change-password"
               class="btn btn-outline-warning">Đổi mật khẩu</a>
        </div>
    </div>

    <%-- Thông báo --%>
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

<%--        <c:forEach items="${list}" var="sv">--%>
<%--        &lt;%&ndash; Chuẩn bị chuỗi ngày để đưa vào data attribute &ndash;%&gt;--%>
<%--        <c:set var="dateStr">--%>
<%--            &lt;%&ndash; Dùng java.util.Date: &ndash;%&gt;--%>
<%--            <fmt:formatDate value="${sv.birthday}" pattern="dd-MM-yyyy"/>--%>
<%--            &lt;%&ndash; Nếu dùng LocalDate, thay bằng: ${p.formattedDate} &ndash;%&gt;--%>
<%--        </c:set>--%>
    <%-- Bảng danh sách --%>
    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-bordered table-hover mb-0">
                <thead class="table-primary">
                    <tr>
                        <th>#</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Mark</th>
                        <th>Ngày sinh</th>
                        <th>Chi tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty list}">
                            <tr>
                                <td colspan="7" class="text-center text-muted py-4">
                                    Chưa có sinh viên nào trong hệ thống.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="sv" items="${list}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${sv.fullname}</td>
                                    <td>${sv.password}</td>
                                    <td>${sv.email}</td>
                                    <td>${sv.mark}</td>
                                    <td>${sv.birthday}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/detail/${sv.email}"
                                           class="btn btn-sm btn-info text-white">
                                            Chi tiết
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
<%--                </c:forEach>--%>
            </table>
        </div>
        <div class="card-footer text-muted">
            Tổng số: <strong>${students.size()}</strong> sinh viên
        </div>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
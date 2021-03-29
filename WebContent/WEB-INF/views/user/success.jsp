<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>PASS</title>
<style><%@include file="/WEB-INF/resources/css/success.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
<script type="text/javascript" src="js/query.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap"
	rel="stylesheet">
</head>

<body>

	<form:form action="../user/forgetPassword.htm" modelAttribute="u">
		<h2>Quên mật khẩu</h2>
		<label>Tài khoản của bạn:</label>
		<input type="text" name="account_name" placeholder="Nhập tài khoản..." />

		<button>OK</button>
		<c:if test="${message == true}">
			<h4>
				Kiểm tra email để nhận mật khẩu mới. Xin cảm ơn <a
					href="../user/login.htm">Quay lại tại đây!</a>
			</h4>
		</c:if>
	</form:form>
</body>
</html>
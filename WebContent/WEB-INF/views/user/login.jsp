<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Đăng nhập</title>
<style><%@include file="/WEB-INF/resources/css/login.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
<style type="text/css">
.err {
	color: red;
	font-family:
}
</style>

</head>

<body>
	<form:form action="" modelAttribute="ACCOUNT">
		<h2>Đăng nhập</h2>

		<label for="">Tên người dùng:</label>
		<input type="text" name="account_name" placeholder="Nhập tên...">
		<form:errors class="err" path="account_name" />
		<br>

		<label for="">Mật khẩu:</label>
		<input type="password" name="account_password"
			placeholder="Nhập mật khẩu...">
		<form:errors class="err" path="account_password" />
		<br>

		<a href="../user/forgetPassword.htm">Quên mật khẩu</a>
		<button>Đăng nhập</button>

		<p>
			Chưa có tài khoản? <a href="../user/register.htm">Đăng ký tại
				đây!</a>
		</p>
	</form:form>
</body>
</html>
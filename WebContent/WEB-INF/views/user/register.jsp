<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đăng kí</title>
<style><%@include file="/WEB-INF/resources/css/register.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
<style>
.err {
	color: red;
}
</style>
</head>

<body>
	<form:form action="" modelAttribute="ACCOUNT">${message}
        <h2>Đăng kí</h2>
		<label for="">Tên người dùng:</label>
		<input type="text" name="account_name"
			placeholder="nhập tên người dùng...">
		<form:errors class="err" path="account_name" />
		<br>

		<label for="">Số điện thoại:</label>
		<input type="text" name="phone" placeholder="nhập số điện thoại...">
		<form:errors class="err" path="phone" />
		<br>

		<label for="">Email:</label>
		<input type="email" name="email" placeholder="nhập email...">
		<form:errors class="err" path="email" />
		<br>

		<label for="">Địa chỉ:</label>
		<input type="text" name="address" placeholder="nhập địa chỉ...">
		<form:errors class="err" path="address" />
		<br>

		<label for="">Mật khẩu:</label>
		<input type="password" name="account_password"
			placeholder="nhập mật khẩu...">
		<form:errors class="err" path="account_password" />
		<br>

		<label for="">Xác nhận mật khẩu:</label>
		<input type="password" name="pass-conf" placeholder="password...">


		<button style="margin-left: 200px;">Đăng ký</button>
		<p>
			Đã có tài khoản? <a href="../user/login.htm">Đăng nhập tại đây!</a>
		</p>
	</form:form>
</body>
</html>
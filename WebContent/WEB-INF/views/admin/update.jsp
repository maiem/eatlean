<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chỉnh sửa</title>

<style><%@include file="/WEB-INF/resources/css/admin.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>

<body>
	<header>
		<div class="container f-space">
			<h1 style="color: #705ecf; font-family: 'Lucida Handwriting';">A
				litlle meal</h1>

			<div class="navbar">
				<ul class="f-space">
					<li><a href="../admin/home.htm">Trang chủ</a></li>
					<li><a href="../admin/qlsp.htm">Sản phẩm</a></li>
					<li><a href="#">Đơn hàng</a></li>
					<li><a href="../admin/qltk.htm">Tài khoản</a></li>
				</ul>
			</div>

			<div class="search f-space">
				<div class="input">
					<input type="text" placeholder="Tìm kiếm...">
					<button>
						<i class="fas fa-search"></i>
					</button>
				</div>

				<div class="login" style="margin-right: 10px;">
					<a href="user/login.htm"><i class="fa fa-sign-in-alt"></i></a>
				</div>
				<div class="register">
					<a href="user/register.htm"><i class="fa fa-user-plus"></i></a>
				</div>

			</div>
		</div>
	</header>

	<div class="gom f-space">

		<div class="update">
			<form:form modelAttribute="prods" enctype="multipart/form-data"
				action="../admin/update.htm">
				<h1>Thêm sản phẩm</h1>
				<label for="">Tên sản phẩm</label>
				<form:input path="name_product" type="text" name="name_product"
					id="" />
				<label for="">Số lượng</label>
				<form:input path="total" type="text" name="total" id="" />
				<label for="">Giá</label>
				<form:input path="price" type="text" name="price" id="" />
				<label for="">Ảnh</label>
				<input type="file" name="image1" id="">
				<label for="">Giới thiệu</label>
				<form:input path="descreption" type="text" name="descreption" id="" />
				<button>Sửa</button>
			</form:form>
		</div>
	</div>
	<div class="sub">
		<div class="container f-center">
			<div class="top">
				<div class="con-top">
					<i class="fas fa-envelope"></i>
					<h2>Đăng kí nhận tin</h2>
				</div>
				<div class="input">
					<input type="text" placeholder="Nhập email của bạn...">
					<button>Đăng kí</button>
				</div>
			</div>
		</div>
		<div class="content2 f-center">
			<div class="bot f-space">
				<div class="left f-space">
					<i class="fab fa-facebook-f"></i> <i class="fab fa-twitter"></i> <i
						class="fab fa-google-plus-g"></i> <i class="fab fa-instagram"></i>
				</div>
				<div class="mid">
					<p>
						<strong>A litlle meal © We need you</strong>
					</p>
				</div>
				<div class="right click-top">
					<i class="fas fa-level-up-alt"></i>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
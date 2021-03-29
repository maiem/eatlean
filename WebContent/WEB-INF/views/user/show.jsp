<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style><%@include file="/WEB-INF/resources/css/show.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<title>Giỏ hàng</title>
</head>
<body>
	<header>
		<div class="container f-space">
			<h1 style="color: #705ecf; font-family: 'Lucida Handwriting';">A
				litlle meal</h1>

			<div class="navbar">
				<ul class="f-space">
					<li><a href="../user/home.htm">Trang chủ</a></li>
					<li><a href="../user/about.htm">Thông tin</a></li>
					<li><a href="../user/product.htm">Sản phẩm</a></li>
					<li><a href="../user/contact.htm">Liên hệ</a></li>
				</ul>
			</div>

			<div class="search f-space">
				<div class="input">
					<input type="text" placeholder="Search Here...">
					<button>
						<i class="fas fa-search"></i>
					</button>
				</div>

				<div class="cloud">
					<i class="fas fa-cart-arrow-down"></i>
				</div>
				<div class="login" style="margin-right: 10px;">
					<a href="../user/login.htm"><i class="fa fa-sign-in-alt"></i></a>
				</div>
				<div class="register">
					<a href="../user/register.htm"><i class="fa fa-user-plus"></i></a>
				</div>
			</div>
		</div>
	</header>

	<form:form action="">

		<div class="show f-space">
			<div class="img">
				<img src="../img/${prod.img_url}" alt="">
			</div>
			<div class="content">
				<h1>${prod.name_product}</h1>
				<p>$${prod.price}</p>
				<p>${prod.descreption}</p>
				<label for="">Số lượng:</label> <input type="number"
					name="amount_of" id="" value="1" min="1" max="${prod.total}">
				<button>Thêm vào giỏ hàng</button>${message}
			</div>
		</div>
	</form:form>

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
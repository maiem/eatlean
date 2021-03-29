<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sản phẩm | A litlle meal</title>
<style><%@include file="/WEB-INF/resources/css/demo.css"%></style>
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
					<li><a href="../user/home.htm" class="home">Trang chủ</a></li>
					<li><a href="../user/about.htm" class="about">Thông tin</a></li>
					<li><a href="../user/product.htm" class="pricing active">Sản
							phẩm</a></li>
				</ul>
			</div>

			<div class="search f-space">
				<div class="input">
					<input type="text" placeholder="Tìm kiếm...">
					<button>
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div class="cloud">
					<a href="../user/cart.htm"><i class="fas fa-cart-arrow-down"></i></a>
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

	<div class="price">
		<div class="top f-center">
			<a href="index.html">Home <span>/ Pricing</span></a>
		</div>
		<div class="container f-space">
			<c:forEach var="p" items="${list }">
				<div class="num">
					<div class="con-num">
						<img src="../img/${p.img_url}" alt="không có ảnh">
						<div class="bot">
							<ul>
								<li>${p.name_product }</li>
								<li>${p.total}<span> bịch</span></li>

								<li>${p.price}<span>đ</span></li>
							</ul>
							<a href="../user/show_prod.htm?code=${p.id}">Mua hàng</a>
						</div>
					</div>

				</div>
			</c:forEach>

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

				<div class="left">
					<br> <strong>Liên hệ</strong>
					<p>Hotline: 0359843255</p>
					<p>Instagram: alitllemeal.com</p>
					<p>Facebook: alitllemeal.com</p>
					<p>Website: alitllemeal.com</p>
					<p>Địa chỉ: 97 Man Thiện, Hiệp Phú, Quận 9, TP HCM</p>
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
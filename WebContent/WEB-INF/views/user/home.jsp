<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Trang chủ | A litlle meal</title>
	<style><%@include file="/WEB-INF/resources/css/demo.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"><base href="${pageContext.servletContext.contextPath}/">
</head>

<body>
	<header>
		<div class="container f-space">
			<h1 style="color: #705ecf; font-family: 'Lucida Handwriting';">A
				litlle meal</h1>

			<div class="navbar">
				<ul class="f-space">
					<li><a href="user/home.htm" class="home active">Trang chủ</a></li>
					<li><a href="user/about.htm" class="about">Thông tin</a></li>
					<li><a href="user/product.htm" class="pricing">Sản phẩm</a></li>

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
					<a href="user/cart.htm"> <i class="fas fa-cart-arrow-down"></i></a>

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

	<div class="banner" style="margin-top: 50px;">
		<div class="container f-space">
			<div class="left f-center">
				<div class="con-left">
					<h1>Eatclean</h1>
					<span>Healthy</span>
					<p>
						<strong>EatClean</strong> là chế độ ăn sạch, sử dụng các thực phẩm
						sạch, không qua chế biến sẵn, có chất phụ gia, bảo quản và giữ
						nguyên bản chất tự nhiên của thức ăn. Chế độ ăn EatClean giúp cơ
						thể đào thải độc tố, tăng cường khả năng hấp thụ dưỡng chất. <br>
					</p>

				</div>
			</div>

			<div class="right">
				<img src="img/bg1.jpg" alt="không ảnh">
			</div>
		</div>
	</div>

	<div id="services" class="services f-center">
		<div class="container">
			<div class="top">
				<h2>Dịch vụ</h2>
				<p>Để phát triển kinh doanh, chúng tôi có cung cấp các dịch vụ
					dưới đây.</p>
			</div>

			<div class="bot f-space">
				<div class="grown">
					<div class="con-con">
						<i class="fas fa-dollar-sign green"></i>
						<h4>Thanh toán</h4>
						<p>Hình thức thanh toán bằng tiền mặt, chuyển khoản qua tài
							khoản ngân hàng, thẻ VISA, ví điện tử.</p>
					</div>
				</div>

				<div class="plan">
					<div class="con-con">
						<i class="fas fa-chart-line red"></i>
						<h4>Marketing</h4>
						<p>
							Truyền thông qua <strong>Facebook - Instagram.</strong>
						</p>
					</div>
				</div>

				<div class="ser">
					<div class="con-con">
						<i class="far fa-lightbulb blue"></i>
						<h4>Giao hàng</h4>
						<p>Nội thành, giao trong vòng 2h sau khi nhận đơn. Ngoại thành
							và các tỉnh, ship COD trong vòng 2-4 ngày.</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div id="partners" class="partners f-center">
		<div class="container">
			<div class="top">
				<h2>Đối tác</h2>
				<p>Nhằm tạo ra cộng đồng phát triển, chúng tôi hợp tác những đối
					tác tin cậy trong lĩnh vực thanh toán tài chính, vận chuyển,
					marketing.</p>
			</div>
			<div class="bot">
				<div class="icon f-space">
					<div class="con-icon">
						<i class="fab fa-angellist"></i>
						<p>Momo</p>
					</div>

					<div class="con-icon">
						<i class="fab fa-lastfm"></i>
						<p>Sacombank</p>
					</div>

					<div class="con-icon">
						<i class="fab fa-opencart"></i>
						<p>Giaohangnhanh</p>
					</div>

					<div class="con-icon">
						<i class="fab fa-lastfm"></i>
						<p>Grab</p>
					</div>

				</div>
			</div>
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
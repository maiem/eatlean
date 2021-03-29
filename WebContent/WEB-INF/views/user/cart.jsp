<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ hàng | A litlle meal</title>
</head>

<style><%@include file="/WEB-INF/resources/css/cart.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

<body>
	<header class="f-center">
		<div class="container f-space">
			<h1 style="color: #705ecf; font-family: 'Lucida Handwriting';">A
				litlle meal</h1>

			<div class="nav">
				<ul class="f-space">
					<li><a href="../user/home.htm" class="home active">Trang
							chủ</a></li>
					<li><a href="../user/about.htm">Thông tin</a></li>
					<li><a href="../user/product.htm">Sản phẩm</a></li>
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

	<div class="cart-item">
		<div class="items">
			<div class="top">
				<ul class="f-space">
					<li>Hình ảnh</li>
					<li>Sản phẩm</li>
					<li>Giá</li>
					<li>Trạng thái</li>
					<li>Số lượng</li>
					<li>Tổng tiền</li>
					<li>Thao tác</li>
				</ul>
			</div>

			<c:forEach var="p" items="${orderProduct}">
				<c:forEach var="orD" items="${orderDetail}">
					<c:forEach var="prod" items="${product}">
						<c:if
							test="${orD.product_id == prod.id && orD.order_product_id == p.id}">
							<div class="item">
								<ul class="f-space">
									<li class="f-space"><img src="../img/${prod.img_url}"
										alt=""></li>
									<li>${prod.name_product}</li>
									<li><p>${prod.price}</p></li>
									<li>
										<c:if test="${p.order_state_id == 1}">
											<p>Đã xác nhận</p>
										</c:if>
										<c:if test="${p.order_state_id == 3}">
											<p>Chưa xác nhận</p>
										</c:if>
									</li>
										
									<li>${orD.amount_of}</li>
									<li>${prod.price * orD.amount_of}</li>
									<li><a href="../user/delete.htm?code=${p.id}">Delete</a></li>
								</ul>
								${message1}
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</c:forEach>
		</div>

		<div class="pay">
			<ul class="f-space">
				<li></li>
				<li class="f-center">
					<p>
						<strong>Tổng tiền: 160000<span>đ</span></strong><span></span>
					</p> <a href="">Mua ngay</a>
					<script type="text/javascript">Đặt hàng thành công</script>
				</li>
			</ul>
		</div>
	</div>

	<div class="more">
		<div class="top">
			<div class="left">
				<strong>Chăm sóc khách hàng:</strong><br>
				<ul>
					<li><a href="">Trung tâm trợ giúp</a></li>
					<li><a href="">Thanh toán</a></li>
					<li><a href="">Vận chuyển</a></li>
				</ul>
			</div>

			<div class="center">
				<strong>Về cửa hàng:</strong>
				<ul>
					<li><a href="">Giới thiệu</a></li>
					<li><a href="">Tuyển dụng</a></li>
					<li><a href="">Điều khoản</a></li>
					<li><a href="">Flash sale</a></li>
				</ul>
			</div>
			<div class="right">
				<strong>Thanh toán:</strong>
				<ul>
					<li><a href="">Visa</a></li>
					<li><a href="">Mastercard</a></li>
					<li><a href="">Momo</a></li>

				</ul>
			</div>
		</div>
		<div class="bot">
			<div class="sn f-space">
				<i class="fab fa-facebook-square"></i> <i class="fab fa-instagram"></i>
				<i class="fab fa-twitter-square"></i> <i class="fab fa-linkedin"></i>
			</div>
			<p>
				<strong>A litlle meal © We need you</strong>
			</p>
		</div>
	</div>
</body>
</html>
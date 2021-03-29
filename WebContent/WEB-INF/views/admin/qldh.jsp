<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản lí đơn hàng</title>

<style><%@include file="/WEB-INF/resources/css/qldh.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<body>
	<header>
		<div class="container f-space">
			<h1 style="color: #705ecf; font-family: 'Lucida Handwriting';">A litlle meal</h1>

			<div class="navbar">
				<ul class="f-space">
					<li><a href="../admin/home.htm">Trang chủ</a></li>
					<li><a href="../admin/qlsp.htm">Sản phẩm</a></li>
					<li><a href="../admin/qtdh.htm">Đơn hàng</a></li>
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
		${message} ${message1}
		<div>
			<table>
				<tr>
					<th>Sản phẩm</th>
					<th>Khách hàng</th>
					<th>Ngày mua</th>
					<th>Tổng tiền</th>
					<th>Thao tác</th>
				</tr>
				<c:forEach var="p" items="${listOrd }">
					<tr>
						<td>${p.id.product_id }</td>
						<td>${p.account_id.account_name}</td>
						<td>${p.ordered_date}</td>
						<td>${p.total_price}</td>
						<td>
							<c:choose <a href="">Xác nhận</a> >
								<c:when test="${order_state_id == 1}"> Đã xác nhận</c:when>
								<c:otherwise <a href="">Hủy</a>>Chưa xác nhận</c:otherwise>
							</c:choose>
						</td>
						
						<!-- <td><a href="">Xác nhận</a> <a href="">Hủy</a></td> -->
					</tr>
				</c:forEach>

			</table>
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
					<input type="text" placeholder="Nhập email tại đây...">
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
					<strong>A litlle meal © We need you</strong>
				</div>
				<div class="right click-top">
					<i class="fas fa-level-up-alt"></i>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
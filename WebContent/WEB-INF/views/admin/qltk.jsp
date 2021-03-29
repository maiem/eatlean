<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản lí tài khoản</title>
	<style><%@include file="/WEB-INF/resources/css/admin.css"%></style>
	<style><%@include file="/WEB-INF/resources/css/reset.css"%></style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script
	src="<c:url value="https://code.jquery.com/jquery-3.5.1.min.js" />"></script>
<script src="js/demo.js"></script>
</head>

<script>
		
	function timKiem() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		var check = false;
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			td1 = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
					check = true;
				} else {
					tr[i].style.display = "none";
				}

			}

			if (td1 && check == false) {
				txtValue1 = td1.textContent || td1.innerText;
				if (txtValue1.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
					check = true;
				} else {
					tr[i].style.display = "none";
				}

			}

		}
	}
</script>

<body>
	<header>
		<div class="container f-space">
			<h1 style="color: #705ecf; font-family: 'Lucida Handwriting';">A
				litlle meal</h1>

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
					<input type="text" placeholder="Tìm kiếm..." id="myInput" />
					<button onclick="timKiem()">
						<i class="fas fa-search"></i>
					</button>
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

	<div class="gom">
		${message} ${message1}
		<%--<div class="add">
			<form:form modelAttribute="p" enctype="multipart/form-data" action="../admin/qltk.htm">
				<h1>Sửa tài khoản</h1>
				
				<label for="">Tài khoản</label>
				<input type="text" name="account_name" id="">
				<form:errors class="err" path="account_name"/><br>
				
				<label for="">Mật khẩu</label>
				<input type="text" name="account_password" id="">
				<form:errors class="err" path="account_password"/><br>
				
				<label for="">Email</label>
				<input type="text" name="email" id="">
				<form:errors class="err" path="email"/><br>
				
				<label for="">Số điện thoại</label>
				<input type="text" name="phone" id="">
				<form:errors class="err" path="phone"/><br>
				
				<label for="">Địa chỉ</label>
				<input type="text" name="address" id="">
				<form:errors class="err" path="address"/><br>
				
				<label for="">Loại tài khoản</label>
				<input type="number" name="account_type_id" id="" min="0" max="1">
				<form:errors class="err" path="account_type_id"/><br>
				
				<button>Thêm</button>
			</form:form>
		</div>
		 --%>
		<div class="del_update">
			<table id="myTable">
				<tr>
					<th>Tài khoản</th>
					<th>Mật khẩu</th>
					<th>Email</th>
					<th>Số điện thoại</th>
					<th>Địa chỉ</th>
					<th>Loại tài khoản</th>
					<th>Trạng thái hoạt động</th>
					<th>Thao tác</th>
				</tr>

				<c:forEach var="acc" items="${listAcc }">
					<tr>
						<td>${acc.account_name}</td>
						<td>${acc.account_password }</td>
						<td>${acc.email }</td>
						<td>${acc.phone }</td>
						<td>${acc.address }</td>
						<td>
						 	<c:choose>
								<c:when test="${acc.account_type_id == 1}"> Admin</c:when>
								<c:otherwise>Khách hàng</c:otherwise>
							</c:choose>
						</td>
						<td><c:choose>
								<c:when test="${acc.account_state_id == 1}"> Hoạt động</c:when>
								<c:otherwise>TK đã khóa</c:otherwise>
							</c:choose>
						</td>
						<td><a href="../admin/delete/${acc.id}.htm">Xóa</a>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="sub">

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
</body>
</html>
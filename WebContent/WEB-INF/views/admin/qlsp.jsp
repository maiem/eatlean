<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản lí sản phẩm</title>
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
					<li><a href="#">Đơn hàng</a></li>
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
		<div class="add">
			<form:form modelAttribute="p" enctype="multipart/form-data"
				action="../admin/qlsp.htm">
				<h1>Thêm sản phẩm</h1>

				<label for="">Tên sản phẩm</label>
				<input type="text" name="name_product" >
				<form:errors class="err" path="name_product" style=" color: red ; " />
				<br>

				<label for="">Số lượng</label>
				<input type="number" name="total" min = "0">
				<form:errors class="err" path="total" style=" color: red ; " />
				<br>

				<label for="">Giá</label>
				<input type="number" name="price" min = "0">
				<form:errors class="err" path="price" style=" color: red ; " />
				<br>

				<label for="">Ảnh</label>
				<input type="file" name="image1" >
				 <form:errors class="err" path="img_url" style=" color: red ; " /> 
				<br>

				<label for="">Mô tả</label>
				<input type="text" name="descreption" >
				<form:errors class="err" path="descreption" style=" color: red ; " />
				<br>

				<button>Thêm</button>
				
				<c:if test="${message == true}">
            	<script type="text/javascript">
					alert("Thêm thành công!");
				</script>
            </c:if>
            <c:if test="${message == false}">
            	<script type="text/javascript">
					alert("Thêm khong thành công!");
				</script>
            </c:if>
			</form:form>
		</div>

		<div class="del_update">
			<table id="myTable">
				<tr>
					<th>Ảnh</th>
					<th>Tên</th>
					<th>Giá</th>
					<th>Số lượng</th>
					<!-- <th>Trạng thái</th> -->
					<th>Thao tác</th>
				</tr>
				<c:forEach var="p" items="${list }">
					<tr>
						<td><img style="width: 100px;" src="../img/${p.img_url}"
							alt=""></td>
						<td>${p.name_product }</td>
						<td>${p.price }</td>
						<td>${p.total }</td>
						<%-- <td>
						 	<c:choose>
								<c:when test="${p.product_state_id == 1}"> Tồn tại</c:when>
								<c:otherwise>Đã xóa</c:otherwise>
							</c:choose>
						</td> --%>
						<td><a href="../admin/delete/${p.id}.htm">Xóa</a><a
							href="../admin/update.htm?idUpdate=${p.id}" id="sua">Sửa</a></td>
					</tr>
				</c:forEach>
				
	            <c:if test="${message1 == true}">
	            	<script type="text/javascript">
						alert("Xóa thành công!");
					</script>
	            </c:if>
	            <c:if test="${message1 == false}">
	            	<script type="text/javascript">
						alert("Xóa khong thành công!");
					</script>
	            </c:if>
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
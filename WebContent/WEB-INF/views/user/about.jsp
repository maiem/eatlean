<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thông tin | A litlle meal</title>
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
					<li><a href="../user/about.htm" class="about active">Thông
							tin</a></li>
					<li><a href="../user/product.htm" class="pricing">Sản phẩm</a>
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

	<div class="about-banner">
		<div class="top f-center">
			<a href="index.html">Home <span>/ About Us</span></a>
		</div>

		<div class="container f-space">
			<div class="left f-center">
				<div class="con-left">
					<span>Câu chuyện của chúng tôi</span>
					<h1>Chào mừng đến với Website</h1>
					<p>
						<strong>A litlle meal</strong> thành lập năm 2020 với mục đích
						cung cấp những món ăn vặt dành cho những người thực hiện theo chế
						độ ăn uống lành mạnh và sống khỏe, những gymmer, những người đang
						và tìm kiếm nhu cầu giảm cân.
					</p>
					<div class="txt">
						<p>Những sản phẩm sản xuất từ thực phẩm hữu sơ được lựa chọn
							từ những nông trại uy tín tại Đà Lạt (Lâm Đồng - Viêt Nam), chế
							biến theo công thức hạn chế tối đa chất béo, phụ gia và gia vị,
							giữ lại hương vị tự nhiên của thực phẩm. Là thức quà tuyệt vời mà
							chúng tôi dành tặng cho những vị khách thân yêu.</p>
						<p>Cảm ơn quý khách hàng đã tin tưởng, rất mong sự phục vụ của
							chúng tôi làm các bạn hài lòng.</p>
					</div>

				</div>
			</div>
			<div class="right">
				<img src="../img/bg1.jpg" alt="không ảnh" style="width: 500px">
			</div>
		</div>
	</div>

	<div id="why" class="why f-center">
		<div class="container f-space">
			<div class="num">
				<div class="dolor f-center">
					<div class="content f-center">
						<i class="far fa-handshake color-green"></i>
						<div class="con-con">
							<h4>Thanh toán</h4>
							<p>
								Bạn vào danh mục <strong>Sản phẩm</strong> đặt hàng, tiếp theo
								vào giỏ hàng chọn mua ngay.
							</p>
							<p>Khi đặt hàng thành công, khách hàng thanh toán qua thẻ ATM
								nội địa, VISA hoặc thanh toán khi nhận hàng.</p>
							<p>
								<strong>Kiểm tra kĩ</strong> thông tin trước khi thanh toán
								tránh sự cố xảy ra.
							</p>
						</div>
					</div>
				</div>

				<div class="dolor f-center">
					<div class="content f-center">
						<i class="fas fa-coffee color-orange"></i>
						<div class="con-con">
							<h4>Thành viên</h4>
							<p>
								<strong>Tổng hóa đơn</strong> từ 1tr-2tr có thẻ Đồng, miễn phí
								vận chuyển.
							</p>
							<p>
								<strong>Tổng hóa đơn</strong> từ 2tr-5tr có thẻ Bạc, miễn phí
								vận chuyển, giảm giá 5% cho lần mua tiếp theo.
							</p>
							<p>
								<strong>Tổng hóa đơn</strong> hơn 5tr sẽ có thẻ Vàng, miễn phí
								vận chuyển, giảm giá 10% cho lần mua tiếp theo.
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="num">
				<div class="dolor f-center">
					<div class="content f-center">
						<i class="fas fa-headphones color-blue"></i>
						<div class="con-con">
							<h4>Giao hàng</h4>
							<p>
								<strong>Với khách hàng nội thành:</strong> Nhận hàng trong 2h
								sau khi đặt hàng, miễn phí vận chuyển.
							</p>
							<p>
								<strong>Với khách hàng ngoại thành:</strong> Nhận hàng 1 ngày
								sau khi đặt hàng, phí vận chuyển 20000đ.
							</p>
							<p>
								<strong>Khách hàng TP HCM:</strong> Nhận hàng từ 2-3 ngày sau
								khi đặt hàng, phí vận chuyển 30000đ.
							</p>
						</div>
					</div>
				</div>

				<div class="dolor f-center">
					<div class="content f-center">
						<i class="far fa-eye color-purple"></i>
						<div class="con-con">
							<h4>Tuyển dụng</h4>

						</div>
					</div>
				</div>
			</div>

			<div class="num">
				<div class="dolor f-center">
					<div class="content f-center">
						<i class="fas fa-folder-open color-red"></i>
						<div class="con-con">
							<h4>Đổi trả</h4>
							<p>
								<strong>Nhận hàng 1-7 ngày</strong>, sản phẩm bị hư hỏng(mùi vị,
								biến dạng), giao không đúng sản phẩm. Khách hàng chụp hình gửi
								lại cho shop để kiểm tra. Chúng tôi sẽ hoàn tiền lại cho quý
								khách và giảm 10% cho lần mua sau.
							</p>
							<p>
								<strong>Quá 7 ngày</strong>, cửa hàng sẽ không chịu trách nhiệm.
							</p>
						</div>
					</div>
				</div>

				<div class="dolor f-center">
					<div class="content f-center">
						<i class="far fa-lightbulb color-bgreen"></i>
						<div class="con-con">
							<h4>Title Here</h4>
							<p>Natus error sit voluptatem accusantium dolo remque lauda
								ntium.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="team" class="team f-center">
		<div class="container">
			<div class="top">
				<h2>Đội ngũ sáng lập</h2>
				<p></p>
			</div>

			<div class="bot f-space">
				<div class="grown">
					<div class="con-con">
						<img src="../img/maiem.jpeg" alt=""
							style="width: 40%; height: 40%">

						<h4>Hà Thị Mai Anh</h4>
						<p>Người sáng lập</p>
						<ul class="f-space">
							<li><a href=""><i class="fab fa-facebook-f"
									style="color: #816ceb"></i></a></li>
							<li><a href=""><i class="fab fa-twitter"
									style="color: #816ceb"></i></a></li>
							<li><a href=""><i class="fab fa-google-plus-g"
									style="color: #816ceb"></i></a></li>
						</ul>
					</div>
				</div>

				<div class="plan">
					<div class="con-con">
						<img
							src="https://demo.w3layouts.com/demos_new/template_demo/03-04-2019/startup-demo_Free/491878990/web/images/t2.jpg"
							alt="">
						<h4>Nguyễn Thị Hương</h4>
						<p>Đồng sáng lập</p>
						<ul class="f-space">
							<li><a href=""><i class="fab fa-facebook-f"
									style="color: #816ceb"></i></a></li>
							<li><a href=""><i class="fab fa-twitter"
									style="color: #816ceb"></i></a></li>
							<li><a href=""><i class="fab fa-google-plus-g"
									style="color: #816ceb"></i></a></li>
						</ul>
					</div>
				</div>

				<div class="ser">
					<div class="con-con">
						<img
							src="https://demo.w3layouts.com/demos_new/template_demo/03-04-2019/startup-demo_Free/491878990/web/images/t3.jpg"
							alt="">
						<h4>Nguyễn Thị Hiếu</h4>
						<p>Đồng sáng lập</p>
						<ul class="f-space">
							<li><a href=""><i class="fab fa-facebook-f"
									style="color: #816ceb"></i></a></li>
							<li><a href=""><i class="fab fa-twitter"
									style="color: #816ceb"></i></a></li>
							<li><a href=""><i class="fab fa-google-plus-g"
									style="color: #816ceb"></i></a></li>
						</ul>
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
					<p>Instagram: alitllemeal</p>
					<p>Facebook: alitllemeal</p>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>flatter</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

<style type="text/css">
.service_area .single_service {
	border: 2px solid #eee;
	padding: 20px 20px 20px 20px;
	margin-bottom: 60px;
	border-radius: 10px;
	text-align: center;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	transition: 0.3s;
}

.col-md-6 {
	-webkit-box-flex: 0;
	-ms-flex: 0 0 50%;
	flex: 0 0 33%;
	max-width: 50%;
}
</style>
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header id="headers">
		<jsp:include page="common/nav.jsp" />
	</header>
	<!-- header-end -->


	<!-- 검색바 start -->
	<div class="slider_area ">
		<div class="slider_sctive owl-carousel">
			<div class="single_slider slider_img_1">
				<div class="single_slider-iner">
					<div class="slider_contant text-center">
						<h3>What's today's menu?</h3>
						<form action="#">
							<div class="form-group"
								style="width: 738px; height: 27px; margin: 0 auto;">
								<!-- margin: 0 auto로 가운데 배치 -->
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder='지역, 식당 또는 음식'>
									<div class="input-group-append">
										<button class="btn" type="button">
											<i class="ti-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 검색바 end -->




	<!-- 평점 순위 top6 start -->
	<div class="service_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-60">

						<!-- 리스트 타이틀 -->

						<h3>평점 top6</h3>
						<p>고객님들이 직접 뽑은 전국 최고의 맛집!</p>
					</div>
				</div>
			</div>


			<!-- 리스트 내용 -->

			<div class="row">
				<c:forEach var="ad" items="${avgDatas}">
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<a href="#"> <img alt="" src="${ad.resPic}"  style="width:100%" ></a>
						</div>
						<h4> ${ad.resName} </h4>
						<h5> 평점: ${ad.resAvg}점 </h5>
  						<br>
						<a href="#" class="Choose_restaurant">
						<span>위치:${ad.resAdd}</span>
						</a>
					</div>
				</div>
					
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 평점 순위 top6 end -->





	<!-- 광고 -->
	<div class="video_area video_bg ">
		<div class="video_area_inner">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="video_text">
							<div class="info">
								<div class="info_inner">
									<h4>광고 영상 보기</h4>
									<p>You will love our execution</p>
								</div>
								<div class="icon_video">
									<a class="popup-video"
										href="https://www.youtube.com/watch?v=YeBTPMXhkD4"><i
										class="ti-control-play"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 광고 end -->



	<!-- 맛집 Best5 start -->
	<div class="service_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-70">
						<h3>양식 맛집 Best6</h3>
						<p>
							오맛이가 추천하는 양식 맛집 Best6
						</p>
					</div>
				</div>
			</div>
			<div class="row">
			<c:forEach var="md" items="${menuDatas}">
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<a href="#"> <img alt="" src="${md.resPic}"  style="width:100%" ></a>
						</div>
						<h4> ${md.resName} </h4>
						<h5> 평점: ${md.resAvg}점 </h5>
  						<br>
						<a href="#" class="Choose_restaurant">
						<span>위치:${md.resAdd}</span>
						</a>
					</div>
				</div>
					
				</c:forEach>


			</div>
		</div>
	</div>
	<!-- 맛집 Best5 end -->





	<!-- 지역별 Best6 start -->
	<div class="service_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-60">

						<!-- 리스트 타이틀 -->

						<h3>서울 인기맛집 Best6</h3>
						<p>
							한국의 중심! 서울의 인기맛집 Best6
						</p>
					</div>
				</div>
			</div>


			<!-- 리스트 내용 -->

			<div class="row">

				<c:forEach var="ld" items="${locationDatas}">
				<div class="col-xl-4 col-md-6">
					<div class="single_service">
						<div class="service_icon">
							<a href="#"> <img alt="" src="${ld.resPic}"  style="width:100%" ></a>
						</div>
						<h4> ${ld.resName} </h4>
						<h5> 평점: ${ld.resAvg}점 </h5>
  						<br>
						<a href="#" class="Choose_restaurant">
						<span>위치:${ld.resAdd}</span>
						</a>
					</div>
				</div>
					
				</c:forEach>


			</div>
				
			</div>
		</div>
	</div>
	<!-- 지역별 Best6 end -->




	<!-- footer-start -->
	<jsp:include page="common/footer.jsp" />
	<!-- footer-end -->









	<!-- JS here -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/ajax-form.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/scrollIt.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/nice-select.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/plugins.js"></script>

	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>

</body>

</html>
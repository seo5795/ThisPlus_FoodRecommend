<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>식당리스트 | 오늘의메뉴</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="img/favicon-customer.ico">
<!-- Place favicon.ico in the root directory -->

<!-- Google Web Fonts by JHS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap"
	rel="stylesheet">

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
* {
	font-family: 'Gothic A1', sans-serif;
}

.section-padding {
	padding-top: 100px;
	padding-bottom: 100px;
}

.col-lg-4 {
	padding-left: 80px;
}

.blog_right_sidebar .widget_title {
	font-size: 20px;
	margin-bottom: 24px;
}
</style>
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<!-- 네비게이션 -->
		<jsp:include page="common/nav.jsp" />
	</header>
	<!-- header-end -->

	<!-- breadcam_area_start -->
	<div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
		<div class="breadcam_inner">
			<div class="breadcam_text">
				<h3>식당 리스트</h3>
				<p></p>
			</div>
		</div>
	</div>
	<!-- breadcam_area_end -->


	<!--================Blog Area =================-->
	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="blog_left_sidebar">
						<article class="blog_item">
							<c:choose>
								<c:when test="${ empty resDatas }">
									<!-- 식당리스트가 존재하지 않을 때 -->
									<h1>해당 식당이 존재하지 않습니다😥😥😥</h1>
									<h1>빠른 시일 내에 준비하겠습니다😊😊😊</h1>
								</c:when>
								<c:otherwise>
									<!-- 식당리스트가 존재할 때 start -->
									<c:forEach var="rd" items="${resDatas}">
										<div class="blog_item_img">
											<a href="resdetail.do?resId=${rd.resId}"><img
												class="card-img rounded-0" src="${rd.resPic}"
												alt="${rd.resName}"></a> <a href="#"
												class="blog_item_date">
												<h3>평점</h3>
												<p>${rd.resAvg}</p>
											</a>

										</div>

										<div class="blog_details">
											<a class="d-inline-block"
												href="resdetail.do?resId=${rd.resId}">
												<h2>${rd.resName}</h2>
											</a>
											<p>${rd.resAdd}</p>
											<ul class="blog-info-link">
												<li><a href="#"><i class="fa fa-user"></i>
														${rd.resCategory}</a></li>
												<!--<li><a href="#"> <i class="fa fa-comments"></i> 03
											Comments</a></li> -->
											</ul>
										</div>
										<br>
										<br>
										<br>
										<br>
									</c:forEach>
									<!-- 식당리스트가 존재할 때 end -->
								</c:otherwise>
							</c:choose>
						</article>

						<c:choose>
							<c:when test="${ num+1 le cnt }">
     						<!-- 받아온 데이터 수 <= 검색 결과의 데이터 수 일때 더보기 보이게 처리 -->
     						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><a
									href="reslist.do?scategory=${category}&num=${num+1}&search=${search}">더보기&nbsp;&gt;&gt;</a></strong>
							</c:when>
						</c:choose>

					</div>
				</div>
				<!-- ===========사이드바============= -->
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="reslist.do?scategory=name" method="post">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" class="form-control" name="search"
											placeholder='식당 이름' onfocus="this.placeholder = ''"
											onblur="this.placeholder = '식당 이름'">
										<div class="input-group-append">
											<button class="btn" type="submit">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">검색</button>
							</form>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">카테고리</h4>
							<ul class="list cat-list">
								<li><a href="reslist.do?scategory=menuCategory&search=한식"
									class="d-flex">
										<p>한식</p>
								</a></li>
								<li><a href="reslist.do?scategory=menuCategory&search=양식"
									class="d-flex">
										<p>양식</p>
								</a></li>
								<li><a href="reslist.do?scategory=menuCategory&search=중식"
									class="d-flex">
										<p>중식</p>
								</a></li>
								<li><a href="reslist.do?scategory=menuCategory&search=일식"
									class="d-flex">
										<p>일식</p>
								</a></li>
								<li><a href="reslist.do?scategory=menuCategory&search=분식"
									class="d-flex">
										<p>분식</p>
								</a></li>
								<li><a href="reslist.do?scategory=menuCategory&search=카페"
									class="d-flex">
										<p>카페</p>
								</a></li>
							</ul>
						</aside>
						<!--  
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Recent Post</h3>
							<div class="media post_item">
								<img src="img/post/post_1.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>From life was you fish...</h3>
									</a>
									<p>January 12, 2019</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/post/post_2.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>The Amazing Hubble</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/post/post_3.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>Astronomy Or Astrology</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/post/post_4.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>Asteroids telescope</h3>
									</a>
									<p>01 Hours ago</p>
								</div>
							</div>
						</aside>
						<aside class="single_sidebar_widget tag_cloud_widget">
							<h4 class="widget_title">Tag Clouds</h4>
							<ul class="list">
								<li><a href="#">project</a></li>
								<li><a href="#">love</a></li>
								<li><a href="#">technology</a></li>
								<li><a href="#">travel</a></li>
								<li><a href="#">restaurant</a></li>
								<li><a href="#">life style</a></li>
								<li><a href="#">design</a></li>
								<li><a href="#">illustration</a></li>
							</ul>
						</aside>


						<aside class="single_sidebar_widget instagram_feeds">
							<h4 class="widget_title">Instagram Feeds</h4>
							<ul class="instagram_row flex-wrap">
								<li><a href="#"> <img class="img-fluid"
										src="img/post/post_5.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/post/post_6.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/post/post_7.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/post/post_8.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/post/post_9.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/post/post_10.png" alt="">
								</a></li>
							</ul>
						</aside>

						<!-- 
						<aside class="single_sidebar_widget newsletter_widget">
							<h4 class="widget_title">Newsletter</h4>

							<form action="#">
								<div class="form-group">
									<input type="email" class="form-control"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter email'"
										placeholder='Enter email' required>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">Subscribe</button>
							</form>
						</aside>
						 -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->


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
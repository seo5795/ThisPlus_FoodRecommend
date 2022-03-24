<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>오늘의메뉴</title>
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

.searchList {
	padding: 5px;
	display: none;
}

#recent {
	font-weight: bold;
	font-size: 30px;
}
.title-score {
	font-size:20px;
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
						<h3>오늘의 메뉴는?</h3>
						<form action="reslist.do?scategory=name" method="post">
							<div class="form-group"
								style="width: 738px; height: 27px; margin: 0 auto;">
								<!-- margin: 0 auto로 가운데 배치 -->
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="search"
										placeholder='식당 이름 검색' name="search" autocomplete=off>
									<!-- 브라우저 자체제공 검색리스트 삭제: autocomplete=off -->
									<div class="input-group-append">
										<button class="btn" type="submit">
											<i class="ti-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
						<div>
							<br>
							<h5 class="searchList" id="recent">최근 검색 리스트</h5>

							<ul>
								<c:forEach var="sl" items="${rsearchList}" begin="0" end="4">
									<!-- 최근검색 5개까지 출력 -->
									<a href="reslist.do?scategory=name&search=${sl}">
									<!-- 출력 리스트를 클릭하면 해당 검색 실행 -->
									<li class="searchList">${sl}</li></a>
									<hr class="searchList">
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 검색바 end -->




	<!-- 평점 Best6 start -->
	<div class="service_area" id="score">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-60">

						<!-- 리스트 타이틀 -->

						<h3>평점이 높은 맛집 Best6</h3>
						<p>회원님들이 직접 뽑은 전국 최고의 맛집을 소개합니다!</p>
					</div>
				</div>
			</div>


			<!-- 리스트 내용 -->

			<div class="row">
				<c:forEach var="ad" items="${avgDatas}">
					<div class="col-xl-4 col-md-6">
						<div class="single_service">
							<div class="service_icon">
								<a href="resdetail.do?resId=${ad.resId}"> <img alt=""
									src="${ad.resPic}" style="width: 100%; height: auto;"></a>
							</div>
							<h4>
								<a href="resdetail.do?resId=${ad.resId}"><strong>${ad.resName}</strong></a>
							</h4><br>
							<h5 class="title-score">
								<strong>평점: </strong> ${ad.resAvg}
							</h5>
							<span><strong>위치: </strong>${ad.resAdd}</span>

						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 평점 Best6 end -->




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
									<p>우측 버튼을 클릭해보세요.</p>
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



	<!-- 양식맛집 Best6 start -->
	<div class="service_area" id="category">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-70">
						<h3>양식 맛집 Best6</h3>
						<p>오늘의 메뉴가 추천하는 양식 맛집을 소개합니다!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="md" items="${menuDatas}">
					<div class="col-xl-4 col-md-6">
						<div class="single_service">
							<div class="service_icon">
								<a href="resdetail.do?resId=${md.resId}"> <img alt=""
									src="${md.resPic}" style="width: 100%"></a>
							</div>
							<h4>
								<a href="resdetail.do?resId=${ad.resId}"><strong>${md.resName}</strong></a>
							</h4><br>
							<h5 class="title-score">
								<strong>평점: </strong> ${md.resAvg}
							</h5>
							<span><strong>위치: </strong> ${md.resAdd}</span>

						</div>
					</div>

				</c:forEach>


			</div>
		</div>
	</div>
	<!-- 양식맛집 Best6 end -->





	<!-- 서울맛집 Best6 start -->
	<div class="service_area" id="area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-60">

						<!-- 리스트 타이틀 -->

						<h3>서울 인기맛집 Best6</h3>
						<p>한국의 중심, 서울의 인기맛집을 소개합니다!</p>
					</div>
				</div>
			</div>


			<!-- 리스트 내용 -->

			<div class="row">

				<c:forEach var="ld" items="${locationDatas}">
					<div class="col-xl-4 col-md-6">
						<div class="single_service">
							<div class="service_icon">
								<a href="resdetail.do?resId=${ld.resId}"> <img alt=""
									src="${ld.resPic}" style="width: 100%"></a>
							</div>
							<h4><a href="resdetail.do?resId=${ad.resId}"><strong>${ld.resName}</strong></a></h4>
							<br>
							<h5 class="title-score"><strong>평점: </strong> ${ld.resAvg}</h5>
							<span><strong>위치: </strong>${ld.resAdd}</span>

						</div>
					</div>

				</c:forEach>


			</div>

		</div>
	</div>
	<!-- 서울맛집 Best6 end -->




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

	<script type="text/javascript">
		var searchList = document.querySelector(".searchList");
		var search = document.querySelector("#search");

		search.onfocus = function() {//검색창 클릭시 검색리스트 출력			
			$('.searchList').show();
		};

		search.onblur = function() {//검색창에서 나올시 검색리스트 숨기기
			setTimeout(function() {//함수 실행속도를 늦춰 a태그 실행가능하게 설정
				$('.searchList').hide();
			}, 500);
		};
	</script>

</body>

</html>
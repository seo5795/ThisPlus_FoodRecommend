<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!doctype html>
<html class="no-js" lang="zxx">


<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>DURG</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- Place favicon.ico in the root directory -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="star/jquery.raty.js"></script>
<!-- 별점 api 관련 -->

<style type="text/css">
.cancel-on-png, .cancel-off-png, .star-on-png, .star-off-png, .star-half-png {
  font-size: 2em;
}

@font-face {
  font-family: "raty";
  font-style: normal;
  font-weight: normal;
  src: url("./fonts/raty.eot");
  src: url("./fonts/raty.eot?#iefix") format("embedded-opentype");
  src: url("./fonts/raty.svg#raty") format("svg");
  src: url("./fonts/raty.ttf") format("truetype");
  src: url("./fonts/raty.woff") format("woff");
}

.cancel-on-png, .cancel-off-png, .star-on-png, .star-off-png, .star-half-png {
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  font-family: "raty";
  font-style: normal;
  font-variant: normal;
  font-weight: normal;
  line-height: 1;
  speak: none;
  text-transform: none;
}

.cancel-on-png:before {
  content: "\e600";
}

.cancel-off-png:before {
  content: "\e601";
}

.star-on-png:before {
  content: "\f005";
}

.star-off-png:before {
  content: "\f006";
}

.star-half-png:before {
  content: "\f123";
}

</style>

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
<link rel="stylesheet" href="css/star.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
 <link rel="stylesheet" type="text/css" href="./style.css" />
 <script src="./index.js"></script>

</head>

<body>
	
	<!-- 구글맵 API -->
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
	<!-- header -->
	<jsp:include page="common/header.jsp" />
	<!-- breadcam_area_end -->

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="img/blog/single_blog_1.png"
								alt="크롤링한 사진">
							<!--식당 사진 -->
						</div>
						<div class="blog_details">
							<h2>식당 이름</h2>
							<div id="starRead">별점</div>

							<div class="quote-wrapper">
								<div class="quotes">식당 상세 정보 크롤링 식당 주소</div>
							</div>
						</div>
					</div>


					<div class="navigation-top">
						<div class="d-sm-flex justify-content-between text-center">
							<p class="like-info">
								<span class="align-middle"><i class="fa fa-heart"></i></span>
								Lily and 4 people like this
							</p>
							<div class="col-sm-4 text-center my-2 my-sm-0">
								<!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
							</div>
							<ul class="social-icons">
								<li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-behance"></i></a></li>
							</ul>
						</div>
						<div class="navigation-area">
							<div class="row">
								<div
									class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
									<div class="thumb">
										<a href="#"> <img class="img-fluid"
											src="img/post/preview.png" alt="">
										</a>
									</div>
									<div class="arrow">
										<a href="#"> <span class="lnr text-white ti-arrow-left"></span>
										</a>
									</div>
									<div class="detials">
										<p>Prev Post</p>
										<a href="#">
											<h4>Space The Final Frontier</h4>
										</a>
									</div>
								</div>
								<div
									class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
									<div class="detials">
										<p>Next Post</p>
										<a href="#">
											<h4>Telescopes 101</h4>
										</a>
									</div>
									<div class="arrow">
										<a href="#"> <span class="lnr text-white ti-arrow-right"></span>
										</a>
									</div>
									<div class="thumb">
										<a href="#"> <img class="img-fluid"
											src="img/post/next.png" alt="">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="blog-author">
						<div class="media align-items-center">
							<img src="img/blog/author.png" alt="">
							<div class="media-body">
								<h4>사장님의 식당 소개</h4>
								</a>
								<p>Second divided from form fish beast made. Every of seas
									all gathered use saying you're, he our dominion twon Second
									divided from</p>
							</div>
						</div>
					</div>

					<div class="comments-area">
						<!-- 리뷰 -->
						<h4>리뷰</h4>
						<c:forEach var="v" items="${datas}">
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img src="${data.revimg}" alt="">
										</div>
										<div class="desc">
											<p class="comment">${data.revcont}</p>
											<div class="d-flex justify-content-between">
												<div class="d-flex align-items-center">
													<h5>
														<a href="#">${data.mname}</a>
													</h5>
													<p class="date">${data.mdate}</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<button type="submit"
							class="button button-contactForm btn_1 boxed-btn">
							<a href="main.do?b=${b+2}">더보기&nbsp;</a>
						</button>

					</div>

					<div class="comment-form">
						<!-- 리뷰 작성 -->
						<h4>리뷰 남기기</h4>
						<!-- 리뷰 별점 -->
						<div id="star"></div>
						<form method="post" action="review.do"
							enctype="multipart/form-data">
							<label for="starRating"> </label><input type="hidden" 
								id="starRating" name="star" value="0" />
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" name="comment"
											id="comment" cols="30" rows="9" placeholder="Write Comment"></textarea>
									</div>
								</div>
							</div>
							<input style="display: block;" type="file" id="input-image">

							<br>
							<br>
							<div class="form-group">
								<button type="submit"
									class="button button-contactForm btn_1 boxed-btn">작성</button>
							</div>
						</form>

						<div class="image-container">
							<img style="width: 300px; height: 300px;" id="preview-image"
								src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="#">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" class="form-control"
											placeholder='Search Keyword' onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Search Keyword'">
										<div class="input-group-append">
											<button class="btn" type="button">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">Search</button>
							</form>
						</aside>

						<aside class=" single_sidebar_widget search_widget">
							<div class="blog_right_sidebar">
								<h4 class="widget_title">식당 지도</h4>
								<div id="map" style="width: 150px; height: 150px;"></div>
								    <script
      src="https://maps.googleapis.com/maps/api/js?kAIzaSyBgdrNc6aaR1rj7qTZnzPjEAFRuQ9L9bbc&callback=initMap&v=weekly"
      async
    ></script>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->

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
	<script type="text/javascript">
</script>
	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>

	<script type="text/javascript">
  
  document.querySelector('.form-control w-100').addEventListener('keydown',function(){
      //리뷰 200자 초과 안되게 자동 자름
      let review = document.querySelector('.review_textarea');
      let lengthCheckEx = /^.{200,}$/;
      if(lengthCheckEx.test(review.value)){
          //200자 초과 컷
          review.value = review.value.substr(0,200);
      }
  });
  

  function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})



   var map;
   function initMap(){
      var ll={lat:37.500600, lng:127.036268};
      map=new google.maps.Map(
         document.getElementById('map'),
         {zoom:17,center:ll}
      );
      
      new google.maps.Marker(
         {position:ll,map:map,label:"마커-내 현재위치"}
      );
   }
   initMap(); // 구글맵 생성하기
   

   $(function() {
       $('div#star').raty({
       	
           score: 0
           ,path : "star/images"
           ,width : 200
           ,click: function(score, evt) {
               $("#starRating").val(score);
               $("#displayStarRating").html(score);
           },half:     true,
           starHalf: 'star-half.png'
       });
       $('div#starRead').raty({
       	readOnly: true, score: 3 
           ,path : "star/images"
               ,width : 200
               },half:     true,
           starHalf: 'star-half.png'
       });
   });
</script>
</body>
</html>
  
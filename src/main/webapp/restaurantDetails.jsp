<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">


<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>식당정보 | 오늘의메뉴</title>
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

<!-- 별점 api 관련 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="star/jquery.raty.js"></script>
<script type="text/javascript">
$(function() {
    $('.star').raty({
    	
        score: 0
        ,path : "star/images"
        ,width : 200
        ,click: function(score, evt) {
            $("#starRating").val(score);
            $("#displayStarRating").html(score);
        },half:     true,
        starHalf: 'star-half.png'
    });
    $('.starRead').raty({
    	readOnly: true, score: 3.5 
        ,path : "star/images"
            ,width : 200
            ,half:true,
        starHalf: 'star-half.png'
    });
});
</script>

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
							<img class="img-fluid" src="${rdatas.resPic}" alt="크롤링한 사진">
							<!--식당 사진 -->
						</div>
						<div class="blog_details">
							<h2>${rdatas.resName}</h2>
							<div class="starRead">${rdatas.resAvg}</div>

							<div class="blog-author">
								<div class="media align-items-center" style="display: inline">
									<div class="media-body">
										<div class="quotes">
											<div>주소: ${rdatas.resAdd}</div>
										</div>
									</div>
									<div class="media-body">
										<div class="quotes">
											<div>연락처: ${rdatas.resPhone}</div>
										</div>
									</div>
									<div class="media-body">
										<div class="quotes">
											<div>카테고리: ${rdatas.resCategory}</div>
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>

				</div>
			</div>


			<div class="navigation-top">

				<div class="navigation-area">

					<h2>메뉴</h2>
					<!-- 메뉴등록 -->

					<!-- 식당주인만 보이는 메뉴 -->
					<c:if test="${rdatas.memId eq memberid}">
						<a href="menuInsert.jsp?${rdatas.resId}">메뉴등록</a>
					</c:if>
					<hr>
					<c:forEach var="mlist" items="${mdatas}">
						<div>
							<div>
								<a
									href="menudetail.do?menuId=${mlist.menuId}&resId=${rdatas.resId}"><h4
										style="text-align: left">${mlist.menuName}</h4> <!-- 식당주인만 보이는 메뉴 -->
									<c:if test="${rdatas.memId eq memberid}">
										<!-- 메뉴수정삭제 -->
										<a href="menuDetail.jsp?${rdatas.resId}">메뉴수정/삭제</a>
									</c:if> </a>


								<h5 style="text-align: right">${mlist.menuPrice}</h5>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>


			<div class="comments-area">
				<!-- 리뷰 -->
				<h4>리뷰</h4>
				<c:forEach var="v" items="${datas}">
					<c:set var="vo" value="${v.revVO }" />
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="${vo.revPic}" alt="">
								</div>
								<div class="desc">
									<p class="comment">${vo.revCont}</p>
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-center">
											<h5>
												<p>${vo.memId}</p>
											</h5>
											<p class="date">${vo.revDate}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<button type="submit"
					class="button button-contactForm btn_1 boxed-btn">
					<a href="detail.do?a=${a}&b=${b+5}">더보기&nbsp;</a>
				</button>

			</div>

			<div class="comment-form">
				<c:set var="vo" value="${v.revVO }" />
				<!-- 리뷰 작성 -->
				<h4>리뷰 남기기</h4>
				<!-- 리뷰 별점 -->
				<div class="star"></div>
				<form method="post" action="revinsert.do"
					enctype="multipart/form-data">
					<div class="col-sm-6">
						<div class="form-group">
							<rev:detailboard type="board" />
							<input type="hidden" name="memId" value="${vo.memId}"> <input
								type="hidden" name="revTitle" value="${vo.revTitle}"> <input
								class="form-control valid" name="revtitle" id="revtitle"
								type="text" placeholder="제목">
						</div>
					</div>
					<label for="starRating"> </label><input type="hidden"
						id="starRating" name="star" value="5" />
					<div class="row">
						<div class="col-12">
							<rev:detailboard type="reply" />
							<input type="hidden" name="memId" value="${vo.memId}"> <input
								type="hidden" name="revContent" value="${vo.revContent}">
							<div class="form-group">
								<textarea class="form-control w-100" id="comment" cols="30"
									rows="9" placeholder="200자 내외 작성"></textarea>
							</div>
						</div>
					</div>
					<br>
					<!-- 이미지 등록 -->

					<div class="image-container">
						<input style="display: block;" type="file" id="bb">
					</div>
					<br> <br>
					<div class="form-group">
						<button type="submit" id="save" name="reviewdata"
							class="button button-contactForm btn_1 boxed-btn">작성</button>
					</div>
				</form>
				<!-- 이미지 프리뷰  -->
				<script type="text/javascript">
 
	function readImage(input) {
		console.log('확인');
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("cc")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }                      
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("bb")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
	</script>
				<img style="width: 300px; height: 300px;" id="cc"
					src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
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
				<!-- 관리자일때 식당 수정 및 삭제 아직 미완성  
<aside class=" single_sidebar_widget search_widget">
							<div class="blog_right_sidebar">
							<div><rev:detailboard type="adminupdate" /></div>
							<div><rev:detailboard type="admindelete" /></div>
								
							</div>
						</aside>
-->

				<aside class=" single_sidebar_widget search_widget">
					<div class="blog_right_sidebar">
						<h4 class="widget_title">식당 지도</h4>
						<div id="map" style="width: 150px; height: 150px;"></div>
						<script
							src="https://maps.googleapis.com/maps/api/js?&callback=initMap&v=weekly"
							async></script>
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
   
  
   document.querySelector('#content').addEventListener('keydown',function(){
	      //리뷰 200자 초과 안되게 자동 자름
	      let review = document.querySelector('.review_textarea');
	      let lengthCheckEx = /^.{200,}$/;
	      if(lengthCheckEx.test(review.value)){
	          //200자 초과 컷
	          review.value = review.value.substr(0,200);
	      }
	  });
	     
   //저장 전송전 필드 체크 이벤트 리스너
   document.querySelector('#content').addEventListener('click', function(e){
       //별점 선택 안했으면 메시지 표시
       if(rating.rate == 0){
           rating.showMessage('rate');
           return false;
       }
       //리뷰 5자 미만이면 메시지 표시
       if(document.querySelector('#content').value.length < 5){
           rating.showMessage('review');
           return false;
       }
       //폼 서밋
		//실제로는 서버에 폼을 전송하고 완료 메시지가 표시되지만 저장된 것으로 간주하고 폼을 초기화 함.
		alert("리뷰 작성 완료!");
		rating.setRate(0);
		document.querySelector('.review_textarea').value = '';
   });
</script>
</body>
</html>

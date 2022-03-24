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

         score : 0,
         path : "star/images",
         width : 200,
         click : function(score, evt) {
            $("#starRating").val(score);
            $("#displayStarRating").html(score);
         },
         half : true,
         starHalf : 'star-half.png'
      });
      $('.starRead').raty({
         readOnly : true,
         score : document.getElementById('avg').innerText, //평점이 들어와야 함
         path : "star/images",
         width : 200,
         half : true,
         starHalf : 'star-half.png'
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

<style type="text/css">
/*지도*/
#map {
	width: 300px;
	height: 300px;
}
/*[주소 연락처 카테고리]박스*/
.single-post-area .blog-author {
	padding-top: 40px;
	padding-right: 30px;
	padding-bottom: 40px;
	padding-left: 0px;
	background: #fbf9ff;
	margin-top: 50px;
}

.single-post-area .quotes {
	background: #fff;
	padding: 15px 15px 15px 20px;
	border-left: 2px solid #78b454;
}

.row {
	display: flex;
	justify-content: center;
	margin-left:0px !important;
}
</style>

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
	<div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
		<div class="breadcam_inner">
			<div class="breadcam_text">
				<h3>${rdatas.resName}</h3>
				<p>해당 식당의 메뉴와 정보, 회원들의 평가를 볼 수 있습니다.</p>
			</div>
		</div>
	</div>
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
							<div class="starRead" id="avg">${rdatas.resAvg}</div>
							<div class="blog-author">
								<div class="media align-items-center" style="display: inline">
									<div class="media-body">
										<div class="quotes">
											<div>
												<strong>주소: </strong>${rdatas.resAdd}</div>
										</div>
									</div>
									<div class="media-body">
										<div class="quotes">
											<div>
												<strong>연락처: </strong>${rdatas.resPhone}</div>
										</div>
									</div>
									<div class="media-body">
										<div class="quotes">
											<div>
												<strong>카테고리: </strong>${rdatas.resCategory}</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="blog_right_sidebar">
						<h4 class="widget_title">식당 지도</h4>
						<div id="map"></div>

						<!-- ★★★★★★★★★★★★ -->
						<!-- API키 가리자!!! -->
						<!-- ★★★★★★★★★★★★ -->

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=694c9ab3f664361d1773efc074982d6e&libraries=services"></script>
					</div>


					<div class="navigation-top">

						<div class="navigation-area">

							<h2>메뉴</h2>
							<!-- 메뉴등록 -->

							<!-- 식당주인만 보이는 메뉴 -->
							<c:if test="${rdatas.memId eq memberid}">
								<a href="menuInsert.jsp?${rdatas.resId}">[메뉴등록]</a>
							</c:if>

							<hr>
							<c:forEach var="mlist" items="${mdatas}">
								<div>
									<div>
										<!-- 메뉴이름 -->
										<h5 style="text-align: left;">${mlist.menuName}</h5>
										<!-- 식당주인만 보이는 메뉴 -->
										<c:if test="${rdatas.memId eq memberid}">
											<!-- 메뉴수정삭제 -->
											<a
												href="menudetail.do?menuId=${mlist.menuId}&resId=${rdatas.resId}">[메뉴수정/삭제]</a>
										</c:if>

										<!-- 가격 -->
										<h5 style="text-align: right">${mlist.menuPrice}원</h5>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>




					<!-- 리뷰 출력-->
					<div class="comments-area">
						<h4>리뷰</h4>
						<c:forEach var="rev" items="${revdatas}">
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img src="img/Favicon_Img.png" alt="">
										</div>
										<div class="desc">
											<h4>${rev.revTitle}</h4>
											<p class="comment">${rev.revCont}</p>
											<div class="d-flex justify-content-between">
												<div class="d-flex align-items-center">
													<h5>작성자 : ${rev.memName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</h5>
													<small> 등록날짜 :
														${rev.revRegDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </small>
													<h5>별점 : ${rev.revScore}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</h5>
												</div>
												<br>
											</div>
											<br>
										</div>
									</div>
								</div>
						</c:forEach>
						<button type="submit"
							class="button button-contactForm btn_1 boxed-btn">
							<a href="resdetail.do?resId=${rdata.resId}&num=${num+2}">더보기&nbsp;</a>
						</button>
					</div>





					<div class="comment-form">
						<c:choose>
							<c:when test="${ memberid != null }">
								<!-- 로그인되어있다면 리뷰작성 -->

								<c:if test="${ynrevVO==null}">
									<!-- 리뷰를 작성하지 않았다면 -->
									<!-- 리뷰 작성 -->
									<h4>리뷰 남기기</h4>
									<!-- 리뷰 별점 -->
									<form method="post" action="revinsert.do">
										<div class="star"></div>
										<div class="col-sm-6">
											<div class="form-group">

												<input type="hidden" name="memId" value="${memberid}">
												<input type="hidden" name="memName" value="${member}">
												<input type="hidden" name="resId" value="${rdatas.resId}">
												<input class="form-control valid" name="revtitle"
													id="revtitle" type="text" placeholder="제목" required>
											</div>
										</div>
										<label for="starRating"> </label><input type="hidden"
											id="starRating" name="revScore" value="5" />
										<div class="row">
											<div class="col-12">

												<div class="form-group">
													<textarea class="form-control w-100" id="comment" cols="30"
														rows="9" placeholder="200자 내외 작성" name="revContent"
														required></textarea>
												</div>
											</div>
										</div>
										<br>

										<div class="form-group">
											<button type="submit" id="save" name="reviewdata"
												class="button button-contactForm btn_1 boxed-btn">작성</button>
										</div>
									</form>
								</c:if>
								<c:if test="${ynrevVO!=null}">
									<!-- 리뷰를 작성했다면 -->
									<form method="post" action="revupdate.do">
										<div class="starRead" id="avg">${ynrevVO.revScore}</div>

										<div class="col-sm-6">
											<div class="form-group">
												<input type="hidden" name="revId" value="${ynrevVO.revId}">
												<input type="hidden" name="resId" value="${rdatas.resId}">
												<input class="form-control valid" name="revTitle"
													id="revtitle" type="text" value="${ynrevVO.revTitle}"
													placeholder="${ynrevVO.revTitle}" required>
											</div>
										</div>
										<label for="starRating"></label> <input type="hidden"
											id="starRating" name="revScore" value="5" />
										<div class="row">
											<div class="col-12">

												<div class="form-group">
													<textarea class="form-control w-100" id="comment" cols="30"
														rows="9" placeholder="${ynrevVO.revCont}" name="revCont"
														required></textarea>
												</div>
											</div>
										</div>
										<br>

										<div class="form-group">
											<button type="submit" id="save" name="reviewdata"
												class="button button-contactForm btn_1 boxed-btn">수정</button>
										</div>
									</form>
								</c:if>

							</c:when>

						</c:choose>


						<!-- 이미지 프리뷰  -->


					</div>
					<c:if test="${rdatas.memId eq memberid}">
						<!-- 메뉴수정삭제 -->
						<div class="button-group-area mt-10">


							<a href="resdetail.do?resId=${rdatas.resId}&act=1"
								class="genric-btn primary-border e-large">식당 수정</a> <a
								href="resdelete.do?resId=${rdatas.resId}"
								class="genric-btn primary e-large">식당 삭제</a>
						</div>


					</c:if>
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
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
       center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
   };  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch("${rdatas.resAdd}", function(result, status) {

   // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시합니다
       var marker = new kakao.maps.Marker({
           map: map,
           position: coords
       });

       // 인포윈도우로 장소에 대한 설명을 표시합니다
       var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">"${rdatas.resName}"</div>'
       });
       infowindow.open(map, marker);

       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       map.setCenter(coords);
   } 
});

      document.querySelector('#content').addEventListener('keydown',
            function() {
               //리뷰 200자 초과 안되게 자동 자름
               let review = document.querySelector('.review_textarea');
               let lengthCheckEx = /^.{200,}$/;
               if (lengthCheckEx.test(review.value)) {
                  //200자 초과 컷
                  review.value = review.value.substr(0, 200);
               }
            });

      //저장 전송전 필드 체크 이벤트 리스너
      document.querySelector('#content').addEventListener('click',
            function(e) {
               //별점 선택 안했으면 메시지 표시
               if (rating.rate == 0) {
                  rating.showMessage('rate');
                  return false;
               }
               //리뷰 5자 미만이면 메시지 표시
               if (document.querySelector('#content').value.length < 5) {
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
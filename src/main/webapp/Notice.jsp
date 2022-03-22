<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>더보기 | 오늘의메뉴</title>
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

<!-- 아코디언 플러그인 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>



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

	<script type="text/javascript">
   $.ajax({
      type: "GET", // 데이터를 로드해오는 방식
      url: "faq.json", // 로드할 파일이름
      dataType: "json", // 현재 다루는 데이터 타입
      success: function(data){ // 로드 성공시 수행할 메서드
         // function()에 인자를 두면, 로드성공한 json데이터가 저장됨!
         var ele = "";
      
         // $.each( 타깃 데이터(로드한 json 데이터) , 수행할 메서드 );
         $.each(data,function(){
            ele+="<li class="this.class1">";
            ele+="<h5 class="this.class2">"+this.title+"</h5>";
            ele+="<div class="this.class3">"+this.content+"</td>";
            ele+="</li>";     
         });
         
         $("#json").append(ele);
      },
      error: function(err){ // 로드 실패시 수행할 메서드
         // function()에 인자를 두면, 로드실패시 예외정보가 저장됨!
         // 에러의 상태,내용에 대한 메세지 등을 출력
         console.log('에러발생!');
         console.log(err.status+" | "+err.errText);
      }
   });
</script>

<style type="text/css">
* {
	font-family: 'Gothic A1', sans-serif;
}

* {
	margin: 0;
	padding: 0;
}

.sample-text-area {
	background: #fff;
	padding: 100px 0 0 0;
}

.tit {
	padding: 10px;
	font-weight: bold;
}

.accodian {
	list-style: none
}

.accodian--box {
	margin-bottom: 5px;
}

.accodian--box h5 {
	padding: 5px;
	cursor: pointer
}

.accodian--box div {
	padding: 5px;
	display: none;
}

.question:hover {
	font-weight: bold;
}

.answer {
	color: #777777;
}
</style>


<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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
				<h3>더보기</h3>
				<p>회사소개/공지사항/FAQ/빠르게 이용하기를 확인 및 이용가능합니다.</p>
			</div>
		</div>
	</div>
	<!-- breadcam_area_end -->



	<!-- 회사 소개 시작 -->
	<a id="company"></a>
	<section class="sample-text-area">

		<div class="container box_1170">
			<h2>회사소개</h2>
			<hr>
			<br> <br> <br>
			<p class="sample-text">
				우리는 좋은 음식을 통해 더 나은 삶을 만들 수 있다고 믿습니다.<br> 외식업의 본질인 좋은 음식과 서비스에만
				집중할 수 있는 환경을 만들기 위해, 외식 사업자들의 파트너로서 신뢰할 수 있는 외식 통합 플랫폼을 만들어나가고 있습니다.<br>
				<br> 매일 무엇을 먹을지 고민하는 이들에게는 더 나은 선택을 위한 가이드를 제공하며,<br> 좋은
				음식과 서비스를 제공하는 외식 사업자에게는 실질적인 도움을 제공하는 파트너가 되고자 합니다.
			</p>

			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
	</section>
	<!-- 회사 소개 끝 -->



	<!-- 공지사항 시작 -->
	<a id="notice"></a>
	<div class="whole-wrap">
		<div class="container box_1170">

			<!-- 자주 묻는 질문 시작 -->

			<a id="faq"></a>
			<div class="section-top-border">
				<h2 class="mb-30">FAQ</h2>
				<hr>
				<br>
				<div class="row">
					<div class="col-md-9" id="json">

						<!-- 자주 묻는 list 끝 -->
					</div>
				</div>
			</div>
			<hr>
			<br> <br> <br>
			<!-- 자주 묻는 질문 끝 -->
			<div>
				<a id="ask"></a>
			</div>



			<!-- 빠르게 문의하기 시작 -->
			<br> <br> <br>
			<div class="row">
				<div class="col-12">
					<h2 class="contact-title">빠르게 문의하기</h2>
				</div>
				<div class="col-lg-8">
					<form class=""
						action="CustomerService.do" method="post" id="">

						<div class="row">
							<!-- 문의 사항 작성 -->
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control w-100" name="message"
										id="message" cols="30" rows="9"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Message'"
										placeholder=" Please write down your questions "></textarea>
								</div>
							</div>

							<!-- 이름 작성 -->
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control valid" name="name" id="name"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter your name'"
										placeholder="Enter your name">
								</div>
							</div>

							<!-- 이메일 작성 -->
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control valid" name="email" id="email"
										type="email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter email address'"
										placeholder="Email">
								</div>
							</div>
						</div>


						<!-- 문의 사항 전송 -->
						<div class="form-group mt-3">
							<button type="submit" class="boxed-btn" id="send-btn">Send</button>
						</div>

					</form>
					
					
					
					
					
				</div>
			</div>

			<!-- 빠르게 문의하기 끝 -->

		</div>
	</div>
	<!-- End Align Area -->




	<!-- 아코디언 플러그인 함수 -->
	<script type="text/javascript">
		var accModule = function() {

			// private member (비공개 멤버, 고유멤버)
			var acc_wrap = $('.accodian'), question = acc_wrap.find('h5'), answer = question
					.next('div');

			// privilieged member(공용 인터페이스)
			return {
				runInit : function() {
					this.accHandler();
				},
				accHandler : function() {
					var accodian = {
						targetClick : function(e) {
							var eTarget = $(e.currentTarget);
							if (eTarget.next().is(':visible')) {
								eTarget.next().slideUp();
								return;
							}
							answer.slideUp();
							eTarget.next().slideDown();
						}
					};
					question.on('click', accodian.targetClick);
				}
			}
		}();

		// 실행
		accModule.runInit();
	</script>




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
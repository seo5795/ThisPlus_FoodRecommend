<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--컨트롤러 연결 후 import="mypage.*" 추가-->

<!Doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원탈퇴 | 오늘의메뉴</title>

<link rel="shortcut icon" type="image/x-icon" href="img/favicon-customer.ico">

<!-- Google Web Fonts by JHS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">

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

<!-- 내부 스타일시트 by 현 -->
<style type="text/css">
*{
	font-family: 'Gothic A1', sans-serif;
}
.form-contact .form-control{
	border: 1px solid gray;
}

.contact-title {
	font-size: 27px;
	font-weight: 600;
	margin-bottom: 50px;
}

/*확인,취소 버튼*/
.buttons {
	display: flex;
}

/*확인버튼*/
.start-button {
	margin-right: 20px;
}

/*하나의 타이틀과 input태그 감싸는 div태그*/
.form-contact .form-group {
	margin-bottom: 20px;
}

/*정보 수정(작성) 시 입력값 에러 문구 */
.error_next_box {
	margin: 0 0 20px;
	font-size: 12px;
	padding: 0 20px;
	color: red;
}

/* */
.small-title {
	padding-left: 0.75rem;
}

.switch-wrap {
    padding-left: 15px;
}   

/*탈퇴문구*/
.message {
	color: red;
}
</style>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->

</head>

<body>
<script type="text/javascript">
	function del(){
		ans=confirm("정말 탈퇴하시겠습니까? 데이터는 복원되지않습니다!");
		if(ans==true){
			document.checkForm.action.value="memdelete.do?memId=${data.memId}";
			document.checkForm.submit();
		}
		else{
			return;
		}
	}
</script>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header id="headers">
		<jsp:include page="common/nav.jsp" />
	</header>
	<!-- header-end -->

	<!-- breadcam_area_start -->
	<div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
		<div class="breadcam_inner">
			<div class="breadcam_text">
				<h3>회원탈퇴</h3>
				<p>아래에서 회원탈퇴를 진행할 수 있습니다.</p>
			</div>
		</div>
	</div>
	<!-- breadcam_area_end -->

	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">



			<div class="row">
				<div class="col-12">
					<h2 class="contact-title">회원탈퇴</h2>
				</div>

				<!-- 내 정보  -->
				<div class="col-lg-8">
					<form class="form-contact contact_form" action="memdelete.do?memId=${data.memId}" method="post"
						id="contactForm" name="join">
						<div class="row" style="margin-left: 0px;">

							<!-- 비밀번호 start -->
							<div class="col-12">
								<div class="form-group">
									<h4 class="small-title">현재 비밀번호</h4>
									<input class="form-control check" name="password" id="password"
										type="password" 
										placeholder="현재 본인의 비밀번호를 입력하세요.">
								</div>
								<div id="pw1Error" class="error_next_box"></div>
							</div>
							<!-- 비밀번호 end -->

							<!-- 비밀번호 확인 start -->
							<div class="col-12">
								<div class="form-group">
									<h4 class="small-title">현재 비밀번호 확인</h4>
									<input class="form-control check" name="password" id="password"
										type="password"
										placeholder="비밀번호를 한 번 더 입력하세요.">
								</div>
								<div id="pw2Error" class="error_next_box"></div>
							</div>
							<!-- 비밀번호 확인 end -->
							<div class="col-12">
								<p class="message">※사용하고 계신 아이디는 탈퇴할 경우 복구가 불가능합니다※</p>
							</div>
						</div>


						<!-- 확인/취소 버튼 start-->
						<div class="buttons">

							<!-- 확인 버튼 start -->
							<div class="form-group mt-3 start-button">
								<button type="submit"
									class="button button-contactForm boxed-btn" onclick="del();">확인</button>
							</div>
							<!-- 확인 버튼 end -->

							<!-- 취소 버튼 start -->
							<div class="form-group mt-3">
								<!-- 향후 a href="ㅁㅁㅁ.do"로 수정 -->
								<a href="#"><button type="button"
										class="button button-contactForm boxed-btn">취소</button></a>
							</div>
							<!-- 취소 버튼 end -->
						</div>
						<!-- 확인/취소 버튼 end-->
					</form>
				</div>

				<!-- 정보수정 end -->
				
				<!-- 기업 정보 start -->
				<!-- <div class="col-lg-3 offset-lg-1">
					<div class="media contact-info">
						<span class="contact-info__icon"><i class="ti-home"></i></span>
						<div class="media-body">
							<h3>Buttonwood, California.</h3>
							<p>Rosemead, CA 91770</p>
						</div>
					</div>
					<div class="media contact-info">
						<span class="contact-info__icon"><i class="ti-tablet"></i></span>
						<div class="media-body">
							<h3>+1 253 565 2365</h3>
							<p>Mon to Fri 9am to 6pm</p>
						</div>
					</div>
					<div class="media contact-info">
						<span class="contact-info__icon"><i class="ti-email"></i></span>
						<div class="media-body">
							<h3>support@colorlib.com</h3>
							<p>Send us your query anytime!</p>
						</div>
					</div>
				</div>
				<!-- 기업 정보 end -->
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->

	<!-- footer-start -->
	<jsp:include page="common/footer.jsp" />
	<!-- footer-end -->

	<!-- JS here -->
	<script src="js/mypage_deleteAccount.js"></script>

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
	<!--  <script src="js/contact.js"></script> -->
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>

</body>

</html>
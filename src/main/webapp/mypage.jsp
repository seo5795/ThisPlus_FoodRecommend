<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--컨트롤러 연결 후 import="mypage.*" 추가-->

<!Doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>내정보 | 오늘의메뉴</title>

<link rel="shortcut icon" type="image/x-icon"
	href="img/favicon-customer.ico">

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

<!-- 내부 스타일시트 by 현 -->
<style type="text/css">
* {
	font-family: 'Gothic A1', sans-serif;
}
/*내정보전체박스*/
.row {
	
}

.file {
	padding-top: 8px;
	padding-bottom: 7px;
	padding-left: 3px;
}

.contact-section {
	padding: 100px 0 100px;
}

input {
	border: 1px solid #ced4da;
}

.form-contact .form-control {
	border: 1px solid #ced4da;
	font-size: 16px;
	color: black;
}

.contact-title {
	font-size: 27px;
	font-weight: 600;
	margin-bottom: 50px;
}

.address-position {
	margin-left: 15px;
}

/*확인,취소 버튼*/
.buttons {
	display: flex;
	margin-top: 30px;
	margin-left: 15px;
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
</style>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->

<script type="text/javascript">
	//주소검색시 사용되는 script
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "http://localhost:8010/register/regitser.jsp";

	function goPopup() {
		// 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.join.roadAddrPart1.value = roadAddrPart1;
		document.join.roadAddrPart2.value = roadAddrPart2;
		document.join.addrDetail.value = addrDetail;
		document.join.zipNo.value = zipNo;
	}
</script>

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

	<!-- breadcam_area_start -->
	<div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
		<div class="breadcam_inner">
			<div class="breadcam_text">
				<h3>내 정보</h3>
				<p>아래에서 회원님의 정보를 수정할 수 있습니다.</p>
			</div>
		</div>
	</div>
	<!-- breadcam_area_end -->

	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">



			<div class="row">
				<div class="col-12">
					<h2 class="contact-title" style="margin-left: 15px;">내 정보</h2>
				</div>
				<!-- 내 정보  -->
				<div class="col-lg-8">
					<form class="form-contact contact_form" action="memmypageupdate.do" method="post"
						id="contactForm" name="join">
						<div class="row" style="margin-left: 0px;">

							<!-- password, name, email, memPhone, memAdress, memPic 이하 6개만 업데이트 가능
							     나머지 id, rank, Point -->

							<!-- 아이디 start -->
							<div class="col-12">
								<div class="form-group">
									<h4 class="small-title">아이디</h4>
									<input class="form-control check" type="text" name="memId" id="id"
										value="${data.memId}" placeholder="${data.memId}" disabled>
								</div>
								<div id="idError" class="error_next_box"></div>
							</div>
							<!-- 아이디 end -->

							<!-- 비밀번호 start -->
							<div class="col-12">
								<div class="form-group">
									<h4 class="small-title">비밀번호</h4>
									<input class="form-control check" name="memPw" id="password"
										type="password" value="${data.memPw}"
										placeholder="${data.memPw}">
								</div>
								<div id="pw1Error" class="error_next_box"></div>
							</div>
							<!-- 비밀번호 end -->

							<!-- 비밀번호 확인 start -->
							<div class="col-12">
								<div class="form-group">
									<h4 class="small-title">비밀번호 확인</h4>
									<input class="form-control check" name="passCheck" id="password"
										type="password" value="${data.memPw}"
										placeholder="${data.memPw}">
								</div>
								<div id="pw2Error" class="error_next_box"></div>
							</div>
							<!-- 비밀번호 확인 end -->

							<!-- 사용자이름 start -->
							<div class="col-sm-12">
								<div class="form-group">
									<h4 class="small-title">이름</h4>
									<input class="form-control check" type="text" name="memName"
										id="name" value="${data.memName}"
										placeholder="${data.memName}">
								</div>
								<div id="nameError" class="error_next_box"></div>
							</div>
							<!-- 사용자이름 end -->

							<!-- 이메일 start -->
							<div class="col-sm-12">
								<div class="form-group">
									<h4 class="small-title">이메일</h4>
									<input class="form-control check" name="memEmail" id="id"
										type="email" value="${data.memEmail}"
										placeholder="${data.memEmail}">
								</div>
								<div id="emailError" class="error_next_box"></div>
							</div>
							<!-- 이메일 end -->

							<!-- 핸드폰 번호 start -->
							<div class="col-sm-12">
								<div class="form-group">
									<h4 class="small-title">전화번호</h4>
									<input class="form-control check" name="memPhone"
										id="phoneNumer" type="text" value="${data.memPhone}"
										placeholder="${data.memPhone}">
								</div>
								<div id="phoneNumError" class="error_next_box"></div>
							</div>
							<!-- 핸드폰 번호 end -->

							<!-- 주소 start -->
							<!-- <div class="col-sm-12">
								<div class="form-group">
									<h4 class="small-title">주소</h4>
									<input class="form-control" name="adress" id="adress"
										type="text" value="${vo.memAddress}" placeholder="주소">
								</div>
							</div> -->
							<div class="form-group">
								<h4 class="small-title address-position">주소</h4>
								<div class="switch-wrap d-flex justify-content-between">
									<table>
										<colgroup>
											<col style="width: 20%">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;우편번호</td>
												<td><input type="hidden" id="confmKey" name="confmKey"
													value=""> <input type="text" id="zipNo"
													name="zipNo" class="check" readonly style="width: 100px">
													<input type="button" value="주소검색" onclick="goPopup();"></td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;도로명주소</td>
												<td><input type="text" id="roadAddrPart1" name="memAddress"
													style="width: 85%" class="add" value="${data.memAddress}" readonly></td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;상세주소</td>
												<td><input type="text" id="addrDetail"
													style="width: 40%" class="add" value=""> <input
													type="text" id="roadAddrPart2" style="width: 40%"
													class="add" value="" readonly></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 주소 end -->

							<!-- 프로필 start -->
							<!-- <div class="col-sm-12">
								<div class="form-group">
									<h4 class="small-title">프로필</h4>
									<input class="form-control file" name="memPic" id="pic"
										type="file" value="${data.memPic}">
								</div>
							</div> -->
							<!-- 프로필 end -->

							<!-- 등급 start -->
							<!-- ★ input태그 속성으로 disabled를 주었기에, rank&point는 업데이트에 반영되지않도록
							     DAO에서 처리해주세요! -->
							<div class="col-sm-12">
								<div class="form-group">
									<h4 class="small-title">등급</h4>
									<c:choose>
										<c:when test="${ data.memRank == 0 }">
											<c:set var="rank" value="고객님" />
										</c:when>
										<c:when test="${ data.memRank == 1 }">
											<c:set var="rank" value="사장님" />
										</c:when>
										<c:when test="${data.memRank == 2 }">
											<c:set var="rank" value="최고관리자" />
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

									<input class="form-control valid" name="memRank" id="rank"
										type="text" value="${rank}" placeholder="${rank}" disabled>
								</div>
							</div>
							<!-- 등급 end -->

							<!-- 포인트 start -->
							<div class="col-sm-12">
								<div class="form-group">
									<h4 class="small-title">포인트</h4>
									<input class="form-control valid" name="memPoint" id="point"
										type="text" value="${data.memPoint}"
										placeholder="${data.memPoint}" disabled>
								</div>
							</div>
							<!-- 포인트 end -->
						</div>


						<!-- 확인/취소 버튼 start-->
						<div class="buttons">

							<!-- 확인 버튼 start -->
							<div class="form-group mt-3 start-button">
								<button type="submit"
									class="button button-contactForm boxed-btn">확인</button>
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
				<!--   <div class="col-lg-3 offset-lg-1">
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
	<script src="js/mypage.js"></script>
	<!-- 회원가입폼 js (register.js) -->
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
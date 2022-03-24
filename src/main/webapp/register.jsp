<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원가입 | 오늘의메뉴</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

/*인풋 박스*/
.single-input-primary {
	border-radius: 0px;
	border: 1px solid #ced4da;
	height: 42px;
	width: 528px;
}

.single-input-primary:focus {
	border: 1px solid #78b454;
}
/*인풋 박스들 위아래간격*/
.mt-10 {
	margin-top: 20px;
}

/*인증번호 박스*/
.num-checkbox {
	margin-top: 20px;
}
/*회원구분 선택 박스*/
.form-select .nice-select {
	border: none;
	border-radius: 0px;
	height: 40px;
	background: #f9f9ff;
	padding-left: 30px;
	padding-right: 50px;
	width: 27%;
	border: 1px solid #ced4da;
}

/*일반회원,사장 선택*/
.form-select .nice-select .list .option.selected {
	color: #78b454;
	background: transparent;
}

/*주소입력공간*/
#zipNo, #roadAddrPart1, #roadAddrPart2, #addrDetail {
	border: 1px solid #ced4da;
}

/*개인정보 동의 체크박스*/
.agree {
	border: 1px solid #ced4da;
}
/* */
.form-select {
	margin: 15px 0 15px 0;
}

/*에러메세지*/
.error_next_box {
	margin-top: 10px;
	font-size: 12px;
	padding: 0 20px;
	color: red;
}

/*중복확인,문자인증,문자전송 버튼*/
.genric-btn.success {
	color: #fff;
	background: #78b454;
	border: 1px solid transparent;
	margin-left: 10px;
}

/*중복확인,문자인증,문자전송 버튼: 마우스올렸을때*/
.genric-btn.success:hover {
	color: #78b454;
	border: 1px solid #78b454;
	background: #fff;
}
/*회원가입 버튼*/
.genric-btn.primary-border:hover {
	color: #fff;
	background: #78b454;
	border: 1px solid transparent;
}
/*회원가입 버튼*/
.genric-btn.primary-border {
	color: #78b454;
	border: 1px solid #78b454;
	background: #fff;
}

select {
	display: block;
	width: 100%;
	line-height: 40px;
	border: 1px solid transparent;
	outline: none;
}

.add {
	background: #f9f9ff;
	border: 1px solid transparent;
}

#sms, #sms2 {
	align-self: flex-end;
}

.imgPreview {
	margin-top: 92px;
	padding: 10px;
	width: 420px;
	height: 320px;
	border: 1px solid #ced4da;
	text-align: center;
}

.section-top-border {
	padding-top: 100px;
	padding-bottom: 100px;
}

.form-select .nice-select .list .option:hover {
	color: #78b454;
	background: transparent;
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
				<h3>회원가입</h3>
				<p>아래의 절차에 따라 회원가입을 할 수 있습니다.</p>
			</div>
		</div>
	</div>
	<!-- breadcam_area_end -->



	<script type="text/javascript">
		// 이미지 미리보기
		function preview(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
	</script>



	<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container box_1170">

			<div class="section-top-border">
				<div class="row" style="justify-content: center">
					<div class="col-lg-8 col-md-8">
						<h3 class="mb-30">회원가입</h3>
						<form action="signup.do" name="join" method="post"
							enctype="multipart/form-data">
							<div class="mt-10">
								<div class="box int_id" style="display: flex">
									<input type="text" name="memid" placeholder="아이디"
										class="single-input-primary check" id="id" style="width: 80%">
									<a href="#" class="genric-btn success radius" id="idcheck"
										style="height: 70%">중복확인</a>
								</div>
								<div id="idError" class="error_next_box"></div>
								<input type="hidden" id="idcheckval" />
							</div>
							<div class="mt-10">
								<input type="password" name="memPw" placeholder="패스워드"
									class="single-input-primary check">
								<div id="pw1Error" class="error_next_box"></div>
							</div>
							<div class="mt-10">
								<input type="password" name="memPw2" placeholder="패스워드 확인"
									class="single-input-primary check">
								<div id="pw2Error" class="error_next_box"></div>
							</div>
							<div class="mt-10">
								<input type="text" name="memName" placeholder="이름"
									class="single-input-primary check">
								<div id="nameError" class="error_next_box"></div>
							</div>
							<div class="mt-10 input-group-icon">
								<input type="email" name="memEmail" placeholder="이메일"
									class="single-input-primary check">
								<div id="emailError" class="error_next_box"></div>
							</div>

							<div class="mt-10">
								<div style="display: flex">
									<input type="text" name="memPhone" placeholder="핸드폰번호"
										class="single-input-primary check" style="width: 80%"><a
										href="#" class="genric-btn success radius" id="sms"
										style="height: 70%">문자전송</a>
								</div>
								<div id="phoneNumError" class="error_next_box"></div>
								<div class="num-checkbox" style="display: flex">
									<input type="text" name="phoneCheck" placeholder="인증번호를 입력하세요"
										class="single-input-primary check" disabled style="width: 80%">
									<a href="#" class="genric-btn success radius" id="sms2"
										style="height: 70%">문자인증</a>
								</div>
								<div id="phonCheckError" class="error_next_box"></div>
								<input type="hidden" id="phoneDoubleChk" />

							</div>

							<div class="input-group-icon mt-10">
								<div class="form-select" id="default-select">
									<select name="memRank">
										<option value="0">일반 회원</option>
										<option value="1">식당 사장</option>
									</select>
								</div>
							</div>
							<hr>
							<div class="switch-wrap d-flex justify-content-between">
								<table>
									<colgroup>
										<col style="width: 20%">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<td>우편번호</td>
											<td><input type="hidden" id="confmKey" name="confmKey"
												value=""> <input type="text" id="zipNo" name="zipNo"
												class="check" readonly style="width: 100px"> <input
												type="button" value="주소검색" onclick="goPopup();"></td>
										</tr>
										<tr>
											<td>도로명주소</td>
											<td><input type="text" id="roadAddrPart1"
												style="width: 85%" class="add" name="memAdd" readonly></td>
										</tr>
										<tr>
											<td>상세주소</td>
											<td><input type="text" id="addrDetail"
												style="width: 40%" class="add" value=""> <input
												type="text" id="roadAddrPart2" style="width: 40%"
												class="add" value="" readonly></td>
										</tr>
									</tbody>
								</table>

							</div>
							<hr>
							<br>


							<!-- 
                     <div class="mt-10">
                        <div>
                           <select class="form-select check rank" id="default-select" name="memRank" style="padding-left: 20px" >
                              <option value="1" selected>고객님</option>
                              <option value="2">사장님</option>
                           </select>
                           <div id="typeError" class="error_next_box"></div>
                        </div>
                     </div>
                      -->

							<div class="mt-10" style="margin: 5px 0 15px 0">
								<input type="file" name="uploadfile" onchange="preview(this);"
									accept="image/*">

							</div>

							<div class="switch-wrap d-flex justify-content-between">

								<br> <br>
								<hr>
								<div class="switch-wrap d-flex justify-content-between">
									<ul class="accodian">
										<li class="accodian--box">
											<h5>개인정보 수집에 동의하시겠습니까?</h5>
											<div class="primary-checkbox agree">
												<input type="checkbox" id="primary-checkbox" checked>
												<label for="primary-checkbox"></label>
											</div>
											<hr>
											<div>
												회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자
												식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.<br> 콘텐츠 등 기존
												서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에
												기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴
												및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.<br> 법령 및 네이버 이용약관을 위반하는
												회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한
												방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존,
												민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.<br> 유료 서비스 제공에
												따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br>
												이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다. <br>서비스
												이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및
												광고 게재 등에 개인정보를 이용합니다.<br> 보안, 프라이버시, 안전 측면에서 이용자가 안심하고
												이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
											</div>
											<hr>
										</li>
									</ul>


								</div>
							</div>
							<input type="submit" class="genric-btn primary-border e-large"
								style="margin: 7px 0 20px 0" value="회원가입">
						</form>
						<div class="imgPreview">
							<img id="preview" width="400px" height="300px" /> 이미지 미리보기
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Align Area -->

	<!-- footer-start -->
	<jsp:include page="common/footer.jsp" />

	<!-- footer-end -->

	<!-- JS here -->
	<script src="js/register.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  -->
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
		var code = "";
		var num = "";
		$(function() {
			$("#sms").on("click", function() {//문자인증
				var phone = $('input[name=memPhone]').val();
				/*  var form ={
				      "hphone" : phone
				};  */
				console.log('phone1:' + phone);
				//console.log(form);
				//console.log(JSON.stringify(form));

				$.ajax({
					type : 'get',
					url : 'ajax.a',
					dataType : 'json',
					//data: JSON.stringify(form),
					data : {
						"phone" : phone
					},
					contentType : 'application/json; charset=UTF-8',
					success : function(result) {
						//핸드폰 번호를 AjaxController에 넘기고 랜덤번호를 받아올 때 나오는 창 
						
						console.log("데이터 도착");
						console.log(result.randomNum);
						//에러메시지 창에서 나오는 텍스트
						$("#phonCheckError").text("인증번호를 입력한 뒤 본인인증을 눌러주십시요");
						//disalbed처리되어있던 번호입력 iniput 해제
						$("input[name=phoneCheck]").attr("disabled", false);

						code = result.randomNum;

					},
					errer : function() {
						alert('errer');
					}
				})
			})
		})

		$(function() {
			$("#sms2").on("click", function() {
				//문자인증을 클릭한다면
				console.log("코드값:" + code);
				console.log("입력값:" + $("input[name=phoneCheck]").val());
				//입력값과 난수를 비교
				if ($("input[name=phoneCheck]").val() == code) {
					$("#phonCheckError").text("인증번호가 일치합니다");
					$("#phoneDoubleChk").val("true");

				} else {
					$("#phonCheckError").text("인증번호가 불일치합니다");
					$("#phoneDoubleChk").val("false");

				}
			})
		})

		$(function() {//중복id체크 비동기처리
			$('#idcheck').on('click', function() {
				$.ajax({
					type : 'get',
					url : 'check.a',
					dataType : 'json',
					data : {
						"id" : $('input[name=memid]').val()
					},
					success : function(data) {
						console.log(data.count);

						num = data.count;
						if ($.trim(data.count) == 0) {
							$("#idError").text("사용가능한 id입니다!");
							$("#idcheckval").val("true");
						} else {
							$("#idError").text("중복 id입니다!");
							$("#idcheckval").val("false");
						}
					}
				})
			})
		}); //end ajax }); //end on });
	</script>


</body>
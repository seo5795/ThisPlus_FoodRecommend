<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.resContainer {
	display: flex;
	justify-content: center;
}

.resContents {
	width: 750px;
	margin-top: 10px;
}

.resName, .resCategory, .sample5_address, .resPhone1, .resPhone2,
	.resPhone3 {
	border-radius: 5px;
}

.resPhone1, .resPhone2, .resPhone3 {
	width: 100px;
}
</style>
</head>
<body>

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


	<!-- 식당등록 start -->
	<div class="resContainer">
		<div class="resContents">
			<form action="resAdd.do" method="post">
				<br> <br>
				<h3>식당 등록</h3>
				<hr>

				<div class="rName">
					<span>식당 이름</span><br> <input class="resName" type="text"
						placeholder="식당 이름 입력" required>
				</div>
				<br>

				<div class="rCategory">
					<span>식당 종류</span><br> <input class="resCategory" type="text"
						placeholder="식당 종류 입력" required>
				</div>
				<br>

				<div class="rAdd">
					<span>식당 주소</span><br> <input type="text" id="sample5_address"
						placeholder="주소"> <input type="button"
						onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
					<div id="map"
						style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
				</div>
				<br>

				<div class="rPhone">
					<span>식당 전화번호</span><br> <input class="resPhone1" type="text"
						required>- <input class="resPhone2" type="text" required>-
					<input class="resPhone3" type="text" required>
				</div>
				<br>

				<div class="rPic">
					<span>식당 사진</span><br>
					<form action="uploadCheck.jsp" method="post"
						enctype="multipart/form-data">
						<br> <br> <input type="file" name="file"
							onchange="preview(this);" accept="image/*"><br> <br>
						<br> <input type="submit" value="Upload">
					</form>
				</div>
				<img id="preview" width="300px" />
				<hr>
				<input type="submit" value="식당 등록" style="float: right;">
			</form>
			<br> <br>
		</div>
	</div>

	<!-- 식당등록 end -->



	<!-- 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e60dadda7b68bff55723b386ed35f41c&libraries=services"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
	<!-- API 끝 -->



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
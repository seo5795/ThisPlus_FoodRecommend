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

<!-- 내부 CSS 적용 -->
<!-- 이후 취합할 때 CSS파일을 별도로 분리할 예정 -->
<style type="text/css">
.resContainer{
	display: flex;
	justify-content: center;
}
.resContents{
	width: 450px;
	margin-top: 10px;
}
.imgPreview{
	margin-top: 54px;
	padding: 10px;
	width: 420px;
	height: 320px;
	border: 1px solid lightgray;
	text-align: center;
}
.resName,.resCategory,.resAdd,.resPhone{
	border-radius: 5px;
}
.resPhone{
	width: 78px;
}
.fontPhone{
	font-size: 1.5em;
}

</style>
</head>
<body>

<!-- 이미지 미리보기 로직 -->
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
   <!-- 주소지는 검색시 지도에서 표시하는 기능 추가 -->
   <!-- 이미지 삽입시 미리보기 기능 추가 -->
   <div class="resContainer">
   		<div class="resContents">
   		<!-- 입력한 내용은 resAdd액션으로 전달 -->
   		<!-- <form action="resAdd.do" method="post" enctype="multipart/form-data"> -->
   		<!-- 임시로 업로드체크 페이지로 이동, 컨트롤러 적용시 제거 예정 -->
   		<form action="uploadCheck.jsp" method="post" enctype="multipart/form-data">
	   		<h3>식당 등록</h3>
	   		<hr>
	   		
	   		<div class="rName">
	   		<span>식당 이름</span><br>
	   		<input name="resName" class="resName" type="text" placeholder="식당 이름 입력" required>
	   		</div><br>
   		
	   		<div class="rCategory">
	   		<span>식당 종류</span><br>
	   		<input name="resCategory" class="resCategory" type="text" placeholder="식당 종류 입력" required>
	   		</div><br>
	   		
	   		<div class="rAdd">
	   		<span>식당 주소</span><br>
	   		<input type="text" id="resAdd" name="resAdd" class="resAdd" placeholder="주소">
			<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
	   		</div><br>
	   		
	   		<div class="rPhone">
	   		<span>식당 전화번호</span><br>
	   		<input name="resPhone1" class="resPhone" type="text" maxlength="3" oninput="this.value = this.value.replaceAll(/\D/g, '')" required>
	   		<span class="fontPhone">-</span>
	   		<input name="resPhone2" class="resPhone" type="text" maxlength="4" oninput="this.value = this.value.replaceAll(/\D/g, '')" required>
	   		<span class="fontPhone">-</span>
	   		<input name="resPhone3" class="resPhone" type="text" maxlength="4" oninput="this.value = this.value.replaceAll(/\D/g, '')" required>
	   		</div><br>
	   		
	   		<div class="rPic">
	   		<span>식당 사진</span><br>
	   		<input type="file" name="uploadfile" onchange="preview(this);" accept="image/*" >
			</div>
	   		
	   		<br>
	   		<input type="submit" value="식당 등록" style="float: right;">
   		</form>
	   	
			
	   		<br>
	   		<hr>
			
   		<br><br>
   		</div>
   		<!-- 이미지 미리보기 영역 -->
   		<!-- 우측에 별도로 표시하기 위해 DIV를 분할 -->
   		<div class="imgPreview">
   			<img id="preview" width="400px" height="300px"/>
   			이미지 미리보기
   		</div>
   </div>
   
   <!-- 식당등록 end -->
   
   
   
   <!-- 주소 API -->
   <!-- 이 부분은 건드리지 말 것 -->
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e60dadda7b68bff55723b386ed35f41c&libraries=services"></script>
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
	                document.getElementById("resAdd").value = addr;
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>식당등록 | 오늘의메뉴</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon-customer.ico">
<!-- Place favicon.ico in the root directory -->

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

<!-- 내부 CSS 적용 -->
<!-- 이후 취합할 때 CSS파일을 별도로 분리할 예정 -->
<style type="text/css">
*{
   font-family: 'Gothic A1', sans-serif;
}
.resContainer{
   display: flex;
   justify-content: center;
}
.resContents{
   width: 450px;
   margin-top: 10px;
}
.imgPreview{
   margin-top: 92px;
   padding: 10px;
   width: 420px;
   height: 320px;
   border: 1px solid #ced4da;
   text-align: center;
}
.contact-title {
    font-size: 27px;
    font-weight: 600;
    margin-bottom: 50px;
}
h4{
	margin-bottom: 8px;
	padding-left: 12px;
}

.rName, .rCategory, .rAdd, .rPhone, r.Pic{
	margin-bottom: 20px;
}

/*식당이름,카테고리,식당주소,식당번호 입력창*/
.resName,.resCategory,.resAdd,.resPhone{
   border-radius: 0px;
   border: 1px solid #ced4da;
   height: 40px;
   padding: 6px 18px 6px 18px;
}

.resName,.resCategory,.resAdd{
   border-radius: 0px;
   border: 1px solid #ced4da;
   height: 40px;
   width:408px;
}

/*식당번호 입력창*/
.resPhone{
   width: 121px;
   border: 1px solid #ced4da;
}
.fontPhone{
   font-size: 1.5em;
}
.resContainer {
    display: flex;
    justify-content: center;
    padding-top: 100px;
    padding-bottom: 100px;
}
.addr-btn {
	margin-top:5px;
}

/*확인,취소 버튼*/
.buttons {
	margin-top: 50px;
	display: flex;
}

/*확인버튼*/
.start-button {
	margin-right: 20px;
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
   <div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
      <div class="breadcam_inner">
         <div class="breadcam_text">
            <h3>식당등록</h3>
            <p>아래의 절차에 따라 식당을 등록할 수 있습니다.</p>
         </div>
      </div>
   </div>
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
            <h2 class="contact-title">식당 등록</h2>
           
            
            <div class="rName">
            <h4>식당 이름</h4>
            <input name="resName" class="resName" type="text" placeholder="식당 이름 입력" required>
            </div>
         
            <div class="rCategory">
            <h4>식당 종류</h4>
            <input name="resCategory" class="resCategory" type="text" placeholder="식당 종류 입력" required>
            </div>
            
            <div class="rAdd">
            <h4>식당 주소</h4>
            <input type="text" id="resAdd" name="resAdd" class="resAdd" placeholder="주소">
         <input type="button" class=addr-btn onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
         <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
            </div>
            
            <div class="rPhone">
            <h4>식당 전화번호</h4>
            <input name="resPhone1" class="resPhone" type="text" maxlength="3" oninput="this.value = this.value.replaceAll(/\D/g, '')" required>
            <span class="fontPhone">-</span>
            <input name="resPhone2" class="resPhone" type="text" maxlength="4" oninput="this.value = this.value.replaceAll(/\D/g, '')" required>
            <span class="fontPhone">-</span>
            <input name="resPhone3" class="resPhone" type="text" maxlength="4" oninput="this.value = this.value.replaceAll(/\D/g, '')" required>
            </div>
            
            <div class="rPic">
            <h4>식당 프로필</h4>
            <input type="file" name="uploadfile" onchange="preview(this);" accept="image/*" >
         </div>
             
            <!-- 버튼
            <br>
            <input type="submit" value="식당 등록" style="float: right;">
            -->
						<!-- 확인/취소 버튼 start-->
						<div class="buttons">

							<!-- 확인 버튼 start -->
							<div class="form-group mt-3 start-button">
								<button type="submit"
									class="button button-contactForm boxed-btn">등록</button>
							</div>
							<!-- 확인 버튼 end -->

							<!-- 취소 버튼 start -->
							<div class="form-group mt-3">
								<!-- 추후 a href="ㅁㅁㅁ.do"로 수정 -->
								<a href="#"><button type="button"
										class="button button-contactForm boxed-btn">취소</button></a>
							</div>
							<!-- 취소 버튼 end -->

						</div>
						<!-- 확인/취소 버튼 end-->
            
         </form>
         
         

         
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>메뉴등록 | 오늘의메뉴</title>
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
.menuContainer{
   display: flex;
   justify-content: center;
   padding-top: 100px; 
   padding-bottom: 100px;
}
.menuContents{
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
.menuName,.menuCategory,.menuPrice{
   border-radius: 5px;
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
            <h3>비밀번호 찾기</h3>
            <p>아래 절차에 따라 비밀번호를 찾을 수 있습니다.</p>
         </div>
      </div>
   </div>
   <!-- breadcam_area_end -->

   <!-- 메뉴등록 start -->
   <div class="menuContainer">
         <div class="menuContents">
         
         아이디 : ${memId}
         비밀번호 : ${memPw}
         
            <br>
            <hr>
         
         <br><br>
         </div>

   </div>
   
   <!-- 메뉴등록 end -->



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
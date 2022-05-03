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
<style>
.outer {
   text-align: center;
}

.inner {
   display: inline-block;
}

.container box_1170 {
   display: flex;
   justify-content: center;
}
</style>
<script type="text/javascript">
   $.ajax({
      type : "GET", // 데이터를 로드해오는 방식
      url : "faq.json", // 로드할 파일이름
      dataType : "json", // 현재 다루는 데이터 타입
      success : function(data) { // 로드 성공시 수행할 메서드
         // function()에 인자를 두면, 로드성공한 json데이터가 저장됨!
         var ele = "";

         // $.each( 타깃 데이터(로드한 json 데이터) , 수행할 메서드 );
         $.each(data, function() {
            ele += "<li class="this.class1">";
            ele += "<h5 class="this.class2">" + this.title + "</h5>";
            ele += "<div class="this.class3">" + this.content + "</td>";
            ele += "</li>";
         });

         $("#json").append(ele);
      },
      error : function(err) { // 로드 실패시 수행할 메서드
         // function()에 인자를 두면, 로드실패시 예외정보가 저장됨!
         // 에러의 상태,내용에 대한 메세지 등을 출력
         console.log('에러발생!');
         console.log(err.status + " | " + err.errText);
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

.container box_1170{
   display: flex;
   justify-content: center;
}
</style>


<body>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>

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
            <p>FAQ/빠르게 문의하기를 확인 및 이용가능합니다.</p>
         </div>
      </div>
   </div>
   <!-- breadcam_area_end -->



   <!-- 공지사항 시작 -->

   <div class="whole-wrap">
      <div class="container box_1170">

         <!-- 자주 묻는 질문 시작 -->

         <a id="faq"></a>
         <div class="section-top-border">
            <h2 class="mb-30">FAQ</h2>
            <hr>
            <br>
            <div class="row">
               <div class="col-md-9">

                  <ul class="accodian">
                     <li class="accodian--box">
                        <!-- 질문 제목 -->
                        <h5 class="question">[리뷰] 리뷰 수정 또는 작성 어떻게 하나요?</h5> <!-- 질문 답변 -->
                        <div class="answer">
                           작성하신 리뷰를 수정 혹은 삭제하고 싶으신 경우, <br> <br> 내정보 페이지에서 수정/삭제
                           하실 리뷰를 선택하신 후 우측 하단에 삭제 및 수정 아이콘을 누르시면 변경 가능합니다. <br> <br>
                           앞으로도 지속적인 서비스 이용과 관심 부탁드립니다.<br> <br> 감사합니다.
                        </div>
                     </li>
                     <br>


                     <li class="accodian--box">
                        <!-- 질문 제목 -->
                        <h5 class="question">[탈퇴] 탈퇴는 어떻게 하나요?</h5> <!-- 질문 답변 -->
                        <div class="answer">
                           마이페이지 > 회원탈퇴를 통해 오늘의 맛집 회원 탈퇴가 가능합니다.<br> 탈퇴 후에는 계정 복구가
                           불가능하오니 신중히 선택해주시기 바랍니다.
                        </div>
                     </li>
                     <br>


                     <li class="accodian--box">
                        <!-- 질문 제목 -->
                        <h5 class="question">[리뷰] 리뷰 또는 사진 신고가 필요한 경우</h5> <!-- 질문 답변 -->
                        <div class="answer">
                           모든 사용자는 오늘의 맛집 커뮤니티 가이드 라인에 위배 되는 리뷰나 사진을 신고할 수 있습니다. <br>
                           이 가이드라인 방침에 따라 다음과 같은 경우 콘텐츠가 삭제될 수 있습니다. <br> <br>
                           1. 리뷰 또는 사진이 다른 레스토랑인 경우 <br> <br> 2. 리뷰 또는 사진이 스팸인
                           경우 <br> <br> 3. 리뷰 또는 사진에 개인정보, 명예훼손 또는 사생활 침해 또는 홍보권
                           침해가 포함되는 경우 <br> <br>4. 리뷰 또는 사진이 실제 식사 경험을 기반으로 하지
                           않았을 경우 <br> <br> 5. 리뷰 또는 사진이 지불댓가로 업로드 된 경우 <br>
                           <br> 오늘의 메뉴는 신고 접수가 된 후 내부적으로 신고 대상 리뷰를 검토하고 커뮤니티 가이드라인을
                           준수하지 않은 경우 신고된 콘텐츠를 제거합니다.
                        </div>
                     </li>
                     <br>

                     <li class="accodian--box">
                        <!-- 질문 제목 -->
                        <h5 class="question">[리뷰] 오늘의 맛집 평점 기준은 어떻게 되나요?</h5> <!-- 질문 답변 -->
                        <div class="answer">
                           오늘의 맛집 레스토랑의 평점은 사용자의 리뷰를 기반으로 레스토랑의 품질과 인기를 측정한 통계지수입니다.<br>
                           <br> 이 지수는 기록된 리뷰뿐만 아니라 과거에 리뷰 작성자가 얼마나 활발하게 리뷰를 작성했는지,<br>
                           <br>특정 점수에 편향되어 있는지를 포함한 리뷰 히스토리를 고려합니다 따라서 이 점수는 작성된 리뷰의
                           단순한 평균값이 아닙니다.
                        </div>
                     </li>
                  </ul>
                  <!-- 자주 묻는 list 끝 -->


               </div>
            </div>
         </div>
         <hr>
         <br> <br> <br>
         <!-- 자주 묻는 질문 끝 -->
      </div>
   </div>




   <div>
      <a id="ask"></a>
   </div>



   <!-- 빠르게 문의하기 시작 -->

   <div class="whole-wrap">
      <div class="container box_1170">
         <h2 class="mb-30">빠르게 문의하기</h2>
         <hr>

         <div class="col-lg-8">
            <form class="" action="CustomerService.do" method="post" id="">

               <div class="row">
                  <div class="col-md-9">
                     <!-- 문의 사항 작성 -->
                     <div class="col-12">
                        <div class="form-group">
                           <textarea class="form-control w-100" name="message"
                              id="message" cols="30" rows="9"
                              onfocus="this.placeholder = ''"
                              onblur="this.placeholder = 'Enter Message'"
                              placeholder=" 문의 내용을 입력해주세요 "></textarea>
                        </div>
                     </div>

                     <!-- 이름 작성 -->
                     <div class="col-sm-6">
                        <div class="form-group">
                           <input class="form-control valid" name="name" id="name"
                              type="text" onfocus="this.placeholder = ''"
                              onblur="this.placeholder = '이름을 입력해주세요'"
                              placeholder="이름을 입력해주세요">
                        </div>
                     </div>

                     <!-- 이메일 작성 -->
                     <div class="col-sm-6">
                        <div class="form-group">
                           <input class="form-control valid" name="email" id="email"
                              type="email" onfocus="this.placeholder = ''"
                              onblur="this.placeholder = '이메일을 입력해주세요'"
                              placeholder="이메일을 입력해주세요">
                        </div>
                     </div>
                     <!-- 문의 사항 전송 -->
                     <div align="right" class="form-group mt-3">
                        <button type="submit" class="boxed-btn" id="send-btn">제출</button>
                     </div>
                  </div>
               </div>



            </form>





         </div>
      </div>
   </div>
   </div>

   <!-- 빠르게 문의하기 끝 -->

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




   <!—contact js—>
   <script src="js/contact.js"></script>
   <script src="js/jquery.ajaxchimp.min.js"></script>
   <script src="js/jquery.form.js"></script>
   <script src="js/jquery.validate.min.js"></script>
   <script src="js/mail-script.js"></script>

   <script src="js/main.js"></script>



</body>
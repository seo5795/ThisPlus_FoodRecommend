<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.footer_area .footer_widget ul li a:hover {
   font-weight: bolder;
   color: black;
}

.prohibited {
   cursor: not-allowed;
}
</style>

</head>
<body>
   <footer class="footer_area footer-bg zigzag_bg_1">
      <div class="footer-top">
         <div class="container">
            <div class="row">
               <div class="col-xl-2 col-md-6 col-lg-2">

                  <!-- 회사 -->
                  <div class="footer_widget">
                     <h3 class="heading"></h3>
                     <ul>
                        <li><a href="Notice.jsp#company" class="available">회사
                              소개</a></li>
                        <li><a class="prohibited" onclick="msg();">채용 정보</a></li>
                        <li><a class="prohibited" onclick="msg();">투자 정보</a></li>
                     </ul>
                  </div>
               </div>

               <!-- 광고 -->
               <div class="col-xl-2 col-md-6 col-lg-2">
                  <div class="footer_widget">
                     <h3 class="heading"></h3>
                     <ul>
                        <li><a class="prohibited" onclick="msg();">광고 문의</a></li>
                        <li><a class="prohibited" onclick="msg();">제휴 문의</a></li>
                     </ul>
                  </div>
               </div>

               <!-- 약관 -->
               <div class="col-xl-2 col-md-6 col-lg-2">
                  <div class="footer_widget">
                     <h3 class="heading"></h3>
                     <ul>
                        <li><a class="prohibited" onclick="msg();">이용약관</a></li>
                        <li><a class="prohibited" onclick="msg();">개인정보처리방침</a></li>
                        <li><a class="prohibited" onclick="msg();">위치기반서비스<br>이용약관
                        </a></li>
                        <li><a class="prohibited" onclick="msg();">청소년 보호 정책</a></li>
                     </ul>
                  </div>
               </div>


               <!-- 뉴스 레터 -->
               <div class="col-xl-4 col-md-12 col-lg-4">
                  <div class="footer_widget">
                     <h3 class="heading"></h3>
                     <p class="offer_text">[구독] 이메일을 통해 알림을 받아보세요!</p>

                     <!--   뉴스 레터 이메일 입력 -->
                     <form action="Newsletter.do" method="post">
                        <input name="useremail" type="text"
                           placeholder="이메일을 입력해주세요">
                        <button type="submit">
                           <i class="ti-arrow-right"></i>
                        </button>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="footer-bottom">
         <div class="container">
            <div class="row align-items-center">
               <div class="col-xl-7 col-md-12 col-lg-8">
                  <div class="copyright">
                     <p class="footer-text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                           document.write(new Date().getFullYear());
                        </script>
                        All rights reserved | This template is made with <i
                           class="fa fa-heart-o" aria-hidden="true"></i> by <a
                           href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     </p>
                  </div>
               </div>
               <div class="col-xl-5 col-md-12 col-lg-4">
                  <div class="social_links">
                     <ul>
                        <li><a href="#"> <i class="fa fa-facebook"></i>
                        </a></li>
                        <li><a href="#"> <i class="fa fa-twitter"></i>
                        </a></li>
                        <li><a href="#"> <i class="fa fa-dribbble"></i>
                        </a></li>
                        <li><a href="#"> <i class="fa fa-behance"></i>
                        </a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>

   <script type="text/javascript">
      function msg() {
         alert('추후 업데이트 예정!');
      }
   </script>

</body>
</html>
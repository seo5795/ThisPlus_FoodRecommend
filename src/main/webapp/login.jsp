<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 | 오늘의메뉴</title>

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon-customer.ico">
<!-- Place favicon.ico in the root directory -->

<!-- Google Web Fonts by JHS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style.css">

<!-- 소셜 버튼 -->
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   
<style>
*{
   font-family: 'Gothic A1', sans-serif;
}
.btn-social-login {
   transition: all .2s;
   outline: 0;
   border: 1px solid transparent;
   padding: .5rem !important;
   border-radius: 50%;
   color: #fff;
}

.input-group {
    top: 180px;
    position: absolute;
    width: 280px;
    transition: .5s;
    margin-top: 45px;
}

.btn-social-login:focus {
   box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25);
}

.text-dark {
   color: #343a40 !important;
}

.name {
   text-align: center;
}
.submit{
   margin-top: 20px;
   margin-bottom: 20px;
   background: #78b455;
   font-size: 14px;
}

.btn2{
	margin-left: 40px;
}

.register, .findPw{
   text-decoration: none;
   font-size: 14px;
}
.register:hover{
   text-decoration:underline;
}
.findPw:hover{
   text-decoration:underline;
}

</style>
</head>
<body>
   <script async defer crossorigin="anonymous"
      src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v13.0&appId=4872709812825483&autoLogAppEvents=1"
      nonce="FEkAkaD8"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

   <div class="wrap">

      <div class="form-wrap">
         <div class="image">
            <a href="index.jsp"><img src="img/logo.png" alt="logo" style="width: 45px;"></a>
         </div>

         <br>
         <div class="name">
            <h1>오늘의메뉴 로그인</h1>
         </div>
<br>
         <div class="social-icons">
       <form method="post" name="loginForm" action="snslogin.do">         
               <input type="hidden" name="memRank" id="memRank" value="0"/>
               <input type="hidden" name="memId" id="memId" />
               <input type="hidden" name="memEmail" id="memEmail" />
               <input type="hidden" name="memName" id="memName" />
               <input type="hidden" name="memPic" id="memPic" />
               <input type="hidden" name="memPhone" id="memPhone"/> 
            <a href="javascript:void(0)" onclick="fnFbCustomLogin();">
                  <i class="xi-2x xi-facebook btn-social-login" style='background: #4267B2'></i>
            </a> 
            <a id="naverIdLogin_loginButton" href="javascript:void(0)">
                  <i class="xi-2x xi-naver  btn-social-login" style='background: #1FC700'></i>
            </a> 
            <a href="javascript:void(0)" onclick="kakaoLogin();">      
                  <i class="xi-2x xi-kakaotalk text-dark btn-social-login" style='background: #FFEB00'></i>         
            </a>
         </form> 
         </div>
      <br><br>
         <form id="login" action="login.do" class="input-group">
            <input type="text" class="input-field" name="memId"
               placeholder="사용자 ID" required> <input
               type="password" class="input-field" name="memPw" placeholder="비밀번호"
               required>
            <!-- <div>
               <input type="checkbox" class="checkbox">Remember Password
            </div> -->
            <br><br>
            
            <div style="text-align: center">
               <button class="submit">로그인</button>
            </div>
            <div class="btn2">
               <a href="findPw.jsp" class="findPw">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
               <a href="register.jsp" class="register">회원가입</a>
            </div>
         </form>
      </div>
      </div>
      <!-- 페이스북 스크립트 -->
      <script async defer crossorigin="anonymous"
         src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=1588150011384568"
         nonce="SiOBIhLG"></script>
      <!-- 카카오 스크립트 -->
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
      <!-- 네이버 스크립트 -->
      <script
         src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
         charset="utf-8"></script>
      
      <script>
      //============카카오 로그인=================
         Kakao.init('67246f110a18e1d72d72ac6d2ca2f74e'); //발급받은 키 중 javascript키를 사용해준다.
         console.log(Kakao.isInitialized()); // sdk초기화여부판단
         
         function kakaoLogin() {
            Kakao.Auth.login({
               //scope:'account_email,birthday'-->받아오고자 하는 값
               success : function(res) {
                  Kakao.API.request({
                     url : '/v2/user/me',
                     success : function(res) {
                        alert('로그인 성공!')
                        console.log(res)
                        var id = res.id;
                        var email = res.kakao_account.email;
                        var name = res.properties.nickname;
                        var profile = res.properties.profile_image;
   
                        
                        console.log(email);
                        console.log(name);
                        console.log(profile);
                        console.log(id);

                        
                        //db에 넣을 값 세팅
                        $('#memId').val(id);
                        $('#memEmail').val(email);
                        $('#memName').val(name);
                        $('#memPic').val(profile); 

                        document.loginForm.submit();
                     },
                     fail : function(error) {
                        alert('로그인 실패1:' + error)
                        console.log(error)
                     },
                  })
               },
               fail : function(error) {
                  alert('로그인 실패2: ' + error)
                  console.log(error)
               },
            })
         }
         //카카오로그아웃  
         function kakaoLogout() {
            if (Kakao.Auth.getAccessToken()) {
               Kakao.API.request({
                  url : '/v1/user/unlink',
                  success : function(response) {
                     console.log(response)
                  },
                  fail : function(error) {
                     console.log(error)
                  },
               })
               Kakao.Auth.setAccessToken(undefined)
            }
         }

         //-----------네이버 로그인--------
         var naverLogin = new naver.LoginWithNaverId(
               {
                  clientId : "uWtf3aKRwUyyzIsivDzN", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
                  callbackUrl : "http://localhost:8010/pr4_foodRecommend/login.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
                  isPopup : false,
                  callbackHandle : true
               });

         naverLogin.init();

         var login = document.querySelector("#naverIdLogin_loginButton");
         login.addEventListener('click', function() {
         //window.addEventListener('load', function() {
            naverLogin.getLoginStatus(function(status) {
               if (status) {
                  console.log('로그인성공');
                  var id = naverLogin.user.getId();
                  var name = naverLogin.user.getName();
                  var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
                  var phone = naverLogin.user.getMobile();
                  var profile = naverLogin.user.getProfileImage();

                  console.log(naverLogin.user);
                  console.log(id);
                  console.log(name);
                  console.log(profile);

                  if (email == undefined || email == null) {
                     alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                     naverLogin.reprompt();
                     return;
                  }

                  $('#memId').val(id);
                  $('#memEmail').val(email);
                  $('#memName').val(name);
                  $('#memPic').val(profile);
                  $('#memPhone').val(콜);
                  document.loginForm.submit(); 
               
               } else {
                  console.log("callback 처리에 실패하였습니다.");
               }
            });
         });

         var testPopUp;
         function openPopUp() {
            testPopUp = window
                  .open("https://nid.naver.com/nidlogin.logout",
                        "_blank",
                        "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
         }
         function closePopUp() {
            testPopUp.close();
         }

         function naverLogout() {
            openPopUp();
            setTimeout(function() {
               closePopUp();
            }, 1000);

         }

         //========페이스북 로그인=======
         //기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
         function statusChangeCallback(res) {
            statusChangeCallback(response);
         }

         function fnFbCustomLogin() {
            FB.login(function(response) {
               if (response.status === 'connected') {
                  FB.api('/me', 'get', {
                     fields : 'name,email'
                  }, function(r) {
                     console.log(r);
                     var id = r.id;
                     var name = r.name;
                     var email = r.email;

                     console.log(id);
                     console.log(name);
                     console.log(email);

                      $('#memId').val(id);
                     $('#memEmail').val(email);
                     $('#memName').val(name);
                     document.loginForm.submit(); 

                  })
               } else if (response.status === 'not_authorized') {
                  // 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
                  alert('앱에 로그인해야 이용가능한 기능입니다.');
               } else {
                  // 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
                  alert('페이스북에 로그인해야 이용가능한 기능입니다.');
               }
            }, {
               scope : 'public_profile,email'
            });
         }

         window.fbAsyncInit = function() {
            FB.init({
               appId : '4872709812825483', // 내 앱 ID를 입력한다.
               cookie : true,
               xfbml : true,
               version : 'v10.0'
            });
            FB.AppEvents.logPageView();
         };
      </script>
      <!--반드시 중간에 본인의 앱아이디를 입력하셔야 합니다.-->
      <script async defer crossorigin="anonymous"
         src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=4872709812825483"
         nonce="SiOBIhLG"></script>
</body>
</html>
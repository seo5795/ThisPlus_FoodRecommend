
//회원탈퇴 입력 값 유효성 검사, 
//필요없는 메서드 삭제 & 인덱스 수정

      var regPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/;//숫자, 특수문자, 영문 1개이상 사용하여 8자리 이상

      var input = document.querySelectorAll('.check');
      console.log(input);
      
      
      function pw1Ch() {//패스워드 유효성
         var err = document.querySelector('#pw1Error');
         if (regPw.test(input[0].value)) {
            err.innerText = "";
         } else {
            err.innerText = "8자이상 (숫자, 특수문자, 영문 1개이상)";
         }
      };
            
      function pw2Ch() {//패스워드 확인 유효성
         var err = document.querySelector('#pw2Error');
         if (input[0].value == input[1].value) {
            err.innerText = "";
         } else {
            err.innerText = "비밀번호가 일치하지 않습니다.";
         }
      };

      
      input[0].addEventListener('keyup', pw1Ch);
      input[1].addEventListener('keyup', pw2Ch);

      
      window.onload = function() {
      document.join.onsubmit=function(){// 회원가입을 누른다면
         var errorStr = [" 비밀번호를", " 비밀번호 확인을"];
      
         var error=document.querySelectorAll('.error_next_box');
         var checkbox = document.querySelector('#primary-checkbox');
      
         console.log(input);
         for (var i = 0; i < input.length-1; i++) { // -1 == submit제외 
            if (!input[i].value) { 
         
              error[i].innerHTML = errorStr[i]+ " 입력해 주세요.";
               input[i].focus(); // 포커스 이동
               return false; // 종료 (포커스 이동유지를 위해 false 종료)
            }
           

            error[i].innerHTML = "";
         }
         
         if (!regPw.test(input[0].value)) {
            var err = document.querySelector('#pw1Error');
            err.innerText = "8자이상 (숫자, 특수문자, 영문 1개이상)";
            input[0].focus();
            return false;
            }
   
         if (input[0].value !== input[1].value) {
         var err = document.querySelector('#pw2Error');
            err.innerText = "비밀번호가 일치하지 않습니다.";
            input[1].focus();
            return false;
         }

         
         
         if(!checkbox.checked){
            alert("회원탈퇴 동의를 체크하셔야 탈퇴가 진행됩니다.");
            return false;
         }
         
             alert("회원탈퇴가 완료되었습니다.");
         }
      }
      
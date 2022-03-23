<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:choose>
   <c:when test="${member!=null}">
      <li><a href="#">마이페이지<i class="ti-angle-down"></i></a>
         <ul class="submenu">
            <li><a href="memmypage.do">내 정보 수정</a></li>
             <c:choose>           
            	<c:when test="${memberPw != null}">
            	<!-- sns로그인이 아닐때 -->
            	 <li><a href="mypage_deleteAccount.jsp">회원 탈퇴</a></li>
            	</c:when>
            </c:choose> 
           
            <c:choose>
            	<c:when test="${memberRank eq 1}">
            	<!-- 식당주인이라면 -->
            	 <li><a href="resInsert.jsp">식당등록</a></li>
            	</c:when>
            </c:choose>       
         </ul></li>
   </c:when>
</c:choose>
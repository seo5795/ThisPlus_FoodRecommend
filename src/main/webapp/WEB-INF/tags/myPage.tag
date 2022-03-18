<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:choose>
	<c:when test="${member!=null}">
		<li><a href="#">마이페이지<i class="ti-angle-down"></i></a>
			<ul class="submenu">
				<li><a href="mypage.jsp">내 정보 수정</a></li>
				<li><a href="mypage_deleteAccount.jsp">회원 탈퇴</a></li>
			</ul></li>
	</c:when>
</c:choose>

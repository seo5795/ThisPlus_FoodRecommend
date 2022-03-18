<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<c:choose>
	<c:when test="${member!=null}">
		<!-- ${member!=null}: session에서 설정한 사용자 mname -->
 
  <a href="logout.do" class="boxed_btn_white">logout</a>
	</c:when>
	<c:otherwise>
		<a href="login.jsp" class="boxed_btn_white">로그인</a>
	</c:otherwise>
	
</c:choose>

<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="type" %>

<c:if test="${member!=null}">
<c:choose>
<c:when test="${type=='board'}"><input type="text" name="revContent"></c:when>
<c:when test="${type=='reply'}"><input type="text" name="msg"></c:when>
</c:choose>
</c:if>

<c:if test="${member==null}">
<c:choose>
<c:when test="${type=='board'}"><input type="text" name="revContent" value="로그인후에 이용가능" disabled></c:when>
<c:when test="${type=='reply'}"><input type="text" name="msg" value="로그인후에 이용가능" disabled></c:when>
</c:choose>
</c:if>
<!-- 관리자일때 보이는 것 미완성 delete부분 -->
<c:if test="${member==admin}">
<c:choose>
<c:when test="${type=='adminupdate'}"><a href="AdminRestaurantDetail.jsp" class="update"/></c:when>
<c:when test="${type=='admindelete'}"><button>식당 삭제</button></c:when>
</c:choose>
</c:if>

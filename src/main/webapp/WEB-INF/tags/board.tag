<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="type" %>

<c:if test="${member!=null}">
<c:choose>
<c:when test="${type=='board'}"><input type="text" name="content"></c:when>
<c:when test="${type=='reply'}"><input type="text" name="msg"></c:when>
</c:choose>
</c:if>

<c:if test="${member==null}">
<c:choose>
<c:when test="${type=='board'}"><input type="text" name="content" value="로그인후에 이용가능" disabled></c:when>
<c:when test="${type=='reply'}"><input type="text" name="msg" value="로그인후에 이용가능" disabled></c:when>
</c:choose>
</c:if>

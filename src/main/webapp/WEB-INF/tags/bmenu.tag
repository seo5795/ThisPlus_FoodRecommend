<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="bid" %>
<%@ attribute name="mid" %>

[ <a href="fav.do?bid=${bid}&a=${a}&b=${b}">♥</a> ]
<c:if test="${member==mid}">
[ <a href="deleteBoard.do?bid=${bid}&b=${b}">삭제</a> ]
</c:if>

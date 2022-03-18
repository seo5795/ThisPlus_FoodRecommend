<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>고객센터로 문의해주세요!</h2>
<hr>
발생한 예외: ${pageContext.errorData.throwable} <br>
${pageContext.errorData.requestURI} | ${pageContext.errorData.statusCode}

</body>
</html>
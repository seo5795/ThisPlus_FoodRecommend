<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자: 공지사항</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon-admin.ico">

<!-- Google Web Fonts by JHS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">



<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<style>
.layer1 {
	margin: 0;
	padding: 0;
	width: 500px;
}

.noticeheading {
	margin: 1px;
	padding: 3px 10px;
	cursor: pointeEr;
	position: relative;
}

.noticecontent {
	padding: 5px 10px;
	background-color: #E9E9E9;
}

.invest_wrapper {
	margin: 0 auto;
	padding: 0 auto;
}

.date {
	color: #CBCBCB;
	font: 11.2px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO",
		"sans-serif";
}

.title {
	color: #4F4F4F;
	font: 15.2px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO",
		"sans-serif";
	padding: 15px 40px 15px 15px;
	width: 900px;
	height: 70.38px;
}

.notice {
	color: #FF792A;
	font: 28.8px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO",
		"sans-serif";
	margin: 0px 0px 30px;
	width: 900px;
	height: 32px;
}

.text {
	width: 900px;
	Background: #E9E9E9;
	padding: 20px 15px;
	color: #4F4F4F;
}

.center {
	display: flex;
}

hr {
	width: 90%;
}

body {
	margin: 0px;
}

div {
	display: block;
}

p {
	color: #4F4F4F;
	font: 12.8px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO",
		"sans-serif";
	width: 870px;
}

ul {
	list-style: none;
}

	*{
		font-family: 'Gothic A1', sans-serif;
	}

</style>
</head>
<body>
	<div class="center" style="margin: 0 auto;">
		<div class="invest_wrapper">

			<h1 class="invest_subject notice">공지사항</h1>

			<ul class="invest_table">
				<c:forEach var="notice" items="${notdatas}">
					<li>
						<div class="title heading">
							${notice.notTitle } 
							
							<br>
							<p class="icon" style="float: right; width: 0px;">▶</p>
							<span class="date">${notice.notRegDate}</span>
							
						</div>
						<div class="text content">
							<p>${notice.notContent }</p>
						</div>
						<hr>
					</li>
				</c:forEach>

			</ul>
		</div>
	</div>
	<script>
		
			$(document).ready(function() {
				$(".content").hide();
				$(".heading").click(function() {
					$(this).next(".content").slideToggle(500);
				});
			});
		 
	</script>

</body>
</html>
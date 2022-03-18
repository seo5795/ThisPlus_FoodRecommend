<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">
<title>공지사항</title>
<!-- 자바스크립트 연결 -->
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

.date{
	color:#CBCBCB;
	font: 11.2px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO", "sans-serif";
}
.title{
	color:#4F4F4F;
	font: 15.2px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO", "sans-serif";
	padding: 15px 40px 15px 15px;
	width: 900px;
	height: 70.38px;
}
.notice{
	color: #FF792A;
	font: 28.8px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO", "sans-serif";
	margin: 0px 0px 30px;
	width: 900px;
	height: 32px;
}
.text{
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
	color:#4F4F4F;
	font: 12.8px SpoqaHanSans, "Noto Sans SC", "APPLE SD Gothic NEO", "sans-serif";
	width: 870px;
}
ul{
   list-style:none;
}

</style>
</head>
<body>
	<div class="center" style="margin: 0 auto;">
		<div class="invest_wrapper">
			
			<h1 class="invest_subject notice">공지사항</h1>
			<!-- 제목 쓰는곳 -->
			<ul class="invest_table">
				<li>
					<div class="title heading">
						[공지] 제목제목 <br> <p class="icon" style="float: right; width:0px;">▶</p> <span class="date">2022-03-xx 날짜날짜</span>
						
						<!-- 아코디언 플러그인 아이콘 넣을 수 있음 -->
					</div>
					<div class="text content">
						<p>여기는 공지사항 내용이 들어가야됨</p>
						<!-- p태그 안에 내용이 들어감 -->
					</div>
					<hr>
					
					<!-- JSTL 이용해서 반복문 식으로 만들면 될거같음 -->
					 
					<section id="main">
						<h2>게시글 목록</h2>
						<c:forEach var="bsList" items="${datas}">
							<c:set var="vo" value="${bsList.boardVO}" />
							<div class="board">
								<h3>[${vo.bid}] ${vo.mid} >> ${vo.content} [댓글수 ${vo.rpcnt}
									| 좋아요 ${vo.favcnt}] [${vo.bdate}]</h3>
							</div>
							<div class="reply">
								<form action="controller.jsp?action=newReply" method="post">
									<input type="text" name="msg"> <input type="submit"
										value="댓글 작성하기">
								</form>
							</div>
							<div class="replylist">
								<c:forEach var="r" items="${bsList.replyList}">
									<h4>${r.mid}>> ${r.msg} [${r.rdate}]</h4>
								</c:forEach>
							</div>
						</c:forEach>
					</section>


					<div class="layer1">
						<p class="heading">제목 1</p>
						<div class="content">
							첫 번째 컨텐츠<br>첫 번째 컨텐츠
						</div>
						<p class="heading">제목 2</p>
						<div class="content">
							두 번째 컨텐츠<br>두 번째 컨텐츠
						</div>
						<p class="heading">제목 3</p>
						<div class="content">
							세 번째 컨텐츠<br>세 번째 컨텐츠
						</div>
					</div>
					<hr>

				</li>

			</ul>
		</div>
	</div>
	<!-- 아코디언 플러그인 적용 스크립트 -->
	<script>
		$(document).ready(function() {
			$(".content").hide();
			//content 클래스를 가진 div를 표시/숨김(토글)
			$(".heading").click(function() {
				$(this).next(".content").slideToggle(500);
			});
		});
	</script>

</body>
</html>
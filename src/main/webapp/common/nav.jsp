<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
media (min-width: 992px)
.d-lg-block {
	display: block !important;
}

.row {
	margin-left: 90px;
}
</style>
</head>
<body>

	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-10 col-lg-10">
						<div class="main-menu d-none d-lg-block">
							<nav>
								<ul class="mein_menu_list" id="navigation">

									<!-- 로고 -->
									<div class="logo-img d-none d-lg-block">
										<a href="index.jsp"> <img src="img/logo.png" alt="">
										</a>
									</div>




									<!-- 팀 소개 -->
									<li><a href="about.jsp">AboutUs</a></li>



									<!-- 더보기 -->

									<li><a href="#">more<i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="Notice.jsp#company">회사 소개</a></li>
											<li><a href="./admin/AdminNoticeMain.jsp">공지사항</a></li>
											<li><a href="Notice.jsp">FAQ</a></li>
											<li><a href="contact.jsp">고객센터</a></li>
										</ul></li>




									<!-- 음식 카테고리 -->
									<li><a href="#">category <i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="blog.jsp">한식</a></li>
											<li><a href="blog.jsp">양식</a></li>
											<li><a href="blog.jsp">중식</a></li>
											<li><a href="blog.jsp">일식</a></li>
											<li><a href="blog.jsp">분식</a></li>
											<li><a href="blog.jsp">카페</a></li>
										</ul></li>



									<!-- 내정보 -->
									<tag:myPage/>


									<!-- 로그인 start -->
									<div class="col-xl-2 col-lg-2 d-none d-lg-block">
										<tag:login/>
									</div>
									<!-- 로그인 end -->



								</ul>
							</nav>
						</div>
					</div>

					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
					<div class="logo-img-small d-sm-block d-md-block d-lg-none">
						<a href="index.jsp"> <img src="img/logo.png" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
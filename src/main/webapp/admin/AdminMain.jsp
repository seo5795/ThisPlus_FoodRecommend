<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>관리자 : 메인</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="img/favicon-admin.ico">

<!-- Google Web Fonts by JHS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap"
	rel="stylesheet">


<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Gothic A1', sans-serif;
}
.prohibited {
    cursor: not-allowed;
}
</style>
</head>

<body>
	<div class="container-xxl position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Sidebar Start -->
		<jsp:include page="common/adminSidebar.jsp" />
		<!-- Sidebar End -->


		<!-- Content Start -->
		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
				<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-hashtag"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i>
				</a>
				<form class="d-none d-md-flex ms-6" method="post" name="search" action="adminsearch.did">				
					<table class="pull-right">
					<tr>
						<td>
						<select class="form-control" name="searchField">
								<option value="memName">회원명</option>
								<option value="resName">식당명</option>
						</select>
						</td>
						<td><input type="text" class="form-control border-0" placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-outline-primary m-2">검색</button></td>
					</tr>

				</table>

					
				</form>
				<div class="navbar-nav align-items-center ms-auto">


					<div class="nav-item dropdown">
						<a class="prohibited" onclick="msg();"
							data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">Notifications</span>
						</a>
					</div>

				</div>
			</nav>
			<!-- Navbar End -->

			<script type="text/javascript">
      function msg() {
         alert('추후 업데이트 예정!');
      }
   </script>



			<!-- Widgets Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6 col-xl-4">
						<div class="h-100 bg-light rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-2">
								<h6 class="mb-0">회원정보</h6>
								<a href="adminmember.did">Show All</a>
							</div>

							<!--  회원정보 출력 -->
							<c:forEach var="mem" items="${memdatas}" begin="0" end="5"
								varStatus="st">
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0" src="../${mem.memPic}"
										alt="" style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">${mem.memName}</h6>
											<c:choose>
												<c:when test="${mem.memRank == 0}">

													<small>일반회원</small>


												</c:when>
												<c:when test="${mem.memRank == 1}">

													<small>식당점주</small>

												</c:when>

												<c:otherwise>

													<small>관리자</small>

												</c:otherwise>
											</c:choose>




										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<div class="col-sm-12 col-md-6 col-xl-4">
						<div class="h-100 bg-light rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">식당정보</h6>
								<a href="adminrestaurant.did">Show All</a>
							</div>

							<!--  식당정보 출력 -->
							<c:forEach var="res" items="${resdatas}" begin="0" end="5"
								varStatus="st">
								<div class="d-flex align-items-center border-bottom py-2">
									<div class="w-100 ms-3">
										<div
											class="d-flex w-100 align-items-center justify-content-between">
											<span>${res.resName}</span><small>${res.resCategory}</small>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="col-sm-12 col-md-6 col-xl-4">
						<div class="h-100 bg-light rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">공지사항</h6>
								<a href="adminnotice.did" target="_blank">Show All</a>
							</div>
							
							<c:forEach var="no" items="${notdatas}" begin="0" end="5"
								varStatus="st">
								<div class="d-flex align-items-center border-bottom py-2">
									<div class="w-100 ms-3">
										<div
											class="d-flex w-100 align-items-center justify-content-between">
											<span>${no.notTitle}</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<!-- Widgets End -->


			<!-- Footer Start -->
			<jsp:include page="common/adminFooter.jsp" />
			<!-- Footer End -->
		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>
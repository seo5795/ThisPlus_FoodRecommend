<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DASHMIN - Bootstrap Admin Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon-admin.ico">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
            <form class="d-none d-md-flex ms-8" method="post" action="adminrestaurantsearch.did" name="searchRestaurant">
               <input class="form-control border-0" type="search"
                  placeholder="식당명만 가능!" name="searchRestaurantText">
            </form>
            <div class="navbar-nav align-items-center ms-auto">
               
               <div class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle"
                     data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
                     <span class="d-none d-lg-inline-flex">Notifications</span>
                  </a>
                  <div
                     class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                     <a href="#" class="dropdown-item">
                        <h6 class="fw-normal mb-0">Profile updated</h6> <small>15
                           minutes ago</small>
                     </a>
                     <hr class="dropdown-divider">
                     <a href="#" class="dropdown-item">
                        <h6 class="fw-normal mb-0">New user added</h6> <small>15
                           minutes ago</small>
                     </a>
                     <hr class="dropdown-divider">
                     <a href="#" class="dropdown-item">
                        <h6 class="fw-normal mb-0">Password changed</h6> <small>15
                           minutes ago</small>
                     </a>
                     <hr class="dropdown-divider">
                     <a href="#" class="dropdown-item text-center">See all
                        notifications</a>
                  </div>
               </div>
               
            </div>
         </nav>
         <!-- Navbar End -->


         <!-- Table Start -->
         <div class="container-fluid pt-4 px-4">
            <div class="bg-light text-center rounded p-4">
               <div class="d-flex align-items-center justify-content-between mb-4">
                  <h3 class="text-primary">식당 리스트</h3>
               </div>
               <div class="table-responsive">
                  <table
                     class="table text-start align-middle table-bordered table-hover mb-0">
                     <thead>
                        <tr class="text-dark">
                           <th scope="col">#</th>
                           <th scope="col">식당명</th>
                           <th scope="col">평점</th>
                           <th scope="col">주소</th>
                           <th scope="col">번호</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="res" items="${res}" varStatus="status">
                           <!-- varStatus=상태용 변수 -->

                           <tr>
                              <td><c:out
                                       value="${status.count}" /></td>

                              <td><c:out value="${res.resName}" escapeXml="false">
                                    <font color="red">두찜 </font>
                                 </c:out></td>
                              <td><c:out value="${res.resAvg}" escapeXml="false">
                                    <font color="red">평점정보 없음</font>
                                 </c:out></td>
                              <td><c:out value="${res.resAdd}" escapeXml="false">
                                    <font color="red">주소정보 없음</font>
                                 </c:out></td>
                              <td><c:out value="${res.resPhone}" escapeXml="false">
                                    <font color="red">번호정보 없음</font>
                                 </c:out></td>
                              <td><a class="btn btn-sm btn-primary" href="adminrestaurantdetail.did?resId=${res.resId}">상세정보</a></td>
                           </tr>

                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
            <!-- Table End -->


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
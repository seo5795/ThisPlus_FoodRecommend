<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>관리자: 식당관리</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon-admin.ico">

<!-- Google Web Fonts by JHS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">


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
<style type="text/css">
	*{
		font-family: 'Gothic A1', sans-serif;
	}
</style>
</head>

<body>
<script type="text/javascript">
   // 삭제의사 재확인
   function resDelete(){
      ans=confirm("정말 삭제하시겠습니까? 삭제된 데이터는 복구되지 않습니다.");
      if(ans==true){
         document.resForm.action.value="adminrestaurantdelete.did?resId=${res.resId}";
         document.resForm.submit();
      }
      else{
         return;
      }
   }
</script>

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
            <form class="d-none d-md-flex ms-4">
               <input class="form-control border-0" type="search"
                  placeholder="Search">
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
            <div class="row g-4">
            <div class="col-sm-12 col-xl-6"  style="min-width: 100%">
                  <div class="bg-light rounded h-100 p-4">
                     <h5 class="text-primary">식당명 : ${res.resName}</h5>
                     
                                 
                     
                                          
                     <br>
                     
                     <form name="resForm" action="adminrestaurantupdate.did?resID=${res.resId}" method="post">
                        <div class="row mb-3">
                           <label for="inputPhone3" class="col-sm-2 col-form-label">식당명</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="resName" name="resName" value="${res.resName}">
                           </div>
                        </div>
                        
                        <div class="row mb-3">
                           <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="resPhone" name="resPhone" value="${res.resPhone}">
                           </div>
                        </div>
                        <div class="row mb-3">
                           <label for="inputCategory3" class="col-sm-2 col-form-label">카테고리</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control"
                                 id="resCategory" name="resCategory" value="${res.resCategory}">
                           </div>
                        </div>
                        <div class="row mb-3">
                           <label for="inputCategory3" class="col-sm-2 col-form-label">평점</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control"
                                 id="resRate" name="resRate" value="${res.resAvg}">
                           </div>
                        </div>
                        <div class="row mb-3">
                           <label for="inputAddress3" class="col-sm-2 col-form-label">주소</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control"
                                 id="resAdd" name="resAdd" value="${res.resAdd}">
                           </div>
                        </div>
                        <fieldset class="row mb-3">
                           <legend class="col-form-label col-sm-2 pt-0">주차여부</legend>
                           <div class="col-sm-10">
                              <div class="form-check">
                                 <input class="form-check-input" type="radio"
                                    name="resPark" id="gridRadios1" value="option1" checked>
                                 <label class="form-check-label" for="gridRadios1">
                                    주차가능 </label>
                              </div>
                              <div class="form-check">
                                 <input class="form-check-input" type="radio"
                                    name="resPark" id="gridRadios2" value="option2">
                                 <label class="form-check-label" for="gridRadios2">
                                    주차불가능 </label>
                              </div>
                           </div>
                        </fieldset>
                        
                        <!-- <input type="submit" class="btn btn-outline-primary m-2" value="식당 정보 변경"> -->
                      <!--  <input type="button" class="btn btn-outline-danger m-2" value="식당 삭제" onClick="resDelete()"> -->
                        <input type="button" class="btn btn-outline-danger m-2" value="식당 삭제" onClick="location.href='adminrestaurantdelete.did?resId=${res.resId}';">
                     </form>
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
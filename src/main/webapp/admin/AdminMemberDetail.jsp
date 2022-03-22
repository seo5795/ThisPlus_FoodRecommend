<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="model.member.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="mdao" class="model.member.MemDAO" scope="application" />
<jsp:useBean id="mvo" class="model.member.MemVO" />
<!DOCTYPE html>
<html lang="ko">

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

<!-- 이미지 미리보기 로직 -->
<script type="text/javascript">
// 이미지 미리보기
function preview(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function(e) {
         document.getElementById('preview').src = e.target.result;
       };
       reader.readAsDataURL(input.files[0]);
     } else {
       document.getElementById('preview').src = "";
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
         <form method="post"
            action="adminmemberupdate.did?memId=${memdata.memId}" enctype="multipart/form-data" >

            <div class="container-fluid pt-4 px-4" style="display: inline">
               <div class="row g-4">
                  <div class="col-sm-8 col-xl-10">
                     <div class="bg-light rounded h-100 p-4">
                        <h3 class="mb-4">${memdata.memName}님의상세정보</h3>
                        <br>
                        <img class="rounded-circle flex-shrink-0" src="../${memdata.memPic }"
                           alt="" style="width: 100px; height: 100px;">
                        <div class="form-floating mb-3 col-xl-10">
                           <input type="text" class="form-control" id="floatingInput"
                              placeholder="${memdata.memId}" value="${memdata.memId}" name="memId" disabled>
                           <label for="floatingInput">회원아이디</label>
                        </div>
                        <div class="form-floating mb-3 col-xl-10">
                           <input type="password" class="form-control"
                              id="floatingPassword" placeholder="${memdata.memPw}"
                              value="${memdata.memPw}" name="memPw" readonly > <label
                              for="floatingPassword">회원비밀번호 </label>
                        </div>
                        <div class="form-floating mb-3 col-xl-10">
                           <input type="text" class="form-control" id="floatingInput"
                              placeholder="${memdata.memName}" value="${memdata.memName}"  name="memName">
                           <label for="floatingInput">회원이름</label>
                        </div>
                        <div class="form-floating mb-3 col-xl-10">
                           <input type="text" class="form-control" id="floatingInput"
                              placeholder="${memdata.memEmail}" value="${memdata.memEmail}"  name="memEmail">
                           <label for="floatingInput">회원이메일</label>
                        </div>
                        <div class="form-floating mb-3 col-xl-10">

                           <c:choose>
                              <c:when test="${memdata.memRank == 0}">
                                 <input type="text" class="form-control" id="floatingInput"
                                    placeholder="일반등급" value="${memdata.memRank}"  name="memRank" disabled>
                                 <label for="floatingInput">회원등급</label>

                              </c:when>
                              <c:when test="${memdata.memRank == 1}">
                                 <input type="text" class="form-control" id="floatingInput"
                                    placeholder="식당점주" value="${memdata.memRank}" name="memRank" disabled>
                                 <label for="floatingInput">회원등급</label>
                              </c:when>

                              <c:otherwise>
                                 <input type="text" class="form-control" id="floatingInput"
                                    placeholder="관리자" value="${memdata.memRank}" name="memRank" disabled>
                                 <label for="floatingInput">회원등급</label>
                              </c:otherwise>
                           </c:choose>





                        </div>
                        <div class="form-floating mb-3 col-xl-10">
                           <input type="text" class="form-control" id="floatingInput"
                              placeholder="${memdata.memPhone}" value="${memdata.memPhone}" name="memPhone">
                           <label for="floatingInput">회원전화번호</label>
                        </div>

                        <div class="form-floating mb-3 col-xl-10">
                           <input type="text" class="form-control" id="floatingInput"
                              placeholder="${memdata.memAddress}"
                              value="${memdata.memAddress}" name="memAddress"> <label
                              for="floatingInput">회원주소</label>
                        </div>
                        <div class="form-floating mb-3 col-xl-10">
                           <input type="text" class="form-control" id="floatingInput"
                              placeholder="${memdata.memPoint}" value="${memdata.memPoint}" name="memPoint">
                           <label for="floatingInput">회원포인트</label>
                        </div>
                        <div class="form-floating mb-3 col-xl-10">
                           <input type="file" name="uploadfile" onchange="preview(this);" accept="image/*" >
                        </div>
                        <input type="submit" class="btn btn-outline-primary m-2"
                           value="수정"> <a
                           href="adminmemberdelete.did?memId=${memdata.memId }"
                           class="btn btn-outline-danger m-2">회원삭제</a>

                     </div>

                  </div>
               </div>
            </div>
         </form>
      
      <div class="imgPreview">
            <img id="preview" width="400px" height="300px"/>
            이미지 미리보기
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
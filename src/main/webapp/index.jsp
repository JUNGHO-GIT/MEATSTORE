<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<head>
		<!-- meta -->
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800">
		<link rel="stylesheet" href="${ctxPath}/res/css/main.css" />
		<link rel="stylesheet" href="${ctxPath}/res/css/media.css" />
    <link rel="stylesheet" href="${ctxPath}/res/css/jungho.css" />
    <link rel="shortcut icon" href="${imgsPath}/etc/favicon.ico" type="image/x-icon" />
		<!-- js -->
		<script defer src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script defer src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script defer src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
		</script>
		<script defer src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script defer src="${ctxPath}/res/js/board.js"></script>
		<script defer src="${ctxPath}/res/js/admin.js"></script>
		<script defer src="${ctxPath}/res/js/main.js"></script>
		<script defer src="${ctxPath}/res/js/notice.js"></script>
		<script defer src="${ctxPath}/res/js/cart.js"></script>
    <!-- script -->
    <script>
      // ------------------------------------------------------------------------------------------>
      var sessionId = "${sessionScope.id}";
      function sessionAlert (event)  {
        if (sessionId == null || sessionId == "") {
          event.preventDefault();
          alert("로그인 후 이용해주세요.");
          window.location.href = "${ctxPath}/member/loginForm.do";
          return false;
        }
        else {
          return true;
        }
      }
      // ------------------------------------------------------------------------------------------>
      function deprecated(event) {
        event.preventDefault();
        alert("점검중 입니다.");
        window.location.reload();
      };
    </script>
	</head>

	<body>
		<!-- top -------------------------------------------------------------------------------------->
		<header class="header" id="header">
			<div class="container">
				<div class="row menu">
          <!-- logo -->
					<div class="col-xl-1 col-lg-1 col-md-1 d-none d-sm-block d-xs-block d-md-block d-lg-block">
						<a href="${ctxPath}/index.jsp">
							<img src="${imgsPath}/main/logo.png" width="150px" height="150px" />
						</a>
					</div>
          <!-- section -->
					<div class="col-xl-11 col-lg-11 col-md-11 col-sm-12 col-xs-12 col-12">
						<a href="${ctxPath}/product/listForm.do">
							<img src="${imgsPath}/section/productList.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxPath}/cart/listForm.do" onclick="return sessionAlert(event);">
							<img src="${imgsPath}/section/cartList.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxPath}/orders/listForm.do" onclick="return deprecated(event);">
							<img src="${imgsPath}/section/orders.png" />
						</a>
            &nbsp;&nbsp;
						<a href="${ctxPath}/board/listForm.do">
							<img src="${imgsPath}/section/board.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxPath}/notice/listForm.do">
							<img src="${imgsPath}/section/notice.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxPath}/qna/listForm.do">
							<img src="${imgsPath}/section/qna.png" />
						</a>
						&nbsp;&nbsp;
            <!-- login x -->
						<c:if test="${sessionScope.id == null && sessionScope.adminId == null}">
              <span class="log"><a href="${ctxPath}/member/loginForm.do">로그인</a></span>
							&nbsp;
              <span class="log"><a href="${ctxPath}/member/insertForm.do">회원가입</a></span>
						</c:if>
						&nbsp;&nbsp;
						<!-- login o (일반 회원) -->
						<c:if test="${sessionScope.id != null}">
              <span class="log"><a href="${ctxPath}/member/logoutPro.do">로그아웃</a></span>
              &nbsp;
              <span class="log"><a href="${ctxPath}/member/updateForm.do">회원정보수정</a></span>
						</c:if>
						&nbsp;&nbsp;
						<!-- login o (관리자) -->
						<c:if test="${sessionScope.adminId != null}">
              <span class="log"><a href="${ctxPath}/index.jsp">관리자 모드</a></span>
              &nbsp;
              <span class="log"><a href="${ctxPath}/admin/logoutPro.do">로그아웃</a></span>
						</c:if>
					</div>
				</div>
			</div>
		</header>

		<!-- main ------------------------------------------------------------------------------------->
		<main class="main" id="main">
			<c:if test="${CONTENT!=null && CONTENT!='/index.jsp'}">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
						<jsp:include page="${CONTENT}" />
					</div>
				</div>
			</c:if>
			<c:if test="${CONTENT==null}">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
						<video autoplay loop muted style="width: -webkit-fill-available;">
							<source src="${imgsPath}/main/meat_video.mp4" type="video/mp4" />
						</video>
					</div>
				</div>
			</c:if>
		</main>

		<!-- bottom ----------------------------------------------------------------------------------->
		<footer class="footer" style="background-color: #872d35; margin-top: 20px;">
			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
						<h6>
              <p class="text-center text-white mb-1 pt-1 ft-7">
                © 2023 MTS Corp. All Rights Reserved | Designed & Developed by MTS Corp.
              </p>
						</<h6>
					</div>
				</div>
			</div>
		</footer>

	</body>
</html>
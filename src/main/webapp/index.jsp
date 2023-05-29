<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />

<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<head>
		<!-- meta -->
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800">
    <link rel="shortcut icon" href="${imgsPath}/etc/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${ctxPath}/res/css/main.css" />
		<link rel="stylesheet" href="${ctxPath}/res/css/media.css" />
    <link rel="stylesheet" href="${ctxPath}/res/css/jungho.css" />

		<!-- js -->
		<script defer src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script defer src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script defer src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
		</script>
		<script defer src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script defer src="${ctxPath}/res/js/board.js"></script>
		<script defer src="${ctxPath}/res/js/admin.js"></script>
		<script defer src="${ctxPath}/res/js/main.js"></script>
		<script defer src="${ctxPath}/res/js/notice.js"></script>
		<script defer src="${ctxPath}/res/js/cart.js"></script>
		<script defer src="${ctxPath}/res/js/product.js"></script>
		<script defer src="${ctxPath}/res/js/member.js"></script>
	</head>

	<body>

    <div class="background"><div class="loader"></div></div>

		<!-- top -------------------------------------------------------------------------------------->
		<header class="header" id="header">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <!-- logo -->
          <a class="navbar-brand" href="${ctxPath}/index.jsp">
            <img src="${imgsPath}/main/logo.png" class="img-fluid" style="max-width: 120px; max-height: 120px;"/>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <!-- section -->
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="${ctxPath}/product/listForm.do">상품</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${ctxPath}/cart/listForm.do" onclick="return sessionAlert(event);">장바구니</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${ctxPath}/orders/listForm.do" onclick="return deprecated(event);">주문내역</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${ctxPath}/board/listForm.do">게시판</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${ctxPath}/notice/listForm.do">공지사항</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${ctxPath}/qna/listForm.do">Q&A</a>
              </li>
              <!-- login x -->
              <c:if test="${sessionScope.id == null && sessionScope.adminId == null}">
                <li class="nav-item">
                  <a class="nav-link" href="${ctxPath}/member/loginForm.do">로그인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${ctxPath}/member/insertForm.do">회원가입</a>
                </li>
              </c:if>
              <!-- login o (일반 회원) -->
              <c:if test="${sessionScope.id != null}">
                <li class="nav-item">
                  <a class="nav-link" href="${ctxPath}/member/logoutPro.do">로그아웃</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${ctxPath}/member/updateForm.do">회원정보수정</a>
                </li>
              </c:if>
              <!-- login o (관리자) -->
              <c:if test="${sessionScope.adminId != null}">
                <li class="nav-item">
                  <a class="nav-link" href="${ctxPath}/index.jsp">관리자 모드</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${ctxPath}/admin/logoutPro.do">로그아웃</a>
                </li>
              </c:if>
            </ul>
          </div>
        </nav>
      </div>
    </header>

    <div class="empty-h150"></div>

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

    <div class="empty-h150"></div>

		<!-- bottom ----------------------------------------------------------------------------------->
		<footer class="footer" style="background-color: #872d35; margin-top: 20px;">
			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
						<h6>
              <p class="text-center text-white mb-1 pt-1 footer-p">
                © 2023 MTS Corp. All Rights Reserved | Designed & Developed by MTS Corp.
              </p>
						</<h6>
					</div>
				</div>
			</div>
		</footer>

	</body>
</html>
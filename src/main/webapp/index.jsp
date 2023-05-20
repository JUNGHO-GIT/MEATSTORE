<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
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
		<link rel="stylesheet" href="${ctxpath}/res/css/main.css" />
		<link rel="stylesheet" href="${ctxpath}/res/css/style.css" />
    <link rel="stylesheet" href="${ctxpath}/res/css/jungho.css" />
		<!-- js -->
		<script defet src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script defet src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script defet src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
		</script>
		<script defet src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script defet src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script defet src="${ctxpath}/res/js/board.js"></script>
		<script defet src="${ctxpath}/res/js/admin.js"></script>
		<script defet src="${ctxpath}/res/js/member.js"></script>
		<script defet src="${ctxpath}/res/js/notice.js"></script>
		<script defet src="${ctxpath}/res/js/cart.js"></script>
		<!-- custom -->
		<script>
			$(document).ready(function() {
				if (screen.width > 1024) {
					AOS.init({
						easing: 'ease-in-out-sine',
						once: true,
					});
				}
			});
			(new IntersectionObserver(function(e, o) {
				if (e[0].intersectionRatio > 0) {
					document.documentElement.removeAttribute('class');
				}
				else {
					document.documentElement.setAttribute('class', 'stuck');
				};
			}));

			function pwCheck() {
				if (document.updateForm.pw.value == "") {
					alert("암호는 필수 입력");
					document.updateForm.pw.focus();
					return false;
				}
			}
		</script>
	</head>

	<body>
		<!-- top -------------------------------------------------------------------------------------->
		<header class="header" id="header">
			<div class="container">
				<div class="row menu">
					<div class="col-xl-1 col-lg-1 col-md-1 d-none d-sm-block d-xs-block d-md-block d-lg-block">
						<a href="${ctxpath}/index.jsp">
							<img src="${ctxpath}/res/imgs/main/logo.png" width="150px" height="150px" />
						</a>
					</div>
					<div class="col-xl-11 col-lg-11 col-md-11 col-sm-12 col-xs-12 col-12">
						<a href="${ctxpath}/product/listForm.do">
							<img src="${ctxpath}/res/imgs/section/productList.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/cart/listForm.do">
							<img src="${ctxpath}/res/imgs/section/cartList.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/order/listForm.do">
							<img src="${ctxpath}/res/imgs/section/orderList.png" />
						</a>
            &nbsp;&nbsp;
						<a href="${ctxpath}/board/listForm.do">
							<img src="${ctxpath}/res/imgs/section/board.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/notice/listForm.do">
							<img src="${ctxpath}/res/imgs/section/notice.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/qna/listForm.do">
							<img src="${ctxpath}/res/imgs/section/qna.png" />
						</a>
						&nbsp;&nbsp;
            <!-- login x -->
						<c:if test="${sessionScope.id == null && sessionScope.adminId == null}">
              <span class="log"><a href="${ctxpath}/member/loginForm.do">로그인</a></span>
							&nbsp;
              <span class="log"><a href="${ctxpath}/member/insertForm.do">회원가입</a></span>
						</c:if>
						&nbsp;&nbsp;
						<!-- login o (일반 회원) -->
						<c:if test="${sessionScope.id != null}">
              <span class="log"><a href="${ctxpath}/member/logoutPro.do">로그아웃</a></span>
              &nbsp;
              <span class="log"><a href="${ctxpath}/member/updateForm.do">회원정보수정</a></span>
						</c:if>
						&nbsp;&nbsp;
						<!-- login o (관리자) -->
						<c:if test="${sessionScope.adminId != null}">
              <span class="log"><a href="${ctxpath}/admin/logoutPro.do">로그아웃</a></span>
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
							<source src="${ctxpath}/res/imgs/main/meat_video.mp4" type="video/mp4" />
						</video>
					</div>
				</div>
			</c:if>
		</main>

		<!-- bottom ----------------------------------------------------------------------------------->
		<footer class="footer" style="background-color: #3d1216; margin-top: 20px;">
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
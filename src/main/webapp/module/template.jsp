<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
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
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
		</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="${ctxpath}/res/js/board.js"></script>
		<script src="${ctxpath}/res/js/admin.js"></script>
		<script src="${ctxpath}/res/js/check.js"></script>
		<script src="${ctxpath}/res/js/member.js"></script>
		<script src="${ctxpath}/res/js/notice.js"></script>
		<script src="${ctxpath}/res/js/cart.js"></script>
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
			})).observe(document.querySelector('.trigger'));
		</script>
		<script>
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
						<a href="${ctxpath}/module/template.jsp">
							<img src="${ctxpath}/res/imgs/logo.png" width="150px" height="150px" />
						</a>
					</div>
					<div class="col-xl-11 col-lg-11 col-md-11 col-sm-12 col-xs-12 col-12">
						<a href="${ctxpath}/product/list.do">
							<img src="${ctxpath}/res/imgs/productList.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/cart/list.do">
							<img src="${ctxpath}/res/imgs/cartList.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/order/list.do">
							<img src="${ctxpath}/res/imgs/orderList.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/notice/list.do">
							<img src="${ctxpath}/res/imgs/notice.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/board/list.do">
							<img src="${ctxpath}/res/imgs/board.png" />
						</a>
						&nbsp;&nbsp;
						<a href="${ctxpath}/qna/list.do">
							<img src="${ctxpath}/res/imgs/qna.png" />
						</a>
						&nbsp;&nbsp;
						<c:if test="${empty sessionScope.id && empty sessionScope.adminid}">
              <span class="log"><a href="${ctxpath}/member/loginForm.do">로그인</a></span>
							&nbsp;
              <span class="log"><a href="${ctxpath}/member/inputForm.do">회원가입</a></span>
						</c:if>
						&nbsp;&nbsp;
						<!-- login o (일반 회원) -->
						<c:if test="${!empty sessionScope.id}">
              <span class="log"><a href="${ctxpath}/member/logOut.do">로그아웃</a></span>
              &nbsp;
              <span class="log"><a href="${ctxpath}/member/modify.do">정보수정</a></span>
						</c:if>
						&nbsp;&nbsp;
						<!-- login o (관리자) -->
						<c:if test="${!empty sessionScope.adminid}">
              <span class="log"><a href="${ctxpath}/member/logOut.do">로그아웃</a></span>
						</c:if>
					</div>
				</div>
			</div>
		</header>

		<!-- main ------------------------------------------------------------------------------------->
		<main class="main" id="main">
			<c:if test="${CONTENT!=null && CONTENT!='/module/template.jsp'}">
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
							<source src="${ctxpath}/res/imgs/meat_video.mp4" type="video/mp4" />
						</video>
					</div>
				</div>
			</c:if>
		</main>

		<!-- bottom ----------------------------------------------------------------------------------->
		<footer class="footer" style="background-color: #760d17; margin-top: 60px;">
			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
						<h6>
							<p class="m-0 text-center text-white">JIWOONAE ENG Corp. All rights reserved.</p>
							<p class="m-0 text-center text-white">서울특별시 영등포구 국제금융로 6길 42 | (주)JIWOONAE</p>
						</<h6>
					</div>
				</div>
			</div>
		</footer>

	</body>
</html>
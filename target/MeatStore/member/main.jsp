<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!DOCTYPE html>
<html lang="en, ko">

	<head>
		<!-- meta -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800">
		<link rel="stylesheet" href="${ctxpath}/res/css/board.css" />
		<!-- js -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
		</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
		<script src="${ctxpath}/res/js/board.js"></script>
		<!-- custom -->
		<script>
			document.getElementById("buttons-jungho").addEventListener("click", function() {});
		</script>
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
	</head>

	<body>

    <!-- login x -->
		<c:if test="${empty sessionScope.id && empty sessionScope.adminid}">
			<table border="0" valign="top">
				<tr>
					<td>
						<font size="2">
							<a href="${ctxpath}/member/loginForm.do">
								<img src="${ctxpath}/res/imgs/Login.png" />
							</a>
							<a href="${ctxpath}/member/inputForm.do">
								<img src="${ctxpath}/res/imgs/input.png" />
							</a>
						</font>
					</td>
				</tr>
			</table>
		</c:if>

    <!-- login o (일반 회원) -->
		<c:if test="${!empty sessionScope.id}">
			<table border="0" align="right">
				<tr>
					<td align="right">
						${sessionScope.id}님 방문을 환영합니다.&nbsp;&nbsp;
						<form method="post" action="${ctxpath}/member/logOut.do">
							<input type="submit" value="로그아웃" />
							<input type="button" value="내정보수정" onClick="location.href='${ctxpath}/member/modify.do'" />
						</form>
					</td>
				</tr>
			</table>
		</c:if>

    <!-- login o (관리자) -->
		<c:if test="${!empty sessionScope.adminid}">
			<table border="0" align="right">
				<tr>
					<td align="right">
						${sessionScope.adminid}님 방문을 환영합니다&nbsp;&nbsp;
						<form method="post" action="${ctxpath}/member/logOut.do">
							<input type="submit" value="로그아웃" />
						</form>
					</td>
				</tr>
			</table>
		</c:if>

	</body>
</html>
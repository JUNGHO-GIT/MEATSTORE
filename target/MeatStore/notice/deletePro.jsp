<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!doctype html>
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
		<c:if test="${x==1}">
			<meta http-equiv="Refresh" content="0;url=${ctxpath}/notice/list.do" />
		</c:if>
		<c:if test="${x==-1}">
			<script>
				alert("암호가 다릅니다.");
				history.back();
			</script>
		</c:if>

	</body>
</html>
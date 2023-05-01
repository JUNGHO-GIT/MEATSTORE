<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="upload" />
<!--[Html]----------------------------------------------------------------------------------------->

<!doctype html>
<html lang="ko, en">
	<!--[Head]--------------------------------------------------------------------------------------->

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
	<!--[Body]--------------------------------------------------------------------------------------->

	<body>
		<!-- form ------------------------------------------------------------------------------------->
		<form name="delForm" method="post" enctype="multipart/form-data" action="${ctxpath}/board/deletePro.do?pageNum=${pageNum}" onsubmit="return delpwcheck()">
			<input type="hidden" name="num" value="${num}" />
			<input type="hidden" name="pw" id="pw" value="${dto.pw}" />
			<section class="section-1">
				<div class="jumbotron d-flex align-items-center">
					<div class="gradient"></div>
					<div class="container-fluid content">
						<h1 data-aos="fade-right" data-aos-delay="300"> 자유게시판 </h1>
						<h2 data-aos="fade-left" data-aos-delay="300"> [글 삭제하기] </h2>
					</div>
				</div>
			</section>
			<div class="component-jungho3">
				<div class="col-sm-12">
					<ul>
						<h6>
							<input type="password" name="pw" id="pw" placeholder="암호를 입력하세요" />
							<input type="submit" value="삭제" class="btn btn-jungho" />
							<input type="reset" value="다시쓰기" onclick="window.location.reload()" class="btn btn-jungho" />
							<input type="button" value="취소" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${pageNum}'" class="btn btn-jungho" />
							<input type="button" onclick="window.location.href='${ctxpath}/board/list.do'" value="목록보기" class="btn btn-jungho" />
						</h6>
					</ul>
				</div>
			</div>
			<br>
		</form>

	</body>
</html>
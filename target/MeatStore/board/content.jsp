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

		<section class="section-1">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300"> 자유게시판 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [글 내용 보기] </h2>
				</div>
			</div>
		</section>

		<section class="blog">
			<div class="container">
				<div class="row">
					<!-- 공백 추가 -->
					<div class="blank-jungho0"></div>
					<!-- 머릿말 -->
					<div class="float-left">
						<h3> 당신을 표현해주세요! </h3>
					</div>
					<!-- 공백 추가 -->
					<div class="blank-jungho8"></div>
					<!-- 글쓰기 버튼 -->
					<div class="component-jungho1">
						<div class="col-sm-12">
							<ul>
								<h6>
									<input type="button" onclick="window.location.href='${ctxpath}/board/updateForm.do?num=${num}&pageNum=${pageNum}'" value="수정" class="btn btn-jungho" /> &nbsp;
									<input type="button" onclick="window.location.href='${ctxpath}/board/deleteForm.do?num=${num}&pageNum=${pageNum}'" value="삭제" class="btn btn-jungho" /> &nbsp;
									<input type="button" onclick="window.location.href='${ctxpath}/board/writeForm.do?num=${num}&pageNum=${pageNum}&ref=${dto.ref}&re_step=${dto.re_step}&re_level=${dto.re_level}'" value="답글쓰기" class="btn btn-jungho"> &nbsp;
									<input type="button" onclick="window.location.href='${ctxpath}/board/list.do'" value="목록보기" class="btn btn-jungho" />
								</h6>
							</ul>
						</div>
					</div>
				</div>
				<br>
				<div class="container">
					<div class="row" data-aos="fade-up" data-aos-duration="700">
						<div class="col-sm-12">
							<c:if test="${dto.fileupload != null}">
								<img src="${ctxpath}/${imgspath}/${dto.fileupload}" width="auto" height="auto" class="img-thumbnail image" />
							</c:if>
							<c:if test="${dto.fileupload == null}">
								<img src="images/nofile.jpg" class="figure-img img-fluid" />
							</c:if>
						</div>
					</div>
				</div>
				<br>
				<div class="social-buttons" data-aos="fade-up" data-aos-duration="700">
					<div class="row">
						<div class="col-sm-5 col-md-6">
							<div class="inner-jungho">
								<h2> &nbsp; &nbsp; &nbsp; ${dto.subject} </h2>
								<h3> ${dto.regdate} <span> &nbsp; &nbsp; ${dto.writer} </span>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="jungho-jungho">
					<div class="row" data-aos="fade-up" data-aos-duration="700">
						<div class="col-sm-12 col-lg-12 box">
							<p aria-readonly="true"> ${dto.content} </p>
						</div>
					</div>
				</div>
				<br>
			</div>
		</section>

	</body>
</html>
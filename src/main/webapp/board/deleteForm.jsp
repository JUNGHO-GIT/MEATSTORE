<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" /><!--[Html]----------------------------------------------------------------------------------------->

<!doctype html>
<html lang="ko, en">
	<!--[Body]--------------------------------------------------------------------------------------->

	<body>
		<section class="section-1">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[글 삭제하기]</h2>
				</div>
			</div>
		</section>
		<div class="component-jungho3">
			<form name="delForm" method="post" enctype="multipart/form-data" action="${ctxpath}/board/deletePro.do?pageNum=${pageNum}" onsubmit="return delpwCheck()">
				<input type="hidden" name="num" value="${num}" />
				<input type="hidden" name="pw" id="pw" value="${dto.pw}" />
				<div class="col-sm-12">
					<ul>
						<h6>
							<input type="password" name="pw" id="pw" placeholder="암호를 입력하세요" />
							<input type="submit" value="삭제" class="btn btn-jungho" />
							<input type="reset" value="다시쓰기" onclick="window.location.reload()" class="btn btn-jungho" />
							<input type="button" value="취소" onclick="window.location.href='${ctxpath}/board/listForm.do?pageNum=${pageNum}'" class="btn btn-secondary" />
							<input type="button" onclick="window.location.href='${ctxpath}/board/listForm.do'" value="목록보기" class="btn btn-jungho" />
						</h6>
					</ul>
				</div>
			</form>
		</div>
		<br>

	</body>
</html>
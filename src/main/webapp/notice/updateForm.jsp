<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("utf-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">공지 사항</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[글 수정]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<form name="updateForm" class="m-4" method="post" action="${ctxpath}/notice/updatePro.do?pageNum=${pageNum}" onSubmit="return pwcheck()">
						<input type="hidden" name="num" value="${num}" />
						<div class="form-group">
							<input class="form-control" type="text" name="title" id="title" size="50" placeholder="글 제목을 입력하세요." value="${dto.title}" />
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="writer" id="writer" size="20" placeholder="이름을 입력하세요." value="${dto.writer}" />
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content" id="content" rows="10" cols="50" placeholder="내용을 입력하세요.">${dto.content}</textarea>
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="pw" id="pw" size="20" placeholder="암호를 입력하세요." />
						</div>
						<div class="btn btn-group d-flex justify-content-center align-items-center">
							<button class="btn btn-jungho" type="submit">글쓰기</button>
							<button class="btn btn-jungho" type="reset">다시쓰기</button>
							<button class="btn btn-jungho" type="button" onClick="javascript:history.back();">취소하기</button>
						</div>
					</form>
				</div>
			</div>
		</section>

	</body>
</html>
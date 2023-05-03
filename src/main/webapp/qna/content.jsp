<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">QNA</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[여러분들의 의견을 들려주세요]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section class="section">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<form class="m-4">
						<!-- 글번호 -->
						<div class="form-group form-inline">
							<span class="form-group-text" style="font-size: 18px; font-weight: bolder;">글번호:&nbsp;&nbsp;</span>
							<input class="form-control" type="text" name="num" value="${dto.num}" readonly="readonly" />
						</div>
						<!-- 제목 -->
						<div class="form-group form-inline">
							<span class="form-group-text" style="font-size: 18px; font-weight: bolder;">글제목:&nbsp;&nbsp;</span>
							<input class="form-control" type="text" name="subject" value="${dto.subject}" readonly="readonly" />
						</div>
						<!-- 작성자 -->
						<div class="form-group form-inline">
							<span class="form-group-text" style="font-size: 18px; font-weight: bolder;">작성자:&nbsp;&nbsp;</span>
							<input class="form-control" type="text" name="writer" value="${dto.writer}" readonly="readonly" />
						</div>
						<!-- 작성일 -->
						<div class="form-group form-inline">
							<span class="form-group-text" style="font-size: 18px; font-weight: bolder;">작성일:&nbsp;&nbsp;</span>
							<input class="form-control" type="text" name="regdate" value="${dto.regdate}" readonly="readonly" />
						</div>
						<!-- 조회수 -->
						<div class="form-group form-inline">
							<span class="form-group-text" style="font-size: 18px; font-weight: bolder;">조회수:&nbsp;&nbsp;</span>
							<input class="form-control" type="text" name="views" value="${dto.views}" readonly="readonly" />
						</div>
						<!-- 내용 -->
						<div class="form-group form-inline">
							<span class="form-group-text" style="font-size: 18px; font-weight: bolder;">글내용:&nbsp;&nbsp;</span>
							<textarea class="form-control" name="content" readonly="readonly" style="height: 300px; resize: none;">${dto.content}</textarea>
						</div>
					</form>
				</div>
			</div>
			<br />
			<br />
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<div class="btn btn-group d-flex justify-content-center align-items-center ms-4">
						<button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/qna/updateForm.do?num=${num}&pageNum=${pageNum}'">글 수정</button>
						&nbsp;&nbsp;
						<button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/qna/deleteForm.do?num=${num}&pageNum=${pageNum}'">글 삭제</button>
						<c:if test="${!empty sessionScope.adminid}">
							<button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/qna/writeForm.do?num=${num}&pageNum=${pageNum}&ref=${dto.ref}&re_step=${dto.re_step}&re_indent=${dto.re_indent}'">답글 작성</button>
						</c:if>
						&nbsp;&nbsp;
						<button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/qna/list.do?pageNum=${pageNum}'">리스트</button>
					</div>
				</div>
			</div>
		</section>

	</body>
</html>
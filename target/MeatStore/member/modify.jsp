<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">회원 정보</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[ID : ${sessionScope.id}]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<form name="update" method="post" action="${ctxpath}/member/updateForm.do">
						<div class="btn btn-group d-flex justify-content-center align-items-center">
							<input type="hidden" name="id" value="${sessionScope.id}" />
							<button class="btn btn-jungho" type="submit">회원정보수정</button>
						</div>
					</form>
					<form name="delForm" method="post" action="${ctxpath}/member/deleteForm.do">
						<div class="btn btn-group d-flex justify-content-center align-items-center">
							<input type="hidden" name="id" value="${sessionScope.id}" />
							<button class="btn btn-jungho" type="submit">회원탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</section>

	</body>
</html>
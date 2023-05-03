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
					<h1 data-aos="fade-right" data-aos-delay="300">회원탈퇴</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[ID : ${sessionScope.id}] 회원님</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<form class="m-4" name="delForm" method="post" action="${ctxpath}/member/deletePro.do" onSubmit="return pwCheck()">
						<div class="form-group">
							<input type="password" name="pw" id="pw" size="20" placeholder="비밀번호" class="form-control" required="required" />
							<input type="hidden" name="id" value="${sessionScope.id}" class="form-control" />
						</div>
						<div class="btn btn-group d-flex justify-content-center align-items-center">
							<button class="btn btn-jungho" type="submit">회원탈퇴</button>
              &nbsp;&nbsp;
							<button class="btn btn-secondary" type="button" onClick="location='${ctxpath}/module/template.jsp'">취소</button>
						</div>
					</form>
        </div>
      </div>
		</section>

	</body>
</html>
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
					<h1 data-aos="fade-right" data-aos-delay="300">회원 정보 수정</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[ID : ${sessionScope.id}]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
				<form method="post" action="${ctxpath}/member/updatePro.do" onSubmit="return updateCheck()">
          <div class="form-group">
            <input class="form-control" type="text" name="id" id="id" value="${dto.id}"/>
          </div>
          <div class="form-group">
            <input class="form-control" type="password" name="pw" id="pw" size="20" placeholder="암호를 입력하세요" />
          </div>
          <div class="form-group">
            <input class="form-control" type="password" name="pw2" id="pw2" size="20" placeholder="암호를 다시 입력하세요" />
          </div>
          <div class="form-group">
            <input class="form-control" type="text" name="name" id="name" size="40" value="${dto.name}" />
          </div>
          <div class="form-group">
            <input class="form-control" type="text" name="email" id="email" size="40" value="${dto.email}" />
          </div>
          <div class="form-group">
            <input class="form-control" type="text" name="tel" id="tel" size="40" value="${dto.tel}" />
          </div>
          <div class="form-group">
          	<div class="input-group">
          		<input class="form-control" type="text" name="addr" id="addr" size="50" value="${dto.addr}" readonly />
          		<button class="btn btn-jungho" type="button" onClick="findAddr()">주소찾기</button>
          	</div>
          	<input class="form-control" type="text" name="addr2" id="addr2" size="20" value="${dto.addr2}" />
          	<input class="form-control" type="text" name="zipcode" id="zipcode" size="7" value="${dto.zipcode}" readonly />
          </div>
          <div class="btn btn-group">
          	<button class="btn btn-jungho mt-2" type="submit">수정하기</button>&nbsp;&nbsp;
          	<button class="btn btn-jungho mt-2" type="reset">재입력</button>&nbsp;&nbsp;
          	<button class="btn btn-jungho mt-2" type="button" onClick="location='${ctxpath}/home/template.jsp'">취소하기</button>
          </div>
        </form>
        </div>
      </div>

    </section>
  </body>
</html>
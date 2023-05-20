<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />


<!-- header -->
<section class="section">
  <div class="jumbotron d-flex align-items-center">
    <div class="gradient"></div>
    <div class="container-fluid content">
      <h1 data-aos="fade-right" data-aos-delay="300">로그인</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[ID와 비밀번호를 입력해주세요]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
  <div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center mt-3">
      <form name="loginForm" method="post" action="${ctxpath}/member/loginPro.do" onSubmit="return loginCheck()">
        <div class="form-group">
          <input class="form-control" type="text" name="id" id="id" size="20" placeholder="아이디를 입력해주세요" />
        </div>
        <div class="form-group">
          <input class="form-control" type="password" name="pw" id="pw" size="20" placeholder="비밀번호를 입력해주세요" />
        </div>
        <div class="btn btn-group d-flex justify-content-center align-items-center">
          <button class="btn btn-jungho" type="submit" id="submit_button">로그인</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho"type="button" onclick="window.location.reload();">
          다시입력</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho" type="button" onClick="location='${ctxpath}/admin/adminLoginForm.do'">관리자 로그인</button>
          &nbsp;&nbsp;
        </div>
      </form>
    </div>
  </div>
</section>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<script>
  function loginCheck() {
    if ($("#adminId").val() == "") {
      alert("ID를 입럭하세요");
      $("#adminId").focus();
      return false;
    }
    if ($("#adminPw").val() == "") {
      alert("암호를 입력하세요");
      $("#adminPw").focus();
      return false;
    }
    return true;
  }
</script>

<!-- header -->
<section class="section pb-5">
  <div class="jumbotron d-flex align-items-center">
    <div class="gradient"></div>
    <div class="container-fluid content">
      <h1 data-aos="fade-right" data-aos-delay="300">로그인</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[관리자 전용]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
  <div class="row d-flex justify-content-center align-items-center">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center mt-3">
      <form name="loginForm" method="POST" action="${ctxPath}/admin/loginPro.do" onSubmit="return loginCheck()">
        <div class="form-group">
          <input class="form-control" type="text" name="adminId" adminId="adminId" placeholder="아이디를 입력해주세요" />
        </div>
        <div class="form-group">
          <input class="form-control" type="password" name="adminPw" adminId="adminPw" placeholder="비밀번호를 입력해주세요" />
        </div>
        <br/>
        <br/>
        <div class="btn btn-group d-flex justify-content-center align-items-center">
          <button class="btn btn-jungho" type="submit" adminId="submit_button">관리자 로그인</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho"type="button" onclick="window.location.reload()">
          다시입력</button>
          &nbsp;&nbsp;
        </div>
      </form>
    </div>
  </div>
</section>
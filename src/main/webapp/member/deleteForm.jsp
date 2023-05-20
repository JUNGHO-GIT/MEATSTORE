<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<!-- header -->
<section class="section pb-5">
  <div class="jumbotron d-flex align-items-center">
    <div class="gradient"></div>
    <div class="container-fluid content">
      <h1 data-aos="fade-right" data-aos-delay="300">회원탈퇴</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[ID : ${sessionScope.id}] 회원님</h2>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
  <form class="m-4" name="delForm" method="POST" action="${ctxPath}/member/deletePro.do" onSubmit="return pwCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <tr>
            <th style="border-top: transparent;">비밀번호</th>
            <th>
              <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요" class="form-control" required/>
              <input type="hidden" name="id" value="${sessionScope.id}" class="form-control" />
            </th>
          </tr>
        </table>
      </div>
    </div>
    <br/>
    <br/>

    <!-- button -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div class="btn btn-group d-flex justify-content-center align-items-center">
          <button class="btn btn-jungho" type="submit">회원탈퇴</button>
          &nbsp;&nbsp;
          <button class="btn btn-secondary" type="button" onclick="window.location.href='${ctxPath}/index.jsp'">취소</button>
        </div>
      </div>
    </div>

  </form>
</section>

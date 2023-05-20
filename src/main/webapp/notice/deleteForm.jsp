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
      <h1 data-aos="fade-right" data-aos-delay="300">공지사항</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[ 글 삭제 ]</h2>
    </div>
  </div>
</section>


<!-- section -->
<section class="section">
  <form name="delForm" method="POST" action="${ctxPath}/notice/deletePro.do?pageNum=${pageNum}" onSubmit="return noticePwCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <tr>
            <th style="border-top: transparent;">암호</th>
            <th style="border-top: transparent;">
              <input class="form-control" type="password" name="pw" id="pw" size="12" placeholder="암호를 입력하세요." />
              <input type="hidden" name="num" value="${num}" id="num" />
            </th>
          </tr>
        </table>
      </div>
    </div>
    <br />
    <br />

    <!-- button -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div class="btn btn-group d-flex justify-content-center align-items-center">
          <button class="btn btn-jungho" type="submit">글 삭제</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxPath}/notice/listForm.do?pageNum=${pageNum}'">리스트</button>
          &nbsp;&nbsp;
        </div>
      </div>
    </div>

  </form>
</section>
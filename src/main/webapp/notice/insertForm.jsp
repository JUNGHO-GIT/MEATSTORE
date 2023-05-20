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
      <h2 data-aos="fade-left" data-aos-delay="300">[글 작성]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
  <form name="insertForm" method="POST" action="${ctxPath}/notice/insertPro.do" onSubmit="return noticeCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <input type="hidden" name="num" value="${num}" />
        <input type="hidden" name="ref" value="${ref}" />
        <input type="hidden" name="re_indent" value="${re_indent}" />
        <input type="hidden" name="re_indent" value="${re_indent}" />
        <table class="table table-borderless">
          <tr>
            <th style="border-top: transparent;">제목</th>
            <th style="border-top: transparent;">
              <input class="form-control" type="text" name="subject" id="subject" placeholder="제목을 입력하세요." />
            </th>
          </tr>
          <tr>
            <th>작성자</th>
            <th>
              <input class="form-control" type="text" name="writer" id="writer" placeholder="이름을 입력하세요." />
            </th>
          </tr>
          <tr>
            <th>내용</th>
            <th>
              <textarea class="form-control" name="content" id="content" rows="10" cols="50" placeholder="내용을 입력하세요."></textarea>
            </th>
          </tr>
          <tr>
            <th>암호</th>
            <th>
              <input class="form-control" type="password" name="pw" id="pw" placeholder="암호를 입력하세요." />
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
          <button class="btn btn-jungho" type="submit">글쓰기</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho" type="button" onclick="window.location.reload()">
          다시쓰기</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxPath}/notice/listForm.do'">목록보기</button>
        </div>
      </div>
    </div>

  </form>
</section>
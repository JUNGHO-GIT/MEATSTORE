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
      <h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h1>
        <c:if test="${num == 0}">
          <h2 data-aos="fade-left" data-aos-delay="300">[글 쓰기]</h2>
        </c:if>
        <c:if test="${num != 0}">
          <h2 data-aos="fade-left" data-aos-delay="300">[답글 쓰기]</h2>
        </c:if>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
	<form name="insertForm" method="POST" enctype="multipart/form-data" action="${ctxPath}/board/insertPro.do" onsubmit="return boardCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div id="image_container" oninput="setThumbnail(event);" style="margin-bottom: 20px;">
        </div>
      </div>
    </div>
    <br/>
		<div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <tr>
            <th style="border-top: transparent;">제목</th>
            <th style="border-top: transparent;">
              <input class="form-control" type="text" name="subject" id="subject" placeholder="제목을 입력하세요." />
            </th>
          </tr>
          <tr>
            <th>이름</th>
            <th>
              <input class="form-control" type="text" name="writer" id="writer" placeholder="이름을 입력하세요." />
            </th>
          </tr>
          <tr>
            <th>암호</th>
            <th>
              <input class="form-control" type="password" name="pw" id="pw" placeholder="암호를 입력하세요." />
            </th>
          </tr>
          <tr>
            <th>내용</th>
            <th>
              <textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요."></textarea>
            </th>
          </tr>
          <tr>
            <th>파일</th>
            <th>
              <input class="form-control" type="file" name="imageFile" id="imageFile" onchange="setThumbnail(event);"/>
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
          <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxPath}/board/listForm.do'">목록보기</button>
          &nbsp;&nbsp;
        </div>
      </div>
    </div>

    <!-- hidden -->
    <input type="hidden" name="num" id="num" value="${num}" />
    <input type="hidden" name="views" id="views" value="0" />
    <input type="hidden" name="ref" id="ref" value="${ref}" />
    <input type="hidden" name="re_step" id="re_step" value="${re_step}" />
    <input type="hidden" name="re_indent" id="re_indent" value="${re_indent}" />

  </form>
</section>
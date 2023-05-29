<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />

<% request.setCharacterEncoding("UTF-8"); %>

<!-- header -->
<section class="section">
  <div class="jumbotron d-flex align-items-center">
    <div class="gradient"></div>
    <div class="container-fluid content">
      <h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[글 수정하기]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
	<form name="updateForm" method="POST" enctype="multipart/form-data" action="${ctxPath}/board/updatePro.do?pageNum=${pageNum}" onsubmit="return upPwCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div id="image_container" oninput="setThumbnail(event);" style="margin-bottom: 20px;">
          <c:if test="${dto.imageFile != null}">
            <img src="${imgsPath}/${dto.imageFile}" />
          </c:if>
          <c:if test="${dto.imageFile == null}">
            <img src="${imgsPath}/etc/noImage.png" />
          </c:if>
        </div>
      </div>
    </div>
    <hr class="red-line"/>
		<div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <tr>
            <th style="border-top: transparent;">제목</th>
            <th style="border-top: transparent;">
              <input class="form-control" type="text" name="subject" id="subject" value="${dto.subject}" />
            </th>
          </tr>
          <tr>
            <th>이름</th>
            <th>
              <input class="form-control" type="text" name="writer" id="writer" value="${dto.writer}" />
            </th>
          </tr>
          <tr>
            <th>내용</th>
            <th>
              <textarea class="form-control" name="content" id="content" style="height: 150px; resize: none; background-color:#ffffff;" >${dto.content}</textarea>
            </th>
          </tr>
          <tr>
            <th>암호</th>
            <th>
              <input class="form-control" type="password" name="pw" id="pw" />
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
        </div>
      </div>
    </div>

    <!-- hidden -->
    <input type="hidden" name="pw" id="pw" value="${dto.pw}" />
    <input type="hidden" name="num" id="num" value="${dto.num}" />

  </form>
</section>
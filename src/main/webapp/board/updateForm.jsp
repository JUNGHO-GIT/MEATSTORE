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
      <h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[글 수정하기]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section>
	<form name="updateForm" method="post" enctype="multipart/form-data" action="${ctxpath}/board/updatePro.do?pageNum=${pageNum}" onsubmit="return uppwCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div id="image_container" oninput="setThumbnail(event);" style="margin-bottom: 20px;">
          <c:if test="${dto.fileupload != null}">
            <img src="/${imgspath}/${dto.fileupload}" />
          </c:if>
          <c:if test="${dto.fileupload == null}">
            <img src="${ctxpath}/res/imgs/nofile.png" />
          </c:if>
        </div>
      </div>
    </div>
    <br />
		<div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <input type="hidden" name="pw" id="pw" value="${dto.pw}" />
        <input type="hidden" name="num" value="${dto.num}" />
        <table class="table table-borderless">
          <tr>
            <th>제목</th>
            <th>
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
              <textarea class="form-control" name="content" id="content">${dto.content}</textarea>
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
              <input class="form-control" type="file" name="fileupload" id="fileupload" onchange="setThumbnail(event);"/>
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
          <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/board/listForm.do'">목록보기</button>
        </div>
      </div>
    </div>

  </form>
</section>
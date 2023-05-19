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
      <h1 data-aos="fade-right" data-aos-delay="300">Notice</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[여러분들의 의견을 들려주세요]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section>
  <div class="row d-flex justify-content-center align-items-center">
    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
      <table class="table table-borderless">
        <tr>
          <th colspan="2" class="text-center">
            <h2>${dto.subject}</h2>
          </th>
        </tr>
        <tr>
          <th>글번호</th>
          <th>
            <input class="form-control" type="text" name="num" value="${dto.num}" readonly="readonly" />
          </th>
        </tr>
        <tr>
          <th>작성자</th>
          <th>
            <input class="form-control" type="text" name="writer" value="${dto.writer}" readonly="readonly" />
          </th>
        </tr>
        <tr>
          <th>작성일</th>
          <th>
            <input class="form-control" type="text" name="regdate" value="${dto.regdate}" readonly="readonly" />
          </th>
        </tr>
        <tr>
          <th>조회수</th>
          <th>
            <input class="form-control" type="text" name="views" value="${dto.views}" readonly="readonly" />
          </th>
        </tr>
        <tr>
          <th>글내용</th>
          <th>
            <textarea class="form-control" name="content" style="height: 300px; resize: none; background-color:#ffffff;" readonly="readonly">${dto.content}</textarea>
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
      <div class="btn btn-group d-flex justify-content-center align-items-center ms-4">
        <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/notice/updateForm.do?num=${num}&pageNum=${pageNum}'">글 수정</button>
        &nbsp;&nbsp;
        <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/notice/deleteForm.do?num=${num}&pageNum=${pageNum}'">글 삭제</button>
        <c:if test="${!empty sessionScope.adminid}">
          <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/notice/insertForm.do?num=${num}&pageNum=${pageNum}&ref=${dto.ref}&re_step=${dto.re_step}&re_indent=${dto.re_indent}'">답글 작성</button>
        </c:if>
        &nbsp;&nbsp;
        <button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/notice/listForm.do?pageNum=${pageNum}'">리스트</button>
      </div>
    </div>
  </div>
</section>
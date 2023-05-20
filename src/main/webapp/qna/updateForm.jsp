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
      <h1 data-aos="fade-right" data-aos-delay="300">QNA</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[글 수정]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section>
  <form name="updateForm" method="post" action="${ctxpath}/qna/updatePro.do?pageNum=${pageNum}" onSubmit="return qnaPwCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <input type="hidden" name="num" id="num" value="${dto.num}" />
          <tr>
            <th colspan="2" class="text-center">
              <h2>${dto.subject}</h2>
            </th>
          </tr>
          <tr>
            <th>작성자</th>
            <th>
              <input class="form-control" type="text" name="writer" value="${dto.writer}" readonly="readonly" id="writer" />
            </th>
          </tr>
          <tr>
            <th>작성일</th>
            <th>
              <input class="form-control" type="text" name="regDate" value="${dto.regDate}" readonly="readonly" id="regDate" />
            </th>
          </tr>
          <tr>
            <th>조회수</th>
            <th>
              <input class="form-control" type="text" name="views" value="${dto.views}" readonly="readonly" id="views" />
            </th>
          </tr>
          <tr>
            <th>제목</th>
            <th>
              <input class="form-control" type="text" name="subject" value="${dto.subject}" id="subject" placeholder="제목을 입력하세요." />
            </th>
          </tr>
          <tr>
            <th>내용</th>
            <th>
              <textarea class="form-control" name="content" id="content" rows="10" placeholder="내용을 입력하세요.">${dto.content}</textarea>
            </th>
          </tr>
          <tr>
            <th>암호</th>
            <th>
              <input class="form-control" type="password" name="pw" id="pw" size="20" placeholder="암호를 입력하세요." />
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
          <button class="btn btn-jungho" type="submit">글쓰기</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho" type="button" onclick="window.location.reload()">
          초기화</button>
          &nbsp;&nbsp;
          <button class="btn btn-secondary" type="button" onclick="window.location.href='${ctxpath}/qna/listForm.do?pageNum=${pageNum}'">취소</button>
        </div>
      </div>
    </div>

  </form>
</section>
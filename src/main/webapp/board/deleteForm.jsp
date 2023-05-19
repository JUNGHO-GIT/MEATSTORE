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
      <h2 data-aos="fade-left" data-aos-delay="300">[ 글 삭제 ]</h2>
    </div>
  </div>
</section>


<!-- section -->
<section>
  <form name="delForm" method="post" enctype="multipart/form-data" action="${ctxpath}/board/deletePro.do?pageNum=${pageNum}" onsubmit="return delpwCheck()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <tr>
            <th>암호</th>
            <th>
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
          <button class="btn btn-jungho" type="button" onClick="location='${ctxpath}/board/listForm.do?pageNum=${pageNum}'">리스트</button>
          &nbsp;&nbsp;
        </div>
      </div>
    </div>

  </form>
</section>
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
      <h1 data-aos="fade-right" data-aos-delay="300">상품등록 </h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[관리자]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
  <div class="row d-flex justify-content-center align-items-center">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
      <form method="POST" action="${ctxPath}/product/insertPro.do?flag=insert"
      enctype="multipart/form-data" onSubmit="return productCheck()">
        <input type="hidden" name="num" value="${num}" />
        <input type="hidden" name="ref" value="${ref}" />
        <input type="hidden" name="re_step" value="${re_step}" />
        <input type="hidden" name="re_indent" value="${re_indent}" />
        <div class="form-group">
          <input class="form-control" type="text" name="name" id="name" placeholder="상품명" required>
        </div>
        <div class="form-group">
          <input class="form-control" type="text" name="code" id="code" placeholder="상품코드" required>
        </div>
        <div class="form-group">
          <input class="form-control" type="text" name="price" id="price" placeholder="상품가격" required>
        </div>
        <div class="form-group">
          <textarea class="form-control" name="content" id="content" placeholder="설명"></textarea>
        </div>
        <div class="form-group">
          <input class="form-control" type="text" name="stock" id="stock" placeholder="상품수량 입고" required>
        </div>
        <div class="form-group">
          <input class="form-control" type="text" name="comp" id="comp" placeholder="회사" required>
        </div>
        <div class="form-group">
          <input class="form-control" type="file" name="imageFile" required>
        </div>
        <div class="btn btn-group">
          <button class="btn btn-jungho" type="submit">상품등록</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho"type="button" onclick="window.location.reload()">
          다시 입력</button>
          &nbsp;&nbsp;
        </div>
      </form>
    </div>
  </div>
</section>
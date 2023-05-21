<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<!-- header -->
<section class="section">
  <div class="jumbotron d-flex align-items-center">
    <div class="gradient"></div>
    <div class="container-fluid content">
      <h1 data-aos="fade-right" data-aos-delay="300">상품 정보</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[최고급 고기를 즐겨보세요.]</h2>
    </div>
  </div>
</section>

<!-- section -->
<section class="section">
  <form method="POST" action="${ctxPath}/cart/insertPro.do" enctype="multipart/form-data">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <img src="${uploadPath}/product/${dto.imageFile}" class="img-fluid mb-5 mt-5 sh-7 rd-1" alt="게시글 이미지" />
      </div>
    </div>
    <hr class="red-line"/>
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <tr>
            <th style="border-top: transparent;" colspan="2">
              <h2>${dto.name}</h2>
            </th>
          </tr>
          <tr>
            <th>상품코드</th>
            <th>
              <input type="text" name="code" id="code" class="form-control" value="${dto.code}" readonly />
            </th>
          </tr>
          <tr>
            <th>상품가격</th>
            <th>
              <input type="text" name="price" id="price" class="form-control" value="${dto.price}" readonly />
            </th>
          </tr>
          <tr>
            <th>제품수량</th>
            <th>
              <input type="text" name="stock" id="stock" class="form-control" value="${dto.stock}" readonly />
            </th>
          </tr>
          <tr>
            <th>등록날짜</th>
            <th>
              <input type="text" name="regDate" id="regDate" class="form-control" value="${dto.regDate}" readonly />
            </th>
          </tr>
          <tr>
            <th>제조회사</th>
            <th>
              <input type="text" name="comp" id="comp" class="form-control" value="${dto.comp}" readonly />
            </th>
          </tr>
          <tr>
            <th>주문수량</th>
            <th>
              <select name="quantity" class="custom-select">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </th>
          </tr>
        </table>
      </div>
    </div>
    <br />
    <br />

    <!-- hidden -->
    <input type="hidden" name="name" id="name" value="${dto.name}" />
    <input type="hidden" name="imageFile" id="imageFile" value="${dto.imageFile}" />
    <input type="hidden" name="stock" id="stock" value="${dto.stock}" />
    <input type="hidden" name="regDate" id="regDate" value="${dto.regDate}" />
    <input type="hidden" name="comp" id="comp" value="${dto.comp}" />
    <input type="hidden" name="num" id="num" value="${dto.num}" />
    <input type="hidden" name="id" id="id" value="${sessionScope.id}" />

    <!-- button -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div class="btn btn-group d-flex justify-content-center align-items-center ms-4">
          <button type="submit" id="submit_detail" class="btn btn-jungho">장바구니 담기</button>
          &nbsp;&nbsp;
          <button type="button" id="button_detail" class="btn btn-secondary" onclick="window.location.href='${ctxPath}/product/listForm.do'">취소</button>
          &nbsp;&nbsp;
          <input type="hidden" name="num" id="num" value="${dto.num}" />
          <input type="hidden" name="id" id="id" value="${sessionScope.id}" />
          <input type="hidden" name="state" value="1" />
        </div>
      </div>
    </div>

  </form>
</section>
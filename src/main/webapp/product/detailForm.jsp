<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
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
  <form method="post" action="${ctxpath}/cart/insertForm.do">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <img src="${cloudPath}/product/${dto.imageFile}" class="img-fluid mb-5 mt-5 sh-7 rd-1" alt="게시글 이미지" />
      </div>
    </div>
    <hr class="my-4" style="border-top: 2px solid #9B111E;" />
    <div class="row justify-content-center">
      <div class="col-md-6">
        <table class="table table-borderless">
          <tr>
            <th colspan="2" class="text-center">
              <h2>${dto.name}</h2>
            </td>
          </tr>
          <tr>
            <th>상품코드</td>
            <th>
              <input type="text" name="code" id="code" class="form-control" value="${dto.code}" readonly />
            </td>
          </tr>
          <tr>
            <th>상품가격</td>
            <th>
              <input type="text" name="price" id="price" class="form-control" value="${dto.price}원" readonly />
            </td>
          </tr>
          <tr>
            <th>제품수량</td>
            <th>
              <input type="text" name="stock" id="stock" class="form-control" value="${dto.stock}개" readonly />
            </td>
          </tr>
          <tr>
            <th>등록날짜</td>
            <th>
              <input type="text" name="regDate" id="regDate" class="form-control" value="${dto.regDate}" readonly />
            </td>
          </tr>
          <tr>
            <th>제조회사</td>
            <th>
              <input type="text" name="comp" id="comp" class="form-control" value="(주)${dto.comp}" readonly />
            </td>
          </tr>
          <tr>
            <th>주문수량</td>
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

    <!-- button -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div class="btn btn-group d-flex justify-content-center align-items-center ms-4">
          <button type="submit" id="submit_detail" class="btn btn-jungho">장바구니 담기</button>
          &nbsp;&nbsp;
          <button type="button" id="button_detail" class="btn btn-secondary" onclick="location='${ctxpath}/product/listForm.do'">취소</button>
          &nbsp;&nbsp;
          <input type="hidden" name="num" id="num" value="${dto.num}" />
          <input type="hidden" name="id" id="id" value="${sessionScope.id}" />
          <input type="hidden" name="state" value="1" />
        </div>
      </div>
    </div>

  </form>
</section>
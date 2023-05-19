<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

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
<section class="container">
  <form method="post" action="${ctxpath}/cart/insert.do">
    <div class="row justify-content-center">
      <div class="col-md-4 text-center">
        <img src="https://storage.googleapis.com/jungho-bucket/MEATSTORE/product/${dto.image}" class="img-fluid" />
      </div>
    </div>
    <hr class="my-4" style="border-top: 2px solid #9B111E;" />
    <div class="row justify-content-center">
      <div class="col-md-6">
        <table class="table table-borderless">
          <tr>
            <td colspan="2" class="text-center">
              <h2>${dto.name}</h2>
            </td>
          </tr>
          <tr>
            <td>상품코드</td>
            <td>
              <input type="text" name="code" id="code" class="form-control" value="${dto.code}" readonly />
            </td>
          </tr>
          <tr>
            <td>상품가격</td>
            <td>
              <input type="text" name="price" id="price" class="form-control" value="${dto.price}원" readonly />
            </td>
          </tr>
          <tr>
            <td>제품수량</td>
            <td>
              <input type="text" name="stock" id="stock" class="form-control" value="${dto.stock}개" readonly />
            </td>
          </tr>
          <tr>
            <td>등록날짜</td>
            <td>
              <input type="text" name="regdate" id="regdate" class="form-control" value="${dto.regdate}" readonly />
            </td>
          </tr>
          <tr>
            <td>제조회사</td>
            <td>
              <input type="text" name="comp" id="comp" class="form-control" value="(주)${dto.comp}" readonly />
            </td>
          </tr>
          <tr>
            <td>주문수량</td>
            <td>
              <select name="quantity" class="custom-select">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <button type="submit" id="submit_detail" class="btn btn-jungho">장바구니 담기</button>
              <button type="button" id="button_detail" class="btn btn-secondary" onClick="location='${ctxpath}/product/listForm.do'">취소</button>
              <input type="hidden" name="pro_no" id="pro_no" value="${dto.pro_no}" />
              <input type="hidden" name="id" id="id" value="${sessionScope.id}" />
              <input type="hidden" name="state" value="1" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </form>
</section>
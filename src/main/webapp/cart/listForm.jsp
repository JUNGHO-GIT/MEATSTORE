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
      <h1 data-aos="fade-right" data-aos-delay="300">장바구니</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[전체상품 ${count}개]</h2>
    </div>
  </div>
</section>

<!-- 글 x -->
<c:if test="${count==0}">
  <section class="empty-section"></section>
</c:if>

<!-- 글 o -->
<c:if test="${count>0}">
  <!-- section -->
  <section class="section">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-striped dataTable table-hover" style="border: 1px solid #dddddd;">
          <thead>
            <tr>
              <th style="width:100px;">번호</th>
              <th style="width:200px;">이미지</th>
              <th style="width:100px;">상품명</th>
              <th style="width:100px;">가격</th>
              <th style="width:100px;">수량</th>
              <th style="width:100px;">총가격</th>
              <th style="width:100px;">주문</th>
            </tr>
          </thead>
          <c:forEach var="dto" items="${list}">
            <tbody>
              <tr>
                <th class="jungho-center ft-8 fw-5">
                  <c:out value="${number}" />
                  <c:set var="number" value="${number-1}" />
                </th>
                <th class="jungho-center ft-8 fw-5">
                  <c:if test="${dto.imageFile!=null}">
                    <img src="${uploadPath}/cart/${dto.imageFile}" width="100" height="100"
                    class="sh-7 rd-1"/>
                  </c:if>
                  <c:if test="${dto.imageFile==null}">
                    <img src="${imgsPath}/etc/noImage.png" width="100" height="100"
                     class="sh-7 rd-1"/>
                  </c:if>
                </th>
                <th class="jungho-center ft-8 fw-5">
                  <c:out value="${dto.name}" />
                </th>
                <th class="jungho-center ft-8 fw-5">
                  <fmt:formatNumber value="${dto.price}" type="currency" currencySymbol="₩"/>
                </th>
                <th class="jungho-center ft-8 fw-5">
                  <c:out value="${dto.quantity}" />
                </th>
                <th class="jungho-center ft-8 fw-5">
                  <fmt:formatNumber value="${dto.price*dto.quantity}" type="currency" currencySymbol="₩"/>
                </th>
                <th class="jungho-center ft-8 fw-5">
                  <button class="btn btn-jungho" onclick="window.location.href='${ctxPath}/order/insertPro.do?code=${dto.code}&quantity=${dto.quantity}'">구매</button>
                </th>
              </tr>
            </tbody>
          </c:forEach>
        </table>
      </div>
    </div>
    <br />
    <br />

    <!-- button -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <c:if test="${count>0}">
          <c:if test="${endPage>pageCount}">
            <c:set var="endPage" value="${pageCount}" />
          </c:if>
          <div class="d-flex justify-content-center align-items-center">
            <c:if test="${startPage>10}">
              <button class="btn btn-jungho" onclick="window.location.href='${ctxPath}/cart/listForm.do?pageNum=${startPage-10}'">이전블럭</button>
            </c:if>
            &nbsp;&nbsp;
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
              <button class="btn btn-jungho mr-2" onclick="window.location.href='${ctxPath}/cart/listForm.do?pageNum=${i}'">${i}</button>
            </c:forEach>
            &nbsp;&nbsp;
            <c:if test="${endPage<pageCount}">
              <button class="btn btn-jungho" onclick="window.location.href='${ctxPath}/cart/listForm.do?pageNum=${endPage+1}'">다음블럭</button>
            </c:if>
          </div>
        </c:if>
      </div>
    </div>

  </section>
</c:if>
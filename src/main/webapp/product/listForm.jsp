<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

<!-- header -->
<section class="section">
  <div class="jumbotron d-flex align-items-center">
    <div class="gradient"></div>
    <c:if test="${sessionScope.adminid != null}">
      <div class="container-fluid content">
        <h1 data-aos="fade-right" data-aos-delay="300">상품목록</h1>
        <h2 data-aos="fade-left" data-aos-delay="300">[관리자]</h2>
        <button class="btn btn-junghp" onClick="location='${ctxpath}/admin/productInsertForm.do'">상품등록</button>
      </div>
    </c:if>
    <c:if test="${sessionScope.adminid == null}">
      <div class="container-fluid content">
        <h1 data-aos="fade-right" data-aos-delay="300">상품목록</h2>
        <h2 data-aos="fade-left" data-aos-delay="300">[최고급 고기를 즐겨보세요.]</h2>
      </div>
    </c:if>
  </div>
</section>

<!-- 글 x -->
<c:if test="${count==0}">
  <section class="empty-section"></section>
</c:if>

<!-- 글 o -->
<c:if test="${count>0}">
  <section class="section">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-10 col-lg-10 col-md-10 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-striped dataTable table-hover" style="border: 1px solid #dddddd;">
          <thead>
            <tr>
              <th style="width:200px;">상품 이미지</th>
              <th style="width:200px;">상품명</th>
              <th style="width:100px;">상품 가격</th>
              <th style="width:100px;">상품 재고</th>
              <th style="width:100px;">상세보기</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="dto" items="${list}">
              <tr>
                <th class="jungho-center ft-8">
                  <c:if test="${dto.image != null}">
                    <img src="${cloudPath}/product/${dto.image}" width="200" height="200" class="sh-10 rd-1" />
                  </c:if>
                  <c:if test="${dto.image == null}">
                    <img src="${ctxpath}/res/imgs/nofile.jpg" width="200" height="200"
                    class="sh-10 rd-1" />
                  </c:if>
                </th>
                <th class="jungho-center ft-8">
                  ${dto.name}
                </th>
                <th class="jungho-center ft-8">
                  <fmt:formatNumber value="${dto.price}" type="currency" currencyCode="KRW" maxFractionDigits="0" />
                </th>
                <th class="jungho-center ft-8">
                  ${dto.stock}
                </td>
                <th class="jungho-center ft-8">
                  <button class="btn" style="background-color: #760d17; color: #ffffff;" onClick="location='${ctxpath}/product/detail.do?code=${dto.code}'">정보보기</button>
                </th>
              </tr>
            </c:forEach>
          </tbody>
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
              <button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/product/listForm.do?pageNum=${startPage-10}'">이전블럭</button>
            </c:if>
            &nbsp;&nbsp;
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
              <button class="btn btn-jungho mr-2" onclick="window.location.href='${ctxpath}/product/listForm.do?pageNum=${i}'">${i}</button>
            </c:forEach>
            &nbsp;&nbsp;
            <c:if test="${endPage<pageCount}">
              <button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/product/listForm.do?pageNum=${endPage+1}'">다음블럭</button>
            </c:if>
          </div>
        </c:if>
      </div>
    </div>

  </section>
</c:if>
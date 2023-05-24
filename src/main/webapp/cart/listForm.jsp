<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<!-- delete script -->
<script>
  function deleteSelected() {
    const checkboxes = document.querySelectorAll("input[type=checkbox]");
    let codes = [];

    for (let i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        codes.push(checkboxes[i].value);
      }
    }
    if (codes.length == 0) {
      alert("삭제할 상품을 선택해주세요.");
      return false;
    }
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "${ctxPath}/cart/deletePro.do", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("codes=" + codes.join(","));
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        alert("삭제되었습니다.");
        window.location.reload();
      }
    }
  }
</script>

<!-- orders script -->
<script>
  function orderSelected() {
    const checkboxes = document.querySelectorAll("input[type=checkbox]");
    let codes = [];

    for (let i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        codes.push(checkboxes[i].value);
      }
    }
    if (codes.length == 0) {
      alert("주문할 상품을 선택해주세요.");
      return false;
    }
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "${ctxPath}/orders/insertPro.do", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("codes=" + codes.join(","));
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        alert("주문이 완료되었습니다.");
        window.location.reload();
      }
    }
  }
</script>

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
<c:if test="${count == 0}">
  <section class="empty-section"></section>
</c:if>

<!-- 글 o -->
<c:if test="${count > 0}">
  <!-- section -->
  <section class="section">
    <form action="${ctxPath}/orders/insertPro.do" method="post">
      <div class="row d-flex justify-content-center align-items-center">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
          <table id="productTable" class="table table-striped dataTable table-hover" style="border: 1px solid #dddddd;">
            <thead>
              <tr>
                <th style="width:10px;"></th>
                <th style="width:200px;">이미지</th>
                <th style="width:300px;">상품명</th>
                <th style="width:100px;">가격</th>
                <th style="width:100px;">수량</th>
                <th style="width:100px;">총가격</th>
              </tr>
            </thead>
            <c:forEach var="dto" items="${list}">
              <tbody>
                <tr>
                  <th class="jungho-center ft-8 fw-5">
                    <input class="productCheckbox" type="checkbox" id="code" name="code" value="${dto.code}" />
                  </th>
                  <th class="jungho-center ft-8 fw-5">
                    <c:if test="${dto.imageFile!=null}">
                      <img src="${uploadPath}/cart/${dto.imageFile}" id="imageFile" name="imageFile"  width="100" height="100" class="sh-7 rd-1"/>
                    </c:if>
                    <c:if test="${dto.imageFile==null}">
                      <img src="${imgsPath}/etc/noImage.png" id="imageFile" name="imageFile"  width="100" height="100" class="sh-7 rd-1"/>
                    </c:if>
                  </th>
                  <th class="jungho-center ft-8 fw-5">
                    <c:out value="${dto.name}"/>
                  </th>
                  <th class="jungho-center ft-8 fw-5">
                    <fmt:formatNumber value="${dto.price}" type="currency" currencySymbol="₩" maxFractionDigits="0" />
                  </th>
                  <th class="jungho-center ft-8 fw-5">
                    <c:out value="${dto.quantity}"/>
                  </th>
                  <th class="jungho-center ft-8 fw-5">
                    <fmt:formatNumber value="${dto.price*dto.quantity}" type="currency" currencySymbol="₩" maxFractionDigits="0"/>
                  </th>
                </tr>
              </tbody>
              <c:set var="totalPrice" value="${totalPrice + dto.price*dto.quantity}" />
            </c:forEach>
            <tfoot>
              <tr>
                <th colspan="2" class="jungho-center ft-8 fw-5">
                  <button type="button" id="deleteButton" class="btn btn-jungho" onclick="deleteSelected()">선택삭제</button>
                </th>
                <th colspan="1" class="jungho-center ft-8 fw-5">총금액</th>
                <th colspan="2" id="totalPrice" class="jungho-center ft-10 fw-8">
                  <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₩" maxFractionDigits="0"/>
                </th>
                <th colspan="2" class="jungho-center ft-8 fw-5">
                  <button type="button" id="orderButton" class="btn btn-jungho" onclick="return deprecated(event)">주문하기</button>
                </th>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
      <br />
      <br />

      <!-- hidden -->
      <input type="hidden" id="num" name="num" value="${num}" />
      <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />
      <input type="hidden" id="id" name="id" value="${sessionScope.id}" />

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

    </form>
  </section>
</c:if>
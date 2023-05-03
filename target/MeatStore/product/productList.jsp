<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<c:if test="${!empty sessionScope.adminid}">
					<div class="container-fluid content">
						<h1 data-aos="fade-right" data-aos-delay="300">상품목록</h2>
						<h2 data-aos="fade-left" data-aos-delay="300">[상품을 준비중입니다]</h2>
						<button class="btn btn-junghp" onClick="location='${ctxpath}/admin/productInsertForm.do'">상품등록</button>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.adminid}">
					<div class="container-fluid content">
						<h1 data-aos="fade-right" data-aos-delay="300">상품목록</h2>
						<h2 data-aos="fade-left" data-aos-delay="300">[상품을 준비중입니다]</h2>
					</div>
				</c:if>
			</div>
		</section>
		<!-- product x -------------------------------------------------------------------------------->
		<c:if test="${empty list}">
			<section class="empty-section"></section>
		</c:if>
		<!-- product o -------------------------------------------------------------------------------->
		<c:if test="${!empty list}">
			<section class="section">
        <table class="dataTable">
          <c:if test="${!empty sessionScope.adminid}">
            <tr>
              <td colspan="6" align="right">
                <a href="${ctxpath}/admin/productInsertForm.do">상품등록</a>
              </td>
            </tr>
          </c:if>
          <tr id="list">
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
            <th>제품수량</th>
            <th>제품정보</th>
          </tr>
          <c:forEach var="dto" items="${list2}">
            <tr align="center">
              <td>
                <img src="${ctxpath}/res/imgs/${dto.image}" width="120px" height="110px" />
              </td>
              <td>${dto.name}</td>
              <td>${dto.price}</td>
              <td>${dto.stock}</td>
              <td align="center">
                <input type="button" value="정보보기" onClick="location='${ctxpath}/product/productDetail.do?code=${dto.code}'" />
              </td>
            </tr>
          </c:forEach>
        </table>
        <table class="count_block">
          <tr>
            <td align="center">
              <c:if test="${count>0}">
                <c:if test="${endPage>pageCount}">
                  <c:set var="endPage" value="${pageCount}" />
                </c:if>
                <c:if test="${startPage>10}">
                  <a href="${ctxpath}/product/productList.do?pageNum=${startPage-10}">[이전블럭]</a>
                </c:if>
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <a href="${ctxpath}/product/productList.do?pageNum=${i}">[${i}]</a>
                </c:forEach>
                <c:if test="${endPage<pageCount}">
                  <a href="${ctxpath}/product/productList.do?pageNum=${startPage+10}">[다음블럭]</a>
                </c:if>
              </c:if>
            </td>
          </tr>
        </table>
      </section>
		</c:if>

	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Hashtable" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="cartDAO" class="dao.CartDAO" scope="session" />

<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">장바구니</h2>
						<h2 data-aos="fade-left" data-aos-delay="300">[전체상품 : ${hcart.size()} ]</h2>
				</div>
			</div>
		</section>
		<!-- 상품 x -->
		<c:if test="${empty sessionScope.id}">
			<script>
				alert("로그인 후 이용해주세요");
				setTimeout(function() {
					window.location.href = "${ctxpath}/member/loginForm.do";
				}, 100);
			</script>
		</c:if>
		<!-- 상품 o -->
		<c:if test="${!empty sessionScope.id}">
			<!-- section -->
			<section class="section">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
						<table class="table table-striped dataTable table-hover" style="border: 1px solid #dddddd;">
							<thead>
								<tr>
									<th>제품</th>
									<th>수량</th>
									<th>가격</th>
									<th>수정/삭제</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="entry" items="${hcart}">
                  <form method="POST" action="${ctxpath}/order/insert.do">
                    <input type="hidden" name="num" value="${productDTO.num}">
                    <input type="hidden" name="flag">
                    <input type="hidden" name="state" value="1">
                    <tr>
                      <th>${productDTO.name}</td>
                      <th>
                        <input type="text" name="quantity" id="quantity" value="${orderDTO.quantity}" size="5">
                      </td>
                      <th>${subTotal}</td>
                      <th>
                        <input type="button" value="장바구니 수정" onclick="cartUpdate(this.form);">
                        <input type="button" value="장바구니 삭제" onclick="cartDelete(this.form);">
                        <input type="submit" value="주문하기">
                      </td>
                      <th>
                        <a href="javaScript:productDetail('${productDTO.code}')">상세보기</a>
                      </td>
                    </tr>
                  </form>
                </c:forEach>
								<tr>
									<th colspan="4" align="right">
										총 금액:
									</td>
									<th align="center">
										<a href="${ctxpath}/order/insert.do">주문하기</a>
									</td>
								</tr>
							</tbody>
						</table>
						<form name="detail" method="post" action="${ctxpath}/product/detailForm.do">
							<input type="hidden" name="code">
						</form>
					</div>
				</div>
			</section>
		</c:if>

	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.concurrent.ConcurrentHashMap" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cartDAO" class="dao.CartDAO" scope="session" />

<!DOCTYPE html>
<html lang="en, ko">

	<body>
		<%
            OrderListDTO orderListDTO = null;
            ProductDTO productDTO = null;
            ProductDAO productDAO = null;
            ConcurrentHashMap<Integer, OrderListDTO> hcart = (ConcurrentHashMap<Integer, OrderListDTO>) session.getAttribute("hcart");
            productDAO = ProductDAO.getInstance();
        %>
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
								<c:set var="totalPrice" value="0" />
								<c:forEach items="${cartDAO.getCartList()}" var="cartItem">
									<c:set var="productDTO" value="${productDAO.getProduct(cartItem.value.pro_no)}" />
									<c:set var="price" value="${productDTO.price}" />
									<c:set var="quantity" value="${cartItem.value.getIntQuantity()}" />
									<c:set var="subTotal" value="${price * quantity}" />
									<c:set var="totalPrice" value="${totalPrice + subTotal}" />
									<form method="post" action="detail.do">
										<input type="hidden" name="pro_no" value="${productDTO.pro_no}">
										<input type="hidden" name="flag">
										<input type="hidden" name="state" value="1">
										<tr>
											<td>${productDTO.name}</td>
											<td>
												<input type="text" name="quantity" id="quantity" value="${cartItem.value.quantity}" size="5">
											</td>
											<td>${subTotal}</td>
											<td>
												<input type="button" class="btn btn-primary" value="장바구니 수정" onClick="javaScript:cartUpdate(this.form)">
												<input type="button" class="btn btn-danger" value="장바구니 삭제" onClick="javaScript:cartDelete(this.form)">
											</td>
											<td>
												<a href="javaScript:productDetail('${productDTO.code}')">상세보기</a>
											</td>
										</tr>
									</form>
								</c:forEach>
								<tr>
									<td colspan="4" align="right">
										총 금액: ${totalPrice}
									</td>
									<td align="center">
										<button class="btn btn-jungho" onclick="location.href='${ctxpath}/shop/detail.do'">주문하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</c:if>

	</body>
</html>
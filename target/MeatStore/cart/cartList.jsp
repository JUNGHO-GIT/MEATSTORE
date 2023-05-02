<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="shop.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<jsp:useBean id="cartMgr" class="shop.CartMgr" scope="session" />

<!DOCTYPE html>
<html lang="en, ko">

	<body>
		<%
			OrderDTO orderDTO = null;
			ProductDTO productDTO = null;
			ProductDAO productDAO = null;
			Hashtable<String, OrderDTO> hcart = null;
			productDAO = ProductDAO.getInstance();
		%>

    <!-- 상품 x -->
		<c:if test="${empty sessionScope.id }">
			<meta http-equiv="Refresh" content="0;url=/member/loginForm.do">
		</c:if>

    <!-- 상품 o -->
		<c:if test="${!empty sessionScope.id }">
      <!-- header -->
      <section class="section">
      	<div class="jumbotron d-flex align-items-center">
      		<div class="gradient"></div>
      		<div class="container-fluid content">
      			<h1 data-aos="fade-right" data-aos-delay="300"> 장바구니 </h1>
      			<h2 data-aos="fade-left" data-aos-delay="300"> [전체상품 : ${hcart.size()} ] </h2>
      		</div>
      	</div>
      </section>
			<table align="center" class="dataTable">
				<tr>
					<td align="center">
						<table width="1000">
							<tr id="list">
								<td>제품</td>
								<td>수량</td>
								<td>가격</td>
								<td>수정/삭제</td>
								<td>조회</td>
							</tr>
							<%
								int totalPrice = 0;
								hcart = cartMgr.getCartList();
							%>
							<c:choose>
								<c:when test="${hcart.size() == 0}">
									<tr>
										<td align=center colspan='5'>장바구니 내용이 비어 있습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td align=center colspan='5'>장바구니에 들어있는 상품 목록</td>
									</tr>
									<%
										Enumeration<String> hcartKeys = hcart.keys();
										while (hcartKeys.hasMoreElements()) {
											orderDTO = hcart.get(hcartKeys.nextElement());
											productDTO = productDAO.getProduct(orderDTO.getPro_no());

											int price = productDTO.getPrice();
											int quantity = Integer.parseInt(orderDTO.getQuantity());
											int subTotal = price * quantity;
											totalPrice += subTotal;
									%>
									<form method="post" action="cartPro.do">
										<input type="hidden" name="pro_no" value="<%=productDTO.getPro_no()%>">
										<input type="hidden" name="state" value="1">
										<tr>
											<td><%=productDTO.getName()%></td>
											<td>
												<input type="text" name="quantity" id="quantity" value="<%=orderDTO.getQuantity()%>" size="5">
											</td>
											<td><%=subTotal%></td>
											<td>
												<input type="button" value="장바구니 수정" onClick="javaScript:cartUpdate(this.form)">
												<input type="button" value="장바구니 삭제" onClick="javaScript:cartDelete(this.form)">
											</td>
											<td>
												<a href="javaScript:productDetail('<%=productDTO.getCode() %>')">상세보기</a>
											</td>
										</tr>
									</form>
									<%
									}
								%>
									<tr>
										<td colspan="4" align="right">
											<%
											String totalPriceStr = String.format("%d", totalPrice);
										%>
											총 금액: <%=totalPriceStr%>
										</td>
										<td align="center">
											<a href="${ctxpath}/order/orderPro.do">주문하기</a>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</td>
				</tr>
			</table>
			<form name="detail" method="post" action="${ctxpath}/product/productDetail.do">
				<input type="hidden" name="code">
			</form>
		</c:if>

	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="shop.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  ProductDAO productDAO = ProductDAO.getInstance();
  OrderDAO orderDAO = new OrderDAO();
  String id = (String) session.getAttribute("id");
  if (id == null) {
    response.sendRedirect(request.getContextPath() + "/member/loginForm.do");
  }
%>

<!doctype html>
<html lang="ko">

	<head>
		<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
		<script src="${ctxpath}/res/js/script.js"></script>
		<link rel="stylesheet" href="${request.getContextPath()}/css/productList.css" />
	</head>

	<body>
		<c:if test="${id != null}">
			<table width="80%" class="dataTable">
				<tr>
					<td align="center">
						<font size="5" color="#9B111E">
							<b>${id}님의 구매 목록</b>
						</font>
					</td>
				</tr>
				<tr>
					<td align="center">
						<table width="90%">
							<tr>
								<td>주문번호</td>
								<td>제품</td>
								<td>주문수량</td>
								<td>주문날짜</td>
								<td>주문상태</td>
							</tr>
							<% Vector vec = orderDAO.getOrder(id); %>
							<c:if test="${vec.size() == 0}">
								<tr>
									<td colspan="5" align="center">구매목록이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${vec.size() > 0}">
								<%
                  for (int i = 0; i < vec.size(); i++) {
                    OrderDTO orderDTO = (OrderDTO) vec.get(i);
                    int pro_no = orderDTO.getPro_no();
                    ProductDTO productDTO = productDAO.getProduct(pro_no);
                  %>
								<tr>
									<td><%= orderDTO.getOrdno() %></td>
									<td>
										<a href="javascript:productDetail('<%=productDTO.getCode()%>')">
											<%= productDTO.getName() %></a>
									</td>
									<td><%= orderDTO.getQuantity() %></td>
									<td><%= orderDTO.getOrddate() %></td>
									<td>
										<% switch (Integer.parseInt(orderDTO.getState())) {
                      case 1:
                        out.println("접수중");
                        break;
                      case 2:
                        out.println("접수");
                        break;
                      case 3:
                        out.println("입금확인");
                        break;
                      case 4:
                        out.println("배송준비");
                        break;
                      case 5:
                        out.println("배송중");
                        break;
                      case 6:
                        out.println("배송완료");
                        break;
                      }
                    %>
									</td>
								</tr>
								<% } %>
							</c:if>
						</table>
					</td>
				</tr>
			</table>
			<form name="detail" action="${request.getContextPath()}/product/productDetail.do">
				<input type="hidden" name="code" />
			</form>
		</c:if>

	</body>
</html>
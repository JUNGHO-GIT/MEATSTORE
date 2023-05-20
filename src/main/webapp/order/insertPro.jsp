<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="hcart" value="${cartDAO.list}" />
<c:set var="orderResult" value="" />
<c:set var="loopFinished" value="false" />
<jsp:useBean id="cartDAO" class="dao.CartDAO" scope="session"></jsp:useBean>

<!-- 1. 장바구니 o -->
<c:if test="${not empty hcart}">
	<c:forEach var="orderDTO" items="${hcart}" varStatus="loopStatus">
		<c:if test="${!loopFinished}">
			<c:set var="tempResult" value="${ProductDAO.getInstance().processOrder(orderDTO)}" />
			<c:choose>
				<c:when test="${tempResult == 'noItem'}">
					<c:set var="orderResult" value="noAmount" />
					<c:set var="loopFinished" value="true" />
				</c:when>
				<c:otherwise>
					<c:set var="orderResult" value="${orderResult}${tempResult}" />
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
</c:if>

<!-- 2. 장바구니 x -->
<c:if test="${empty hcart}">
	<script>
		alert("장바구니가 비어있습니다.");
    window.history.back();
	</script>
</c:if>

<!-- 3. 수량부족 -->
<c:if test="${orderResult == 'noAmount'}">
	<script>
		alert("수량이 부족합니다.");
    window.history.back();
	</script>
</c:if>

<!-- 4. 주문성공 -->
<c:if test="${orderResult != 'noAmount' and not empty hcart}">
	<script>
		alert("주문이 완료되었습니다.");
		window.location.href = "/order/listForm.do";
	</script>
</c:if>
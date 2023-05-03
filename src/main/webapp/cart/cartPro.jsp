<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<jsp:useBean id="cartDAO" class="dao.CartDAO" scope="session" />
<jsp:useBean id="orderListDTO" class="dto.OrderListDTO">
	<jsp:setProperty name="orderListDTO" property="*" />
</jsp:useBean>
<c:set var="state" value="${param.state}" />
<c:set var="flag" value="${param.flag}" />
<c:choose>
	<c:when test="${empty sessionScope.id}">
		<script>
			alert("로그인 후 이용해 주세요");
			setTimeout(function() {
				window.location.href = "${ctxpath}/member/loginForm.do";
			}, 100);
		</script>
	</c:when>
	<c:otherwise>
		<c:set var="id" value="${sessionScope.id}" />
		<c:choose>
			<c:when test="${empty flag}">
				<script>
					alert("장바구니에 담았습니다");
					setTimeout(function() {
						window.location.href = "${ctxpath}/cart/list.do";
					}, 100);
				</script>
			</c:when>
			<c:when test="${flag eq 'update'}">
				<c:set target="${orderListDTO}" property="userid" value="${id}" />
				<c:set var="result" value="${cartDAO.updateCart(orderListDTO)}" />
				<script>
					alert("장바구니 내용이 수정 되었습니다");
					setTimeout(function() {
						window.location.href = "${ctxpath}/cart/list.do";
					}, 100);
				</script>
			</c:when>
			<c:when test="${flag eq 'del'}">
				<c:set var="result" value="${cartDAO.deleteCart(orderListDTO)}" />
				<script>
					alert("장바구니 목록이 삭제되었습니다");
					setTimeout(function() {
						window.location.href = "${ctxpath}/cart/list.do";
					}, 100);
				</script>
			</c:when>
		</c:choose>
	</c:otherwise>
</c:choose>
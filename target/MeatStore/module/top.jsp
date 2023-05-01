<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<center>
	<a href="${ctxpath}/product/productList.do">
		<img src="${ctxpath}/res/imgs/productList.png" />
	</a>
	&nbsp;&nbsp;
	<a href="${ctxpath}/cart/cartList.do">
		<img src="${ctxpath}/res/imgs/cartList.png" />
	</a>
	&nbsp;&nbsp;
	<a href="${ctxpath}/order/orderList.do">
		<img src="${ctxpath}/res/imgs/orderList.png" />
	</a>
	&nbsp;&nbsp;
	<a href="${ctxpath}/notice/list.do">
		<img src="${ctxpath}/res/imgs/notice.png" />
	</a>
	&nbsp;&nbsp;
	<a href="${ctxpath}/board/list.do">
		<img src="${ctxpath}/res/imgs/board.png" />
	</a>
	&nbsp;&nbsp;
	<a href="${ctxpath}/qna/list.do">
		<img src="${ctxpath}/res/imgs/qna.png" />
	</a>
</center>
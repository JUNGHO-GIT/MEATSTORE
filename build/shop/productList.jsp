<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="${ctxpath}/css/productList_css.css">
</head>

<body>
	<c:if test="${empty list}">
	      <center><b>
	       	등록된 상품을 준비중입니다.
	      </b></center>
	      <c:if test="${!empty sessionScope.adminid}">
	<table>
		<tr align="right">
			<td>
			<a href="${ctxpath}/admin/productInsertForm.do">
			상품등록</a></td>
		</tr>
	</table>
	</c:if>
	</c:if>
	 
	<c:if test="${!empty list}">
	<h2>상품 목록</h2>
	
	<table  class = "dataTable">
	<c:if test="${!empty sessionScope.adminid}">
		<tr>
			<td colspan="6" align="right">
			<a href="${ctxpath}/admin/productInsertForm.do">
			상품등록</a></td>
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
		    <img src="${ctxpath}/imgs/${dto.image}" width="120px" height="110px">
		  </td>
		  <td>
		  	${dto.name}
		  </td>
		  <td>
		  	${dto.price}
		  </td>
		  <td>
		  	${dto.stock}
		  </td>
		  <td align="center">
		  <input type="button" value="정보보기" onClick="location='${ctxpath}/shop/productDetail.do?code=${dto.code}'">
		  </td>
		 </tr>
		</c:forEach>
	</table>
  </c:if>
  
  <table class="count_block">
		<tr>
			<td align="center">
				<%--에러 방지 --%>
				<c:if test="${count>0}">
				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				<%-- 이전 블럭 --%>
				<c:if test="${startPage>10}">
				<a href="${ctxpath}/shop/productList.do?pageNum=${startPage-10}">
				[이전블럭]
				</a>
				</c:if>
				<%--페이지 처리 --%>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="${ctxpath}/shop/productList.do?pageNum=${i}">
					[${i}]
					</a>
				</c:forEach>
				
				<%--다음블럭 --%>
				<c:if test="${endPage<pageCount}">
					<a href="${ctxpath}/shop/productList.do?pageNum=${startPage+10}">
					[다음블럭]
					</a>
				</c:if>
				
				</c:if><%--글이 존재하면 --%>
			</td>
		</tr>
	</table>
</body>
</html>
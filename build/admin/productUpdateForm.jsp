<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopdb.*"
    %>
<%@ include file="/header/header.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<table>
	  <tr>
	    <td>
	      <form method="post" action="productInsertPro.do?flag=update" encType="multipart/form-data">
	       <table>
	         <tr>
	           <td colspan="2" align="center">
	            <b>상품 수정</b>
	           </td>
	         </tr>
	         <tr>
	           <td>상품이름</td>
	           <td>
	           <input type="text" name="name" id="name"	size="50" value="${dto.name}">
	           <input type="hidden" name="pro_no" value="${dto.pro_no}">
	           </td>
	         </tr>
	         <tr>
				<td>상품코드</td>
				<td>
				<input type="text" name="code" id="code" value="${dto.code}">
				</td>
			 </tr>
						
			 <tr>
				<td>상품가격</td>
				<td>
				<input type="text" name="price" id="price" value="${dto.price}">
				</td>
			 </tr>
			 <tr>
				<td>상품설명</td>
				<td>
				<textarea name="detail" id="detail" rows="10" cols="50">${dto.detail}</textarea>
				</td>
			 </tr>
			 <tr>
				<td>상품입고 수량</td>
				<td>
				<input type="text" name="stock" id="stock" value="${dto.stock }">
				</td>	
			 </tr>
						
			 <tr>
				<td>상품이미지</td>
				<td><input type="file" name="image"></td>
			 </tr>
						
			 <tr>
				<td>제조회사</td>
				<td>
				<input type="text" name="comp" id="comp" value="${dto.comp}">
				</td>
			 </tr>
			 <tr>
				<td colspan="2" align="center">
				<input type="submit" value="상품수정">
				<input type="reset" value="다시입력">
				</td>
			 </tr>
	        </table> 
	      </form>
	    </td>
	  </tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<td align="center">
			  <form method="post" action="${ctxpath}/admin/productInsertPro.do?flag=insert"
			  encType="multipart/form-data" onSubmit="return productCheck()">
				<table border="1" align="center">
				  <tr>
				    <td colspan="2" align="center"><font size="5"><b>상품등록</b></font>
				    </td>
				  </tr>
				  
				  <tr>
					<td>상품이름</td>
					<td><input type="text" name="name" id="name" size="20"></td>
				  </tr>

				  <tr>
					<td>상품코드</td>
					<td><input type="text" name="code" id="code" size="20"></td>
				  </tr>
				  
				  <tr>
					<td>상품가격</td>
					<td><input type="text" name="price" id="price" size="20"></td>
				  </tr>

				  <tr>
					<td>설명</td>
					<td><textarea name="detail" id="detail" rows="10" cols="45"></textarea>
					</td>
				  </tr>

				  <tr>
					<td>상품수량 입고</td>
					<td><input type="text" name="stock" id="stock" size="10"></td>
				  </tr>

				  <tr>
					<td>상품이미지</td>
					<td><input type="file" name="image"></td>
				  </tr>
				  
				  <tr>
					<td>회사</td>
					<td><input type="text" name="comp" id="comp" size="20"></td>
				  </tr>

				  <tr>
					<td colspan="2" align="center">
					<input type="submit"value="상품등록"> 
					<input type="reset" value="다시 입력">
					</td>
				  </tr>
				</table>
			  </form>
			</td>
		</tr>
	</table>
</body>
</html>
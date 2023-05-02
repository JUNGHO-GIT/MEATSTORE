<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300"> 상품등록 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [관리자] </h2>
				</div>
			</div>
		</section>
		<section>
			<table border="1" align="center">
				<form method="post" action="${ctxpath}/admin/productInsertPro.do?flag=insert" enctype="multipart/form-data" onSubmit="return productCheck()">
					<tr>
						<td>상품이름</td>
						<td>
							<input type="text" name="name" id="name" size="20" />
						</td>
					</tr>
					<tr>
						<td>상품코드</td>
						<td>
							<input type="text" name="code" id="code" size="20" />
						</td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td>
							<input type="text" name="price" id="price" size="20" />
						</td>
					</tr>
					<tr>
						<td>설명</td>
						<td>
							<textarea name="detail" id="detail" rows="10" cols="45"></textarea>
						</td>
					</tr>
					<tr>
						<td>상품수량 입고</td>
						<td>
							<input type="text" name="stock" id="stock" size="10" />
						</td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td>
							<input type="file" name="image" />
						</td>
					</tr>
					<tr>
						<td>회사</td>
						<td>
							<input type="text" name="comp" id="comp" size="20" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="상품등록" />
							<input type="reset" value="다시 입력" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
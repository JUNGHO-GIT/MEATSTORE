<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="shop.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
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
					<h1 data-aos="fade-right" data-aos-delay="300"> 상품 수정 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [관리자] </h2>
				</div>
			</div>
		</section>
		<section class="section">
			<table>
				<form method="post" action="productInsertPro.do?flag=update" enctype="multipart/form-data">
					<tr>
						<td colspan="2" align="center">
							<b>상품 수정</b>
						</td>
					</tr>
					<tr>
						<td>상품이름</td>
						<td>
							<input type="text" name="name" id="name" size="50" value="${dto.name}" />
							<input type="hidden" name="pro_no" value="${dto.pro_no}" />
						</td>
					</tr>
					<tr>
						<td>상품코드</td>
						<td>
							<input type="text" name="code" id="code" value="${dto.code}" />
						</td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td>
							<input type="text" name="price" id="price" value="${dto.price}" />
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
							<input type="text" name="stock" id="stock" value="${dto.stock}" />
						</td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td>
							<input type="file" name="image" />
						</td>
					</tr>
					<tr>
						<td>제조회사</td>
						<td>
							<input type="text" name="comp" id="comp" value="${dto.comp}" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="상품수정" />
							<input type="reset" value="다시입력" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
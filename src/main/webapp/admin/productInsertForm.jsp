<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">상품등록 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[관리자]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<form method="post" action="${ctxpath}/admin/productInsertPro.do?flag=insert" enctype="multipart/form-data" onSubmit="return productCheck()">
						<div class="form-group">
							<input class="form-control" type="text" name="name" id="name" placeholder="상품명" required>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="code" id="code" placeholder="상품코드" required>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="price" id="price" placeholder="상품가격" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="detail" id="detail" rows="10" cols="45" placeholder="설명"></textarea>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="stock" id="stock" placeholder="상품수량 입고" required>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="comp" id="comp" placeholder="회사" required>
						</div>
						<div class="form-group">
							<input class="form-control" type="file" name="image" required>
						</div>
						<div class="btn btn-group">
							<button class="btn btn-jungho" type="submit">상품등록</button>
							&nbsp;&nbsp;
							<button class="btn btn-jungho" type="reset">다시 입력</button>
							&nbsp;&nbsp;
						</div>
					</form>
					</table>
        </div>
      </div>
		</section>

	</body>
</html>
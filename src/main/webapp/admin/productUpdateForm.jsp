<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">상품 수정</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[관리자]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<form name="insertForm" method="post" action="productInsertPro.do?flag=update" enctype="multipart/form-data">
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" type="text" name="name" id="name" size="50" value="${dto.name}" placeholder="상품이름" />
								<input type="hidden" name="pro_no" value="${dto.pro_no}" />
							</div>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="code" id="code" value="${dto.code}" placeholder="상품코드" />
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="price" id="price" value="${dto.price}" placeholder="상품가격" />
						</div>
						<div class="form-group">
							<textarea class="form-control" name="detail" id="detail" rows="10" cols="50" placeholder="상품설명">${dto.detail}</textarea>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="stock" id="stock" value="${dto.stock}" placeholder="상품입고 수량" />
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="comp" id="comp" value="${dto.comp}" placeholder="제조회사" />
						</div>
						<div class="form-group">
							<input class="form-control" type="file" name="image" />
						</div>
            <div class="btn btn-group">
              <button class="btn btn-jungho" type="submit">수정하기</button>
              <button class="btn btn-jungho" type="reset">다시쓰기</button>
            </div>
          </form>
        </div>
      </div>
    </section>

  </body>
</html>
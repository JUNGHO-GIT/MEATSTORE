<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<c:if test="${!empty sessionScope.adminid}">
					<div class="container-fluid content">
						<h1 data-aos="fade-right" data-aos-delay="300">상품목록</h2>
							<h2 data-aos="fade-left" data-aos-delay="300">[관리자]</h2>
							<button class="btn btn-junghp" onClick="location='${ctxpath}/admin/productInsertForm.do'">상품등록</button>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.adminid}">
					<div class="container-fluid content">
						<h1 data-aos="fade-right" data-aos-delay="300">상품목록</h2>
							<h2 data-aos="fade-left" data-aos-delay="300">[최고급 고기를 즐겨보세요.]</h2>
					</div>
				</c:if>
			</div>
		</section>
		<!-- product x -------------------------------------------------------------------------------->
		<c:if test="${empty list}">
			<section class="empty-section"></section>
		</c:if>
		<!-- product o -------------------------------------------------------------------------------->
		<c:if test="${!empty list}">
			<!-- section -->
			<section class="section">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
						<table class="table table-striped dataTable table-hover" style="border: 1px solid #dddddd;">
							<thead>
								<tr>
									<th scope="col">상품이미지</th>
									<th scope="col">상품명</th>
									<th scope="col">상품가격</th>
									<th scope="col">상품재고</th>
									<th scope="col">상품상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${list2}">
									<tr>
										<th>
											<img src="${cloudPath}/product/${dto.image}" width="200px" height="200px" style="border: 1px solid #dddddd;" />
										</th>
										<th>${dto.name}</th>
										<th>
											<fmt:formatNumber value="${dto.price}" type="currency" currencyCode="KRW" maxFractionDigits="0" />
										</th>
										<th>${dto.stock}</th>
										<th>
											<button class="btn" style="background-color: #760d17; color: #ffffff;" onClick="location='${ctxpath}/product/detail.do?code=${dto.code}'">정보보기</button>
										</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
						<c:if test="${count>0}">
							<c:if test="${endPage>pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>
							<div class="d-flex justify-content-center align-items-center">
								<c:if test="${startPage>10}">
									<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/product/list.do?pageNum=${startPage-10}'">이전블럭</button>
								</c:if>
								&nbsp;&nbsp;
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<button class="btn btn-jungho mr-2" onclick="window.location.href='${ctxpath}/product/list.do?pageNum=${i}'">${i}</button>
								</c:forEach>
								&nbsp;&nbsp;
								<c:if test="${endPage<pageCount}">
									<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/product/list.do?pageNum=${endPage+1}'">다음블럭</button>
								</c:if>
							</div>
						</c:if>
					</div>
				</div>
			</section>
		</c:if>

	</body>
</html>
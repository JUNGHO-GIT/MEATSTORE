<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="upload" />
<!--[Html]----------------------------------------------------------------------------------------->

<!doctype html>
<html lang="ko, en">
	<!-- body --------------------------------------------------------------------------------------->

	<body>
		<!-- header -->
		<section class="section-1">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300"> 자유게시판 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [등록된 글이 없습니다] </h2>
					<h2><button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/board/writeForm.do'" data-aos="fade-up" data-aos-delay="300"> 글쓰기 </button></h2>
				</div>
			</div>
		</section>
		<!-- 글 존재 X -------------------------------------------------------------------------------->
		<c:if test="${count == 0}">
			<section class="empty-section"></section>
		</c:if>
		<!-- 글 존재 O -------------------------------------------------------------------------------->
		<c:if test="${count > 0}">
			<!-- section -->
			<section class="blog">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 col-6 text-left" data-aos="fade-right" data-aos-delay="300">
							<h3> 당신을 표현해주세요! </h3>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 col-6 text-right" data-aos="fade-left" data-aos-delay="300">
							<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/board/writeForm.do'" type="submit"> 글쓰기 </button>
						</div>
					</div>
					<br />
					<!-- row -->
					<div class="row d-flex">
						<c:forEach var="dto" items="${list}">
							<!-- image -->
							<div class="col-xl-5 col-lg-5 col-md-5 col-sm-5 col-5" data-aos="fade-left" data-aos-delay="300">
								<figure class="figure">
									<c:if test="${dto.fileupload != null}">
										<img src="/${imgspath}/${dto.fileupload}" width="300" height="300" class="figure-img img-fluid" />
									</c:if>
									<c:if test="${dto.fileupload == null}">
										<img src="${ctxpath}/imgs/logo.png" width="300" height="300" class="figure-img img-fluid" />
									</c:if>
								</figure>
							</div>
							<!-- details -->
							<div class="col-xl-7 col-lg-7 col-md-7 col-sm-7 col-7" data-aos="fade-right" data-aos-delay="300">
								<div class="row">
									<div class="col-xl-5 col-lg-5 col-md-5 col-sm-5 col-xs-5 col-5">
										<h4>
											<a href="${ctxpath}/board/content.do?num=${dto.num}&pageNum=${currentPage}"> ${dto.subject}</a>
										</h4>
										<h5>${dto.content}</h5>
									</div>
									<div class="col-xl-5 col-lg-5 col-md-5 col-sm-5 col-xs-5 col-5">
										<div class="component-jungho1">
											<h6>
												<!-- writer -->
												<a id="buttons-jungho" type="button">
													<i class="fa fa-user" aria-hidden="true"></i>
													<c:out value="${dto.writer}" />
												</a>
												<br />
												<br />
												<!-- date -->
												<a id="buttons-jungho" type="button">
													<i class="fa fa-calendar" aria-hidden="true"></i>
													<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" />
												</a>
											</h6>
										</div>
									</div>
									<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2">
										<h6>
											<!-- button -->
											<a class="btn btn-success" href="${ctxpath}/board/content.do?num=${dto.num}&pageNum=${currentPage}"> + 더보기 </a>
										</h6>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- pagination -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
							<h6>
								<c:if test="${count > 0}">
									<c:if test="${endPage > pageCount}">
										<c:set var="endPage" value="${pageCount}" />
									</c:if>
									<c:if test="${startPage > 5}">
										<button class="btn btn-success" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${startPage - 5}'">
											<i class="fa fa-angle-left" aria-hidden="true"></i>
										</button>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<button class="btn btn-success" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${i}'"> &nbsp; ${i} &nbsp; </button>
									</c:forEach>
									<c:if test="${endPage < pageCount}">
										<button class="btn btn-success" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${startPage + 5}'">
											<i class="fa fa-angle-right" aria-hidden="true"></i>
										</button>
									</c:if>
								</c:if>
							</h6>
						</div>
					</div>
				</div>
			</section>
		</c:if>

	</body>
</html>
<!-- /html -->
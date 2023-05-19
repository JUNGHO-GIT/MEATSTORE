<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
		<!-- header -->
		<section class="section-1">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[전체글: ${count}]</h2>
					<h2>
						<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/board/insertForm.do'" data-aos="fade-up" data-aos-delay="300">글쓰기 </button>
					</h2>
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
			<section>
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
							<table class="table table-striped dataTable table-hover" style="border: 1px solid #dddddd;">
								<thead>
									<tr>
										<th>이미지</th>
										<th>제목</th>
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>더보기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}">
										<tr>
											<td>
												<c:if test="${dto.fileupload != null}">
													<img src="${cloudPath}/board/${dto.fileupload}" width="200px" height="200px" style="border: 1px solid #dddddd;" />
												</c:if>
												<c:if test="${dto.fileupload == null}">
													<img src="${ctxpath}/res/imgs/logo.png" width="100" height="100" class="figure-img img-fluid" />
												</c:if>
											</td>
											<td>
												<a href="${ctxpath}/board/detail.do?num=${dto.num}&pageNum=${currentPage}"> ${dto.subject}</a>
											</td>
											<td>${fn:substring(dto.content, 0, 20)}${fn:length(dto.content) > 20 ? '...' : ''}</td>
											<td>
												<i class="fa fa-user" aria-hidden="true"></i>
												<c:out value="${dto.writer}" />
											</td>
											<td>
												<i class="fa fa-calendar" aria-hidden="true"></i>
												<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" />
											</td>
											<td>
												<a class="btn btn-jungho" href="${ctxpath}/board/detail.do?num=${dto.num}&pageNum=${currentPage}"> + 더보기 </a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
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
										<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/board/listForm.do?pageNum=${startPage - 5}'">
											<i class="fa fa-angle-left" aria-hidden="true"></i>
										</button>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/board/listForm.do?pageNum=${i}'"> &nbsp; ${i} &nbsp; </button>
									</c:forEach>
									<c:if test="${endPage < pageCount}">
										<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/board/listForm.do?pageNum=${startPage + 5}'">
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
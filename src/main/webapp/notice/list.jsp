<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("utf-8"); %>
<% request.setCharacterEncoding("utf-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">공지 사항</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[등록된 글이 없습니다.]</h1>
						<c:if test="${!empty sessionScope.adminid}">
							<h2>
								<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/notice/writeForm.do'" data-aos="fade-up" data-aos-delay="300">글쓰기</button>
							</h2>
						</c:if>
				</div>
			</div>
		</section>
		<!-- 글 x -->
		<c:if test="${count==0}">
			<section class="empty-section"></section>
		</c:if>
		<!-- 글 o -->
		<c:if test="${count>0}">
			<!-- section -->
			<section class="section">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
						<table class="table table-striped dataTable" style="border: 1px solid #dddddd;">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${list}">
									<tr>
										<td id="list_td">
											<c:out value="${number}" />
											<c:set var="number" value="${number-1}" />
										</td>
										<td id="list_subject">
											<a href="${ctxpath}/notice/content.do?num=${dto.num}&pageNum=${currentPage}">
												${dto.title}</a>
											<c:if test="${dto.readcount>=10}">
												<img src="${ctxpath}/res/imgs/hot.gif" />
											</c:if>
										</td>
										<td id="list_td">${dto.writer}</td>
										<td id="list_td">
											<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" />
										</td>
										<td id="list_td">${dto.readcount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
        <br />
        <br />
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
						<div class="search_page d-flex justify-content-center align-items-center">
							<form method="post" name="search_list" action="${ctxpath}/notice/searchList.do" class="form-inline">
								<select name="keyword" class="form-control">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
								</select>
								<input type="text" name="search" id="search" class="form-control" />
								<input type="submit" value="검색" class="btn btn-jungho" />
							</form>
						</div>
					</div>
				</div>
        <br />
        <br />
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
						<c:if test="${count>0}">
							<c:if test="${endPage>pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>
							<div class="d-flex justify-content-center align-items-center">
								<c:if test="${startPage>10}">
									<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/notice/list.do?pageNum=${startPage-10}'">이전블럭</button>
								</c:if>
                &nbsp;&nbsp;
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<button class="btn btn-jungho mr-2" onclick="window.location.href='${ctxpath}/notice/list.do?pageNum=${i}'">{i}</button>
								</c:forEach>
                &nbsp;&nbsp;
								<c:if test="${endPage<pageCount}">
									<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/notice/list.do?pageNum=${endPage+1}'">다음블럭</button>
								</c:if>
							</div>
						</c:if>
					</div>
				</div>
			</section>
		</c:if>

	</body>
</html>
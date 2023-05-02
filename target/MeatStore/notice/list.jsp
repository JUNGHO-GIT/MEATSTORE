<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" /> <% request.setCharacterEncoding("utf-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300"> 공지 사항 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [등록된 글이 없습니다.] </h2>
					<h2><button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/notice/writeForm.do'" data-aos="fade-up" data-aos-delay="300">글쓰기</button></h2>
				</div>
			</div>
		</section>
		<!-- 글 x -->
		<c:if test="${count==0}">
			<section class="empty-section"></section>
		</c:if>
		<!-- 글 o -->
		<c:if test="${count>0}">
			<section class="section">
				<table class="dataTable">
					<c:if test="${!empty sessionScope.adminid}">
						<tr>
							<td colspan="6" align="right">
								<a href="${ctxpath}/notice/writeForm.do">글쓰기</a>
							</td>
						</tr>
					</c:if>
					<tr height="30" id="list_main_td">
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
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
									<img src="${ctxpath}/imgs/hot.gif" />
								</c:if>
							</td>
							<td id="list_td">${dto.writer}</td>
							<td id="list_td">
								<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" />
							</td>
							<td id="list_td">${dto.readcount}</td>
						</tr>
					</c:forEach>
				</table>
				<table class="search_page">
					<tr>
						<td>
							<form method="post" name="search_list" action="${ctxpath}/notice/searchList.do">
								<select name="keyword">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
								</select>
								<input type="text" name="search" id="search" />
								<input type="submit" value="검색" />
							</form>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td align="center">
							<c:if test="${count>0}">
								<c:if test="${endPage>pageCount}">
									<c:set var="endPage" value="${pageCount}" />
								</c:if>
								<c:if test="${startPage>10}">
									<a href="${ctxpath}/notice/list.do?pageNum=${startPage-10}">[이전블럭]</a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a href="${ctxpath}/notice/list.do?pageNum=${i}">[${i}]</a>
								</c:forEach>
								<c:if test="${endPage<pageCount}">
									<a href="${ctxpath}/notice/list.do?pageNum=${startPage+10}">[다음블럭]</a>
								</c:if>
							</c:if>
						</td>
					</tr>
				</table>
			</section>
		</c:if>

	</body>
</html>
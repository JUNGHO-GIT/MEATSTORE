<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/module/header.jsp" %>

<!doctype html>
<html lang="en, ko">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Insert title here</title>
		<link rel="stylesheet" href="${ctxpath}/css/meatStore_list.css" />
		<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
		<script src="check.js"></script>
	</head>

	<body>
		<h2>QnA (전체글 : ${count})</h2>
		<c:if test="${count ==0}">
			<tr>
				<td colspan="6" align="right">
					<a href="${ctxpath}/qna/writeForm.do">글쓰기</a>
				</td>
			</tr>
			<p>등록된 글이 없습니다.</p>
		</c:if>
		<c:if test="${count>0}">
			<table class="dataTable">
				<c:if test="${!empty sessionScope.id or !empty sessionScope.adminid}">
					<tr>
						<td colspan="6" align="right">
							<a href="${ctxpath}/qna/writeForm.do">글쓰기</a>
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
							<c:if test="${dto.re_step>0}">
								<img src="${ctxpath}/imgs/level.gif" width="${5*dto.re_step}" height="16" />
								<img src="${ctxpath}/imgs/re.gif" />
							</c:if>
							<c:if test="${dto.re_step==0}">
								<img src="${ctxpath}/imgs/level.gif" width="${5*dto.re_step}" height="16" />
							</c:if>
							<a href="${ctxpath}/qna/content.do?num=${dto.num}&pageNum=${currentPage}">
								${dto.subject}</a>
							<c:if test="${dto.views}=10">
								<img src="${ctxpath}/imgs/hot.gif" />
							</c:if>
						</td>
						<td id="list_td">${dto.writer}</td>
						<td id="list_td">
							<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" />
						</td>
						<td id="list_td">${dto.views}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<table class="search_page">
			<tr>
				<td>
					<form method="post" name="search_list" action="${ctxpath}/qna/searchList.do">
						<select name="keyword">
							<option value="subject">제목</option>
							<option value="writer">작성자</option>
						</select>
						<input type="text" name="search" id="search" />
						<input type="submit" value="검색" />
					</form>
				</td>
			</tr>
		</table>
		<%--블럭처리, 페이지 처리 --%>
		<table>
			<tr>
				<td align="center">
					<c:if test="${count>0}">
						<%--에러 방지용 --%>
						<c:if test="${endPage>pageCount}">
							<%--설명도윰, --%>
							<c:set var="endPage" value="${pageCount}" />
						</c:if>
						<%-- 이전 블럭 --%>
						<c:if test="${startPage>10}">
							<a href="${ctxpath}/qna/list.do?pageNum=${startPage-10}">[이전 블럭]</a>
						</c:if>
						<%-- 페이지 처리 --%>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="${ctxpath}/qna/list.do?pageNum=${i}">[${i}]</a>
						</c:forEach>
						<%-- 다음 블럭 --%>
						<c:if test="${endPage<pageCount}">
							<a href="${ctxpath}/qna/list.do?pageNum=${startPage+10}">[다음 블럭]</a>
						</c:if>
					</c:if>
				</td>
			</tr>
		</table>

	</body>
</html>
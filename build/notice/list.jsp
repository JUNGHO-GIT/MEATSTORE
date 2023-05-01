<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp"%>

<%--/notice/list.jsp --%>
<% 
request.setCharacterEncoding("utf-8");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css"
	href="${ctxpath}/css/meatStore_list.css">
<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="check.js"></script>


</head>
<body>

	<h2>MeatStore 공지사항 (전체글:${count})</h2>
	<h4>청창대육의 최신 소식을 전합니다.</h4>

	<c:if test="${count==0}">
			등록된 글이 없습니다.
	  <c:if test="${!empty sessionScope.adminid}">
		<table>
			<tr>
				<td colspan="6" align="right"><a
					href="${ctxpath}/notice/writeForm.do">글쓰기</a></td>
			</tr>
		</table>
	  </c:if>
	</c:if>

	<c:if test="${count>0}">
		<%--글이 있으면  --%>

		<table class="dataTable">
		  <c:if test="${!empty sessionScope.adminid}">
			<tr>
				<td colspan="6" align="right"><a
					href="${ctxpath}/notice/writeForm.do">글쓰기</a></td>
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
					<%-- 글 번호 --%>
					<td id="list_td"><c:out value="${number}" />
					 <c:set	var="number" value="${number-1}" /></td>

					<%-- 제목*클릭시 content.jsp로 이동* --%>
					<td id="list_subject">
						<!-- 글제목을 클릭하면 글 내용보기로 가기  --> <a
						href="${ctxpath}/notice/content.do?num=${dto.num}&pageNum=${currentPage}">
							${dto.title} </a> <!--조횟수 10번 이상 이면 hot.gif 표시  --> <c:if
							test="${dto.readcount>=10}">
							<img src="${ctxpath}/imgs/hot.gif">
						</c:if>
					</td>

					<%--작성자--%>
					<td id="list_td">${dto.writer}</td>



					<td id="list_td"><fmt:formatDate value="${dto.regdate}"
							pattern="yyyy-MM-dd" /></td>
					<td id="list_td">${dto.readcount}</td>
				</tr>
 			

			</c:forEach>
		 	 
		</table>	
	</c:if>
	<%--글이 존재 할 때-끝 --%>

	<%-- 검색페이지 --%>
	<table class="search_page">
		<tr>

			<td>
				<form method="post" name="search_list"
					action="${ctxpath}/notice/searchList.do">
					<select name="keyword">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select> <input type="text" name="search" id="search" /> <input
						type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
	<%------%>

	<%--블럭처리, 페이지 처리  --%>
	<table>
		<tr>
			<td align="center"><c:if test="${count>0}">
					<%--글이 있으면 --%>

					<%--에러방지 --%>
					<c:if test="${endPage>pageCount}">
						<c:set var="endPage" value="${pageCount}" />
					</c:if>

					<%--이전블럭 --%>
					<c:if test="${startPage>10}">
						<a href="${ctxpath}/notice/list.do?pageNum=${startPage-10}">
							[이전블럭] </a>
					</c:if>

					<%--페이지처리 --%>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${ctxpath}/notice/list.do?pageNum=${i}"> [${i}] </a>
					</c:forEach>

					<%--다음블럭 --%>
					<c:if test="${endPage<pageCount}">
						<a href="${ctxpath}/notice/list.do?pageNum=${startPage+10}">
							[다음블럭] </a>
					</c:if>

				</c:if></td>
		</tr>
	</table>
</body>
</html>
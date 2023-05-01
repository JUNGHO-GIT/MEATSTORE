<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/header/header.jsp"%>
<%--/notice/content.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 후에 css넣어야함 -->
<link rel="stylesheet" type="text/css" href="${ctxpath}/css/meatStore_content.css">
<script src="//code.jquery.com/jquery-3.6.1.min.js" ></script>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<h2>게시판</h2>
	<table class="contentTable">
		<tr>
			<td id="content_row">글 번호</td>
			<td>${dto.num }</td>
			<td id="content_row">조회수</td>
			<td>${dto.readcount }</td>
		</tr>
		
		<tr>
			<td id="content_row">작성자</td>
			<td>${dto.writer }</td>
			<td id="content_row">작성일</td>
			<td>${dto.regdate }</td>
		</tr>
		
		<tr>
			<td id="content_row">제목</td>
			<td colspan = "3">${dto.title}</td>
		</tr>

		<tr>
			<td id="content_row">내용</td>
			<td colspan="3" id="content_content"><pre>${dto.content }</pre></td>
		</tr>
		
		<tr>
			<td colspan="4" align="right">
			<c:if test="${!empty sessionScope.adminid }">
				<a href="${ctxpath}/notice/updateForm.do?num=${num}&pageNum=${pageNum}">글 수정</a>
				<a href="${ctxpath}/notice/deleteForm.do?num=${num}&pageNum=${pageNum}">글 삭제 </a>
			</c:if>
				 <a href="${ctxpath}/notice/list.do?pageNum=${pageNum}">[리스트]</a>
			</td>
		</tr>
	</table>
</body>
</html>
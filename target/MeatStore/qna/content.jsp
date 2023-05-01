<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!doctype html>
<html lang="en, ko">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Insert title here</title>
		<link rel="stylesheet" href="${ctxpath}/res/css/meatStore_content.css" />
		<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
		<script src="${ctxpath}/res/js/check.js"></script>
	</head>

	<body>
		<h2>QnA</h2>
		<table class="contentTable">
			<tr>
				<td id="content_row">글번호</td>
				<td>${dto.num }</td>
				<td id="content_row">조회수</td>
				<td>${dto.views}</td>
			</tr>
			<tr>
				<td id="content_row">작성자</td>
				<td>${dto.writer }</td>
				<td id="content_row">작성일</td>
				<td>${dto.regdate}</td>
			</tr>
			<tr>
				<td id="content_row">제목</td>
				<td colspan="4">${dto.subject}</td>
			</tr>
			<tr>
				<td id="content_row">내용</td>
				<td colspan="3" id="content_content">
					<pre>${dto.content}</pre>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<a href="${ctxpath}/qna/updateForm.do?num=
			${num}&pageNum=${pageNum}">
						글수정
					</a>
					<a href="${ctxpath}/qna/deleteForm.do?num=
			${num}&pageNum=${pageNum}">
						글삭제
					</a>
					<c:if test="${!empty sessionScope.adminid}">
						<a href="${ctxpath}/qna/writeForm.do?num=
			${num}&pageNum=${pageNum}&ref=${dto.ref}&re_step=${dto.re_step}&re_indent=${dto.re_indent}">
							답글 작성
						</a>
					</c:if>
					<a href="${ctxpath}/qna/list.do?pageNum=${pageNum}">리스트</a>
				</td>
			</tr>
		</table>

	</body>
</html>
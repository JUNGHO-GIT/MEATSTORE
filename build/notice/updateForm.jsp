<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/header/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 후에 css넣어야함 -->
<!-- <link rel="stylesheet" type="text/css" href=""> -->
<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
	function pwcheck() {
		if (document.updateForm.pw.value == "") {
			alert("암호는 필수 입력");
			document.updateForm.pw.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>글 수정</h2>

	<form name="updateForm" method="post"
		action="${ctxpath}/notice/updatePro.do?pageNum=${pageNum}"
		onSubmit="return pwcheck()">

		<table class="wid">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" id="wirter"
					value="${dto.writer}"> <input type="hidden" name="num"
					value="${dto.num}"></td>
			</tr>

			<tr>
				<td>글 제목</td>
				<td><input type="text" name="title" id="title" value="${dto.title}"></td>
			</tr>

			<tr>
				<td>글 내용</td>
				<td><textarea name="content" id="content" rows="10" cols="45">${dto.content}
				</textarea></td>
			</tr>

			<tr>
				<td>암호</td>
				<td><input type="password" name="pw" id="pw"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<input type="submit"	value="글 수정">
				<input type="reset" value="다시쓰기">
				 <input type="button" value="리스트"
					onClick="location='${ctxpath}/notice/list.do?pageNum=${pageNum}'">
				</td>
			</tr>

		</table>



	</form>
</body>
</html>
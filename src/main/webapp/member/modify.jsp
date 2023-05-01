<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/module/header.jsp" %>

<!doctype html>
<html lang="en, ko">

	<head></head>

	<body>
		<table>
			<tr>
				<td>
					<form name="update" method="post" action="${ctxpath}/member/updateForm.do">
						<input type="hidden" name="id" value="${sessionScope.id}" />
						<input type="submit" value="내정보수정" />
					</form>
				</td>
				<td>
					<form name="delForm" method="post" action="${ctxpath}/member/deleteForm.do">
						<input type="hidden" name="id" value="${sessionScope.id}" />
						<input type="submit" value="회원탈퇴" />
					</form>
				</td>
			</tr>
		</table>

	</body>
</html>
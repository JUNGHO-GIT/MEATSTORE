<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/module/header.jsp" %>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8" />
		<title>Document</title>
	</head>

	<body>

		<c:if test="${empty sessionScope.id && empty sessionScope.adminid}">
			<table border="0" valign="top">
				<tr>
					<td>
						<font size="2">
							<a href="${ctxpath}/member/loginForm.do">
								<img src="${ctxpath}/imgs/Login.png" />
							</a>
							<a href="${ctxpath}/member/inputForm.do">
								<img src="${ctxpath}/imgs/input.png" />
							</a>
						</font>
					</td>
				</tr>
			</table>
		</c:if>
		<%--로그인 했을 때--%>

		<c:if test="${!empty sessionScope.id}">
			<table border="0" align="right">
				<tr>
					<td align="right">
						${sessionScope.id}님 방문을 환영합니다.&nbsp;&nbsp;
						<form method="post" action="${ctxpath}/member/logOut.do">
							<input type="submit" value="로그아웃" />
							<input type="button" value="내정보수정"
								onClick="location.href='${ctxpath}/member/modify.do'" />
						</form>
					</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${!empty sessionScope.adminid}">
			<table border="0" align="right">
				<tr>
					<td align="right">
						${sessionScope.adminid}님 방문을 환영합니다&nbsp;&nbsp;
						<form method="post" action="${ctxpath}/member/logOut.do">
							<input type="submit" value="로그아웃" />
						</form>
					</td>
				</tr>
			</table>
		</c:if>

	</body>
</html>
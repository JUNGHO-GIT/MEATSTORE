<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<c:if test="${x == 1}">
			<script>
				alert("회원 탈퇴 되었습니다");
				setTimeout(function() {
					window.location.href="${ctxpath}/module/template.jsp";
				}, 100);
			</script>
			<% session.invalidate(); %>
		</c:if>
		<c:if test="${x == -1}">
			<script>
				alert("암호가 틀립니다");
				history.back();
			</script>
		</c:if>

  </body>
</html>
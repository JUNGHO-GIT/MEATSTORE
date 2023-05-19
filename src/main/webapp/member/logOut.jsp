<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

<!doctype html>
<html lang="en, ko">
	<body>

    <% session.invalidate(); %>
		<script>
			setTimeout(function() {
				window.location.href="${ctxpath}/index.jsp";
			}, 100);
		</script>

	</body>
</html>
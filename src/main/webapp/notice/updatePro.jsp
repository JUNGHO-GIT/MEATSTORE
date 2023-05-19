<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

<!doctype html>
<html lang="en, ko">

	<body>
		<c:if test="${x == 1}">
			<script>
				alert("수정이 완료되었습니다.");
				setTimeout(function() {
					window.location.href = "${ctxpath}/notice/listForm.do";
				}, 100);
			</script>
		</c:if>
		<c:if test="${x == -1}">
			<script>
				alert("암호가 다릅니다.");
				history.back();
			</script>
		</c:if>

	</body>
</html>
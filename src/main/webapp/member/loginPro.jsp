<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

<!doctype html>
<html lang="en, ko">
	<body>

		<c:if test="${x == 1}">
      <% session.setAttribute("id", (String)request.getAttribute("id")); %>
			<script>
				alert("로그인 되었습니다.");
				setTimeout(function() {
					window.location.href="${ctxpath}/index.jsp";
				}, 100);
			</script>
		</c:if>
		<c:if test="${x == 0}">
			<script>
				alert("암호가 틀립니다");
				history.back();
			</script>
		</c:if>
    <c:if test="${x == -1}">
      <script>
        alert("없는 ID 입니다");
        history.back();
      </script>
    </c:if>

	</body>
</html>
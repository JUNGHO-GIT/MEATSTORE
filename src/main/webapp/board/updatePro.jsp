<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="upload" />

<!-- [비밀번호 일치 O] -->
<c:if test="${checkparam == 1}">
  <script>
  	alert("수정이 완료되었습니다")
		setTimeout(function() {
		window.location.href = "/board/list.do";
		}, 500);
  </script>
</c:if>

<!-- [비밀번호 일치 X] -->
<c:if test="${checkparam == -1}">
	<script>
		alert("암호가 다릅니다");
		history.back();
	</script>
</c:if>
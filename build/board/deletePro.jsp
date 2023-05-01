<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<!-- [비밀번호 일치 O] -->
<c:if test="${checkparam == 1}">
	<script>
		alert("글삭제가 완료되었습니다")
		setTimeout(function() {
			location.href="${ctxpath}/board/list.do";
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
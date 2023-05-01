<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/header/header.jsp" %>
<%-- /qna/deletePro.jsp --%>

<c:if test="${x==1}">
	<meta http-equiv="Refresh" content="0;${ctxpath}/qna/list.do">
</c:if>

<c:if test="${x==-1}">
<script>
alert("틀린 암호입니다.");
history.back();
</script>
</c:if>
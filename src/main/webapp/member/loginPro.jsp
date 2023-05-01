<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/module/header.jsp" %>

<c:if test="${x==1}">
	<% session.setAttribute("id", (String)request.getAttribute("id")); %>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}/template/template.jsp" />
</c:if>

<c:if test="${x==0}">
	<script>
		alert("암호틀림");
		history.back();
	</script>
</c:if>

<c:if test="${x==-1}">
	<script>
		alert("없는 ID 입니다");
		history.back();
	</script>
</c:if>
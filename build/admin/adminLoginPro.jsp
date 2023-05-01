<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>


<c:if test="${x==1}">
<%
session.setAttribute("adminid", (String)request.getAttribute("adminid"));
session.setAttribute("adminpw",(String)request.getAttribute("adminpw"));
%>
<meta http-equiv="Refresh" content="0;url=${ctxpath}/template/template.jsp">
</c:if>

<c:if test="${x==-1}">
	<script>
	alert("암호틀림");
	history.back();	
	</script>
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<c:if test="${x == 1}">
	<% session.setAttribute("adminid", (String)request.getAttribute("adminid")); session.setAttribute("adminpw",(String)request.getAttribute("adminpw")); %>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}/module/template.jsp" />
</c:if>

<c:if test="${x == -1}">
	<script>
		alert("암호틀림");
		history.back();
	</script>
</c:if>
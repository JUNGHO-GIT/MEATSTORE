<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/header/header.jsp" %>

	<%--logout.jsp --%>
	
	<%
	session.invalidate();//세션 무효화
	%>
	
	<meta http-equiv="Refresh" content="0;url=${ctxpath}/template/template.jsp">
	
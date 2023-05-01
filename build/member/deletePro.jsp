<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/header/header.jsp" %>
<%--deletePro.jsp --%>




	<c:if test="${x==1}">
	<h3>회원 탈퇴 되었습니다</h3>
	<meta http-equiv="Refresh" content="2;url=${ctxpath}/template/template.jsp">
	<%
	session.invalidate();//세션 무효화
	%>
	</c:if>
	
	<c:if test="${x==-1}">
	<script>
	alert("암호가 틀립니다");
	history.back();
	</script>
	</c:if>

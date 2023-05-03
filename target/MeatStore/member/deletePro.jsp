<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>

<c:if test="${x == 1}">
	<h3>회원 탈퇴 되었습니다</h3>
	<meta http-equiv="Refresh" content="2;url=/home/template.jsp" />
	<% session.invalidate(); %>
</c:if>

<c:if test="${x == -1}">
	<script>
		alert("암호가 틀립니다");
		history.back();
	</script>
</c:if>
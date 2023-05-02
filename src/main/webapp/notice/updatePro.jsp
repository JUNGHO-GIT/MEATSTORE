<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("utf-8"); %>

<c:if test="${x==1}">
	<meta http-equiv="Refresh" content="0;url=${ctxpath}/notice/list.do" />
</c:if>

<c:if test="${x==-1}">
	<script>
		alert("암호가 틀립니다.");
		history.back();
	</script>
</c:if>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/header/header.jsp" %>
<%--/notice/deletePro.jsp --%>
<html>
<head>
<c:if test="${x==1 }">
<meta http-equiv="Refresh" content="0;url=${ctxpath}/notice/list.do">
<!-- 
<meta http-equiv="Refresh" content="0;url=${ctxpath}/notice/list.do?pageNum=${pageNum}"> 
2번글에 있는 게시글을 삭제 후, 1번으로 돌아가지 않아 위와같이 조치함.
 -->
</c:if>

<c:if test="${x==-1}">
	<script>
	alert("암호가 다릅니다.");
	history.back();
	</script>
</c:if>
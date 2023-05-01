<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ include file="/header/header.jsp" %>
    <%--loginPro.jsp --%>




<%--로그인 성공 --%>
<c:if test="${x==1}">
<%
session.setAttribute("id", (String)request.getAttribute("id"));//세션등록
%>
<meta http-equiv="Refresh" content="0;url=${ctxpath}/template/template.jsp">
</c:if>


<%--암호 틀림 --%>
<c:if test="${x==0}">
   <script>
   alert("암호틀림");
   history.back();
   </script>
</c:if>


<%--없는 ID--%>
<c:if test="${x==-1}">
<script>
alert("없는 ID 입니다");
history.back();
</script>
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.*" %> <%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />

<% request.setCharacterEncoding("UTF-8"); %>

<%
  String id = request.getParameter("id");
  MemberDAO dao = MemberDAO.getInstance();
  int checkParam = dao.confirmID(id);
%>

{"checkParam" : <%= checkParam %>}
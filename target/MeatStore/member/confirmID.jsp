<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>
<%
  String id = request.getParameter("id");
  MemberDAO dao = MemberDAO.getInstance();
  int x = dao.confirmID(id);
%>

{"x": <%= x %>}
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<script>
	alert("상품등록이 완료되었습니다.");
	setTimeout(function() {
		window.location.href = "${ctxpath}/product/listForm.do";
  }, 100);
</script>
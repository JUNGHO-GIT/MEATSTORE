<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<c:if test="${checkParam == 1}">
  <% session.setAttribute("adminId", (String)request.getAttribute("adminId")); %>
  <script>
    alert("로그인 되었습니다.");
    setTimeout(function() {
      window.location.href="${ctxPath}/index.jsp";
    }, 100);
  </script>
</c:if>

<c:if test="${checkParam == 0}">
  <script>
    alert("암호가 틀립니다");
    history.back();
  </script>
</c:if>

<c:if test="${checkParam == -1}">
  <script>
    alert("없는 ID 입니다");
    history.back();
  </script>
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>

<c:if test="${checkParam == 1}">
  <script>
    alert("삭제가 완료되었습니다.");
    setTimeout(function() {
      window.location.href = "${ctxPath}/qna/listForm.do";
    }, 100);
  </script>
</c:if>

<c:if test="${checkParam == -1}">
  <script>
    alert("암호가 다릅니다.");
    history.back();
  </script>
</c:if>
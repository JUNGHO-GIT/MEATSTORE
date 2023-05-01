<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!doctype html>
<html lang="en, ko">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>template</title>
		<link rel="stylesheet" href="${ctxpath}/res/css/template.css" />
	</head>

	<body>
		<table width="100%" height="80%">
			<tr class="menulist">
				<td width="10%" valign="top">
					<a href="${ctxpath}/template/template.jsp">
						<img src="${ctxpath}/res/imgs/logo.png" width="150px" height="150px" />
					</a>
				</td>
				<td align="center">
					<%@ include file="/module/top.jsp" %>
					<br />
				</td>
				<td align="right">
          <%@ include file="/member/main.jsp" %>
        </td>
			</tr>
			<tr valign="top">
				<td align="center" colspan="3">
					<c:if test="${CONTENT!=null && CONTENT!='/template/template.jsp'}">
						<jsp:include page="${CONTENT}" flush="false" />
					</c:if>
					<c:if test="${CONTENT==null}">
						<div class="div1"></div>
						<video autoplay loop muted>
							<source src="${ctxpath}/res/imgs/meat_video.mp4" type="video/mp4" />
						</video>
						<img id="img" src="${ctxpath}/res/imgs/logo.png" />
					</c:if>
				</td>
			</tr>
			<tr height="10%" valign="bottom">
				<td colspan="3" align="center">
					<jsp:include page="/module/bottom.jsp" flush="false" />
				</td>
			</tr>
		</table>

	</body>
</html>
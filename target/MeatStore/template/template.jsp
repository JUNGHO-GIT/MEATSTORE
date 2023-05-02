<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!doctype html>
<html lang="en, ko">

	<head>
		<!-- meta -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800">
		<link rel="stylesheet" href="${ctxpath}/res/css/board.css" />
		<!-- js -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
		</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
		<script src="${ctxpath}/res/js/board.js"></script>
		<!-- custom -->
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
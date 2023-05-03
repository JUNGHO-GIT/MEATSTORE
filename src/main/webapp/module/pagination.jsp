<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>

<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
		<c:if test="${count>0}">
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>
			<div class="d-flex justify-content-center align-items-center">
				<c:if test="${startPage>10}">
					<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/notice/list.do?pageNum=${startPage-10}'">이전블럭</button>
				</c:if>
				&nbsp;&nbsp;
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<button class="btn btn-jungho mr-2" onclick="window.location.href='${ctxpath}/notice/list.do?pageNum=${i}'">${i}</button>
				</c:forEach>
				&nbsp;&nbsp;
				<c:if test="${endPage<pageCount}">
					<button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/notice/list.do?pageNum=${endPage+1}'">다음블럭</button>
				</c:if>
			</div>
		</c:if>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300"> QNA </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [ 글 삭제 ] </h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<form name="delForm" method="post" action="/qna/deletePro.do?pageNum=${pageNum}" onSubmit="return UIcheck()">
				<table border="1" width="350">
					<tr>
						<td colspan="2">
							<h4>암호를 입력하세요.</h4>
						</td>
					</tr>
					<tr>
						<td>암호</td>
						<td>
							<input type="text" name="pw" id="pw" size="12" />
							<input type="hidden" name="num" value="${num}" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="글 삭제" />
							<input type="button" value="리스트" onClick="location='/qna/list.do?pageNum=${pageNum}'" />
						</td>
					</tr>
				</table>
			</form>
		</section>

	</body>
</html>
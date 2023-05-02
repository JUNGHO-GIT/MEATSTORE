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
					<h1 data-aos="fade-right" data-aos-delay="300"> 회원탈퇴 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [ID : ${sessionScope.id}] 회원님 </h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<table border="1" width="350">
				<form name="delForm" method="post" action="${ctxpath}/member/deletePro.do" onSubmit="return pwcheck()">
					<tr>
						<td>암호</td>
						<td>
							<input type="password" name="pw" id="pw" size="20" />
							<input type="hidden" name="id" value="${sessionScope.id}" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="회원탈퇴" />
							<input type="button" value="취소" onClick="location='${ctxpath}/module/template.jsp'" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
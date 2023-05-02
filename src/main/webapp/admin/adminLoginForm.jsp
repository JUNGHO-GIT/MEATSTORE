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
					<h1 data-aos="fade-right" data-aos-delay="300"> 로그인 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [관리자] </h2>
				</div>
			</div>
		</section>
		<section>
			<table border="1">
				<form name="adminloginForm" method="post" action="/admin/adminLoginPro.do">
					<tr>
						<td>관리자ID</td>
						<td>
							<input type="text" name="adminid" id="adminid" size="20" />
						</td>
					</tr>
					<tr>
						<td>관리자 암호</td>
						<td>
							<input type="password" name="adminpw" id="adminpw" size="20" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="로그인" onClick="adminCheck()" />
							<input type="button" value="취소" onClick="location='/module/template.jsp'" />
						</td>
					</tr>
				</form>
			</table>
		</section>
	</body>
</html>
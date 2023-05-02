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
					<h2 data-aos="fade-left" data-aos-delay="300"> [ID와 비밀번호를 입력해주세요] </h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section class="section">
			<table class="dataTable">
				<form name="loginForm" method="post" action="${ctxpath}/member/loginPro.do" onSubmit="return loginCheck()">
					<tr>
						<td>ID</td>
						<td>
							<input type="text" name="id" id="id" size="20" placeholder="ID를 입력해주세요." />
						</td>
					</tr>
					<tr>
						<td>암호</td>
						<td>
							<input type="password" name="pw" id="pw" size="20" placeholder="비밀번호를 입력해주세요." />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="submit_id">
							<input type="submit" id="submit_button" value="로그인" />
							<br />
							<input type="reset" value="다시입력" />
							<br />
							<input type="button" value="관리자 로그인" onClick="location='${ctxpath}/admin/adminLoginForm.do'" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
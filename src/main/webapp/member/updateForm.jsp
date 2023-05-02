<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("utf-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">회원 정보 수정</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[ID : ${sessionScope.id}]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<table border="1">
				<form method="post" action="${ctxpath}/member/updatePro.do" onSubmit="return updateCheck()">
					<tr>
						<td>ID</td>
						<td>
							${dto.id}
							<input type="hidden" name="id" id="id" value="${dto.id}" />
						</td>
					</tr>
					<tr>
						<td>암호</td>
						<td>
							<input type="password" name="pw" id="pw" size="20" />
						</td>
					</tr>
					<tr>
						<td>암호확인</td>
						<td>
							<input type="password" name="pw2" id="pw2" size="20" />
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="name" id="name" size="40" value="${dto.name}" />
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" name="email" id="email" size="40" value="${dto.email}" />
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<input type="text" name="tel" id="tel" size="40" value="${dto.tel}" />
						</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td>
							<input type="text" name="zipcode" id="zipcode" size="7" value="${dto.zipcode}" readonly />
							<input type="button" value="주소찾기" onClick="findAddr()" />
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="text" name="addr" id="addr" size="50" value="${dto.addr}" readonly />
						</td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td>
							<input type="text" name="addr2" id="addr2" size="20" value="${dto.addr2}" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="내정보수정" />
							<input type="reset" value="다시입력" />
							<input type="button" value="취소" onClick="location.href='${ctxpath}/home/template.jsp'" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
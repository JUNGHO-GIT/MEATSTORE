<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300"> 회원가입 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [회원가입을 환영합니다] </h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<table class="dataTable">
				<form name="inputForm" method="post" action="${ctxpath}/member/inputPro.do" onSubmit="return check2()">
					<tr>
						<td>ID</td>
						<td>
							<input class="text_box_2" type="text" name="id" id="id" size="20" placeholder="id입력" />
							<input type="hidden" name="idck" id="idck" value="false" />
							<input class="button" type="button" value="ID중복체크" onClick="idCheck()" />
						</td>
					</tr>
					<tr>
						<td>암호</td>
						<td>
							<input type="password" name="pw" id="pw" size="12" onFocus="aa()" />
						</td>
					</tr>
					<tr>
						<td>암호확인</td>
						<td>
							<input type="password" name="pw2" id="pw2" size="12" />
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input class="text_box" type="text" name="name" id="name" size="30" placeholder="입력" />
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input class="text_box" type="text" name="email" id="email" size="30" placeholder="OOO@naver.com" />
						</td>
					</tr>
					<tr>
						<td>전화</td>
						<td>
							<input class="text_box" type="text" name="tel" id="tel" size="14" placeholder="전화번호입력" />
						</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td>
							<input class="text_box_2" type="text" name="zipcode" id="zipcode" size="7" />
							<input class="button" type="button" value="주소찾기" onClick="findAddr()" />
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input class="text_box" type="text" name="addr" id="addr" size="50" readonly />
						</td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td>
							<input class="text_box" type="text" name="addr2" id="addr2" size="20" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="submit_id">
							<input type="submit" value="회원가입" />
							<br />
							<input type="reset" value="다시입력" />
							<br />
							<input class="button_noInput" type="button" value="가입안함" onClick="location='${ctxpath}/module/template.jsp'" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
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
					<h1 data-aos="fade-right" data-aos-delay="300">QNA</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[글 수정]</h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section>
			<table>
				<form name="updateForm" method="post" action="${ctxpath}/qna/updatePro.do?pageNum=${pageNum}" onSubmit="return UIcheck()">
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="writer" id="writer" value="${dto.writer}" />
							<input type="hidden" name="num" value="${dto.num}" />
						</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td>
							<input type="text" name="subject" id="subject" size="45" value="${dto.subject}" />
						</td>
					</tr>
					<tr>
						<td>글내용</td>
						<td>
							<textarea name="content" id="content" rows="10" cols="45">
								${dto.content}
							</textarea>
						</td>
					</tr>
					<tr>
						<td>암호</td>
						<td>
							<input type="password" name="pw" id="pw" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="글수정" />
							<input type="reset" value="다시쓰기" />
							<input type="button" value="리스트" onClick="location='${ctxpath}/qna/list.do?pageNum=${pageNum}'" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
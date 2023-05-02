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
					<h1 data-aos="fade-right" data-aos-delay="300"> 공지 사항 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [글 수정] </h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section class="section">
			<table class="wid">
				<form name="updateForm" method="post" action="${ctxpath}/notice/updatePro.do?pageNum=${pageNum}" onSubmit="return pwcheck()">
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" name="writer" id="wirter" value="${dto.writer}" />
							<input type="hidden" name="num" value="${dto.num}" />
						</td>
					</tr>
					<tr>
						<td>글 제목</td>
						<td>
							<input type="text" name="title" id="title" value="${dto.title}" />
						</td>
					</tr>
					<tr>
						<td>글 내용</td>
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
							<input type="submit" value="글 수정" />
							<input type="reset" value="다시쓰기" />
							<input type="button" value="리스트" onClick="location='${ctxpath}/notice/list.do?pageNum=${pageNum}'" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
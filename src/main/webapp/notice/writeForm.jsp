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
					<h2 data-aos="fade-left" data-aos-delay="300"> [글 작성] </h2>
				</div>
			</div>
		</section>
		<!-- section -->
		<section class="section">
			<table>
				<form name="writeForm" method="post" action="${ctxpath}/notice/writePro.do" onSubmit="return check()">
					<input type="hidden" name="num" value="${num}" />
					<tr>
						<td colspan="2" align="right">
							<a href="${ctxpath}/notice/list.do">리스트</a>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="writer" id="writer" size="20" />
						</td>
					</tr>
					<tr>
						<td>글 제목</td>
						<td>
							<input type="text" name="title" id="title" size="50" />
						</td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td>
							<textarea name="content" id="content" rows="10" cols="50"></textarea>
						</td>
					</tr>
					<tr>
						<td>암호</td>
						<td>
							<input type="password" name="pw" id="pw" size="20" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<c:if test="${num==0}">
								<input type="submit" value="글쓰기" />
							</c:if>
							<input type="reset" value="다시쓰기" />
						</td>
					</tr>
				</form>
			</table>
		</section>

	</body>
</html>
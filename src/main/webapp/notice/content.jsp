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
					<h1 data-aos="fade-right" data-aos-delay="300">공지 사항</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[중요 사항을 알려드립니다.]</h2>
				</div>
			</div>
		</section>

    <!-- section -->
    <section>
      <table class="contentTable">
        <tr>
          <td id="content_row">글 번호</td>
          <td>${dto.num }</td>
          <td id="content_row">조회수</td>
          <td>${dto.readcount }</td>
        </tr>
        <tr>
          <td id="content_row">작성자</td>
          <td>${dto.writer }</td>
          <td id="content_row">작성일</td>
          <td>${dto.regdate }</td>
        </tr>
        <tr>
          <td id="content_row">제목</td>
          <td colspan="3">${dto.title}</td>
        </tr>
        <tr>
          <td id="content_row">내용</td>
          <td colspan="3" id="content_content">
            <pre>${dto.content }</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" align="right">
            <c:if test="${!empty sessionScope.adminid}">
              <a href="${ctxpath}/notice/updateForm.do?num=${num}&pageNum=${pageNum}">글 수정</a>
              <a href="${ctxpath}/notice/deleteForm.do?num=${num}&pageNum=${pageNum}">글 삭제</a>
            </c:if>
            <a href="${ctxpath}/notice/list.do?pageNum=${pageNum}">[리스트]</a>
          </td>
        </tr>
      </table>
    </section>

	</body>
</html>
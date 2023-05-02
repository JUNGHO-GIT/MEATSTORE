<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="upload" />
<!--[Html]----------------------------------------------------------------------------------------->

<!doctype html>
<html lang="ko, en">
	<!--[Body]--------------------------------------------------------------------------------------->

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h2>
						<c:if test="${num == 0}">
							<h2 data-aos="fade-left" data-aos-delay="300">[글 쓰기]</h2>
						</c:if>
						<c:if test="${num != 0}">
							<h2 data-aos="fade-left" data-aos-delay="300">[답글 쓰기]</h2>
						</c:if>
				</div>
			</div>
		</section>
		<!-- blog -->
		<section class="blog">
			<div class="container">
				<!-- form --------------------------------------------------------------------------------->
				<form name="writeForm" method="post" enctype="multipart/form-data" action="${ctxpath}/board/writePro.do" onsubmit="return boardCheck()">
					<input type="hidden" name="num" value="${num}" />
					<input type="hidden" name="ref" value="${ref}" />
					<input type="hidden" name="re_step" value="${re_step}" />
					<input type="hidden" name="re_level" value="${re_level}" />
					<!-- row -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
							<div id="image_container" oninput="setThumbnail(event);" style="margin-bottom: 20px;">
								<c:if test="${dto.fileupload != null}">
									<img src="/${imgspath}/${dto.fileupload}" />
								</c:if>
							</div>
						</div>
						<br />
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
							<h5>
								<input type="text" name="subject" id="subject" placeholder="제목을 입력하세요" class="write_column_one" />
								<br />
								<input type="text" name="writer" id="writer" placeholder="이름을 입력하세요" class="write_column_one" />
								<br />
								<input type="password" name="pw" id="pw" placeholder="암호를 입력하세요" class="write_column_one" />
								<br />
								<textarea name="content" id="content" class="write_column_textarea" placeholder="내용을 입력하세요"></textarea>
								<br />
							</h5>
						</div>
						<br />
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 text-center">
							<h6>
								<input type="file" name="fileupload" id="fileupload" onchange="setThumbnail(event);" class="btn btn-jungho" />&nbsp;&nbsp;
								<input type="submit" class="btn btn-jungho" value="작성하기" />
							</h6>
						</div>
					</div>
				</form>
			</div>
		</section>

	</body>
</html>
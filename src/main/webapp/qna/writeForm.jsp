<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">QNA</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[글 작성]</h2>
				</div>
			</div>
		</section>
    <!-- section -->
    <section>
    	<div class="row">
    		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
    			<form name="writeForm" method="post" action="${ctxpath}/qna/writePro.do" onSubmit="return check()">
    				<input type="hidden" name="num" value="${num}" />
    				<input type="hidden" name="ref" value="${ref}" />
    				<input type="hidden" name="re_step" value="${re_step}" />
    				<input type="hidden" name="re_indent" value="${re_indent}" />
    				<div class="form-group">
    					<input class="form-control" type="text" name="subject" id="subject" size="50" placeholder="제목을 입력하세요." />
    				</div>
    				<div class="form-group">
    					<input class="form-control" type="text" name="writer" id="writer" size="20" placeholder="이름을 입력하세요." />
    				</div>
    				<div class="form-group">
    					<textarea class="form-control" name="content" id="content" rows="10" cols="50" placeholder="내용을 입력하세요."></textarea>
    				</div>
    				<div class="form-group">
    					<input class="form-control" type="password" name="pw" id="pw" size="20" placeholder="암호를 입력하세요." />
    				</div>
    				<div class="btn btn-group d-flex justify-content-center align-items-center">
    					<button class="btn btn-jungho" type="submit">글쓰기</button>
    					&nbsp;&nbsp;
    					<button class="btn btn-jungho" type="reset">다시쓰기</button>
    					&nbsp;&nbsp;
    					<button class="btn btn-jungho" type="button" onclick="window.location.href='${ctxpath}/qna/list.do'">목록보기</button>
    				</div>
    			</form>
    		</div>
    	</div>
    </section>

	</body>
</html>
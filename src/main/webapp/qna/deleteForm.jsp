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
					<h2 data-aos="fade-left" data-aos-delay="300">[ 글 삭제 ]</h2>
				</div>
			</div>
		</section>
    <!-- section -->
    <section>
    	<div class="row">
    		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
    			<form name="delForm" method="post" action="${ctxpath}/qna/deletePro.do?pageNum=${pageNum}" onSubmit="return pwCheck()">
    				<div class="form-group">
    					<input class="form-control" type="password" name="pw" id="pw" size="12" placeholder="암호" />
    					<input type="hidden" name="num" value="${num}" />
    				</div>
    				<div class="btn btn-group d-flex justify-content-center align-items-center">
    					<button class="btn btn-jungho" type="submit">글 삭제</button>
    					&nbsp;&nbsp;
    					<button class="btn btn-jungho" type="button" onClick="location='${ctxpath}/qna/list.do?pageNum=${pageNum}'">리스트</button>
    					&nbsp;&nbsp;
    				</div>
    			</form>
    		</div>
    	</div>
    </section>

	</body>
</html>
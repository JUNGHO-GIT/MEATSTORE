<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

		<section class="section-1">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[글 내용 보기]</h2>
				</div>
			</div>
		</section>
		<section class="container">
			<div class="row justify-content-center">
				<div class="col-md-4 text-center">
					<img src="${cloudPath}/board/${dto.fileupload}" class="img-fluid" alt="게시글 이미지" />
				</div>
			</div>
			<hr class="my-4" style="border-top: 2px solid #9B111E;" />
			<div class="row justify-content-center">
				<div class="col-md-6">
					<table class="table table-borderless">
						<tr>
							<td colspan="2" class="text-center">
								<h2>${dto.subject}</h2>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>
								<input type="text" name="writer" id="writer" class="form-control" value="${dto.writer}" readonly />
							</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>
								<input type="text" name="regdate" id="regdate" class="form-control" value="${dto.regdate}" readonly />
							</td>
						</tr>
            <tr>
              <th>글내용</th>
              <th>
              	<textarea class="form-control" name="content" readonly="readonly" style="height: 300px; resize: none; background-color:#ffffff;" readonly="readonly">${dto.content}</textarea>
              </th>
            </tr>
						<tr>
							<td colspan="2" class="text-center">
								<button type="button" onclick="window.location.href='${ctxpath}/board/updateForm.do?num=${num}&pageNum=${pageNum}'" class="btn btn-jungho">수정</button>
								&nbsp;&nbsp;
								<button type="button" onclick="window.location.href='${ctxpath}/board/deleteForm.do?num=${num}&pageNum=${pageNum}'" class="btn btn-jungho">삭제</button>
								&nbsp;&nbsp;
								<button type="button" onclick="window.location.href='${ctxpath}/board/insertForm.do?num=${num}&pageNum=${pageNum}&ref=${dto.ref}&re_step=${dto.re_step}&re_level=${dto.re_level}'" class="btn btn-jungho">답글쓰기</button>
								&nbsp;&nbsp;
								<button type="button" onclick="window.location.href='${ctxpath}/board/listForm.do?pageNum=${pageNum}'" class="btn btn-jungho">목록보기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
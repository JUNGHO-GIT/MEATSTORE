<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />

<% request.setCharacterEncoding("UTF-8"); %>

<!-- header -->
<section class="section">
  <div class="jumbotron d-flex align-items-center">
    <div class="gradient"></div>
    <div class="container-fluid content">
      <h1 data-aos="fade-right" data-aos-delay="300">자유게시판</h1>
      <h2 data-aos="fade-left" data-aos-delay="300">[전체글 : ${count}]</h1>
      <h2>
        <button class="btn btn-jungho" data-aos="fade-up" data-aos-delay="300" onclick="window.location.href='${ctxPath}/board/insertForm.do'">글쓰기</button>
      </h2>
    </div>
  </div>
</section>

<!-- 글 x -->
<c:if test="${count==0}">
  <section class="empty-h200"></section>
</c:if>

<!-- 글 o -->
<c:if test="${count>0}">
  <!-- section -->
  <section class="section">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-8 col-lg-8 col-md-10 col-sm-10 col-xs-10 col-10 d-flex justify-content-center align-items-center">
        <table class="table table-striped dataTable table-hover" style="border: 1px solid #dddddd;">
          <thead>
            <tr>
              <th style="width:90px;"></th>
              <th style="width:120px;">이미지</th>
              <th style="width:600px;">내용</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="dto" items="${list}">
              <tr>
                <td class="jungho-center fw-5">
                  <c:out value="${number}" />
                  <c:set var="number" value="${number-1}" />
                </td>
                <td class="jungho-center fw-5">
                  <c:if test="${dto.imageFile!=null}">
                    <img src="${uploadPath}/board/${dto.imageFile}" class="product-image sh-7 rd-1"/>
                  </c:if>
                  <c:if test="${dto.imageFile==null}">
                    <img src="${imgsPath}/etc/noImage.png" class="product-image sh-7 rd-1"/>
                  </c:if>
                </td>
                <td class="jungho-center fw-5">
                  <table style="width:100%;">
                    <tr style="background-color: transparent;">
                      <td colspan="3" class="jungho-center fw-9">
                        <c:if test="${dto.re_indent > 0}">
                          <img src="${imgsPath}/etc/level.gif" width="${5*dto.re_indent}" height="16" />
                          <img src="${imgsPath}/etc/re.gif" />
                        </c:if>
                        <c:if test="${dto.re_indent==0}">
                          <img src="${imgsPath}/etc/level.gif" width="${5*dto.re_indent}" height="16" />
                        </c:if>
                        <c:if test="${dto.views}=10">
                          <img src="${imgsPath}/etc/hot.gif" />
                        </c:if>
                        <a class="linkHover" href="${ctxPath}/board/detailForm.do?num=${dto.num}&pageNum=${currentPage}">
                          ${dto.subject}
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="1" class="jungho-center fw-5">
                        <span><i class="fas fa-user" style="color: #cc4;"></i></span>
                        <c:out value="${dto.writer}" />
                      </td>
                      <td colspan="1" class="jungho-center fw-5">
                        <span><i class="fas fa-calendar-alt" style="color: #888888;"></i></span>
                        <fmt:formatDate value="${dto.regDate}" pattern="MM-dd" />
                      </td>
                      <td colspan="1" class="jungho-center fw-5">
                        <span><i class="fas fa-eye" style="color: #ff6600;"></i></span>
                        <c:out value="${dto.views}" />
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    <br />
    <br />

    <!-- search -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div class="search_page d-flex justify-content-center align-items-center">
          <form method="GET" name="search_list" action="${ctxPath}/board/listSearch.do" class="form-inline-search">
            <select name="keyword" class="form-control">
              <option value="subject">제목</option>
              <option value="writer">작성자</option>
            </select>
            <input type="text" name="search" id="search" class="form-control" />
            <input type="submit" value="검색" class="btn btn-jungho" />
          </form>
        </div>
      </div>
    </div>
    <br />
    <br />

    <!-- button -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <c:if test="${count>0}">
          <c:if test="${endPage>pageCount}">
            <c:set var="endPage" value="${pageCount}" />
          </c:if>
          <div class="d-flex justify-content-center align-items-center">
            <c:if test="${startPage>10}">
              <button class="btn btn-jungho" onclick="window.location.href='${ctxPath}/board/listForm.do?pageNum=${startPage-10}'">이전블럭</button>
            </c:if>
            &nbsp;&nbsp;
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
              <button class="btn btn-jungho mr-2" onclick="window.location.href='${ctxPath}/board/listForm.do?pageNum=${i}'">${i}</button>
            </c:forEach>
            &nbsp;&nbsp;
            <c:if test="${endPage<pageCount}">
              <button class="btn btn-jungho" onclick="window.location.href='${ctxPath}/board/listForm.do?pageNum=${endPage+1}'">다음블럭</button>
            </c:if>
          </div>
        </c:if>
      </div>
    </div>

  </section>
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<c:set var="imgspath" value="upload"/>

<!--[Html]----------------------------------------------------------------------------------------->
<!doctype html>
<html lang="ko, en">

	<!--[Head]--------------------------------------------------------------------------------------->
	<head>

	  <!-- Required meta tags -->
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800" >
	  <link rel="stylesheet" href="css/animate.css">
	  <link rel="stylesheet" href="css/main.css">

	  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"> </script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"> </script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"> </script>
	  <script src="js/animate.js"> </script>
	  <script src="js/custom.js"> </script>
	  <title> Jungho </title>
	  <style>
	    .jumbotron {
	      width : 100%;
	      height : 150px;
	      text-align: center;
	    }
	    .jumbotron h2 {
	      padding-bottom: 0;
	    }
	  </style>
	</head>
	<!-- /head -->

	<!-- body --------------------------------------------------------------------------------------->
	<body>

		<!-- 글 존재 X -------------------------------------------------------------------------------->
		<c:if test = "${count == 0}">
			<section class="section-1">
		    <div class="jumbotron d-flex align-items-center">
		      <div class="gradient"> </div>
		        <div class="container-fluid content">
		        <h1 data-aos="fade-right" data-aos-delay="300"> 자유게시판 </h1>
		        <h2 data-aos="fade-left" data-aos-delay="300"> 등록된 글이 없습니다!! </h2>
		      </div>
		    </div>
	  	</section>
		</c:if>

		<!-- 글 존재 O -------------------------------------------------------------------------------->
		<c:if test = "${count > 0}">
			<!-- section -->
			<section class="section-1">
		    <div class="jumbotron d-flex align-items-center">
		      <div class="gradient"> </div>
		        <div class="container-fluid content">
		        <h1 data-aos="fade-right" data-aos-delay="300"> 자유게시판 </h1>
		        <h2 data-aos="fade-left" data-aos-delay="300"> [전체글 : ${count}] </h2>
		      </div>
		    </div>
	  	</section>
	  	<!-- /section -->

			<!-- section -->
			<section class="blog">
			  <!-- container -->
			  <div class="container">
			  	<!-- row -->
			    <div class="row">
			      <!-- 공백 추가 -->
			      <div class="blank-jungho0"></div>
			      <!-- 머릿말 -->
			      <div class="float-left"> <h3> 당신을 표현해주세요! </h3> </div>
			      <!-- 공백 추가 -->
			      <div class="blank-jungho1"></div>
			      <!-- 소셜 아이콘 -->
			      <div class="float-right">
			        <div class="social-icons">
			          <a href="www.facebook.com"> <i class="fa fa-facebook-official" aria-hidden="true"> </i> </a>
            		<a href="www.twitter.com"> <i class="fa fa-twitter" aria-hidden="true"> </i> </a>
            		<a href="www.pinterest.com"> <i class="fa fa-pinterest" aria-hidden="true"> </i> </a>
            		<a href="www.youtube.com"> <i class="fa fa-youtube" aria-hidden="true"> </i> </a>
			        </div>
			      </div>
			      <!-- 글쓰기 버튼 -->
			      <div class="component-jungho1">
			        <div class="col-sm-12">
			          <ul>
			            <h6>
			              <button class="btn btn-jungho" onclick="window.location.href='${ctxpath}/board/writeForm.do'" type="submit"> 글쓰기 </button>
			            </h6>
			          </ul>
			        </div>
			      </div>
			    </div>
			    <!-- /row -->

					<!-- row -->
			    <div class="row">
			      <!-- 공백 추가 -->
			      <div class="blank-jungho0"></div>
			      <!-- 분류 검색 -->
			      <div class="float-left">
			        <form class="form-inline">
			          <select class="form-control mr-sm-2">
			            <option> 모두 </option>
			            <option> 최신순 </option>
			            <option> 오래된순 </option>
			            <option> 조회수 많은순 </option>
			            <option> 좋아요 많은순 </option>
			          </select>
			          <button class="btn btn-jungho" type="submit"> 정렬 </button>
			        </form>
			      </div>
			      <!-- 공백 추가 -->
			      <div class="blank-jungho4"></div>
			      <!-- 검색 버튼 -->
			      <div class="float-left">
			        <form class="form-inline">
			          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			          <button class="btn btn-jungho" type="submit" onclick="window.location.href='${ctxpath}/board/list.do'"> 검색 </button>
			        </form>
			      </div>

								<script>

									$(document).ready(function() {
										$("#search").click(function(){
											var search = $("#search").val();
											$.ajax({
												url : "${ctxpath}/board/list.do",
												type : "post",
												data : {"search" : search},
												success : function(data){
													$("#search").html(data);
												}
											});
										});
									});
								</script>
			        </form>
			      </div>
			  	</div>
			 		<!-- /row -->
			  </div>
				<!-- /container -->

	    	<br></br>

        <!----------------------------------------- 본문 ------------------------------------------>

		    <!-- container -->
		    <div class="container">
		      <!-- row -->
		      <div class="row">
		      	<!-- box -->
		        <div class="col-lg-4 col-sm-12 col-12 box-1"  data-aos="fade-right" data-aos-delay="300">
		        	<!-- component 1 -->
		          <div class="border-jungho1">
		          	<!-- row -->
		            <div class="row">
									<c:forEach var="dto" items="${list}" begin="0" step="4">
			              <div class="blank-jungho5"></div>
			              <figure class="figure">
			                <c:if test="${dto.fileupload != null}">
												<img src="${ctxpath}/${imgspath}/${dto.fileupload}" width="180px" height="180px" class="figure-img img-fluid">
											</c:if>
											<c:if test="${dto.fileupload == null}">
												<img src="images/nofile.jpg" class="figure-img img-fluid">
											</c:if>
			                <figcaption class="figure-caption">
			                  <h2> <c:out value="${dto.subject}"/> </h2>
			                  <p> <c:out value="${dto.content}"/> </p>
			                  <div class="component-jungho1">
			                    <h6>
														<!-- writer -->
			                      <a id="buttons-jungho" type="button">
			                        <i class="fa fa-user" aria-hidden="true"> </i> <c:out value="${dto.writer}"/> </a> &nbsp;
														<!-- comment -->
			                      <a id="buttons-jungho" type="button">
			                        <i class="fa fa-commenting-o" aria-hidden="true"> </i> <c:out value="${dto.re_level}"/> </a> &nbsp;
			                      <!-- readcount -->
			                      <a id="buttons-jungho" type="button">
			                        <i class="fa fa-eye" aria-hidden="true"> </i> <c:out value="${dto.readcount}"/> </a> &nbsp;
			                      <!-- thumbs -->
			                      <a id="buttons-jungho" type="button">
			                        <i class="fa fa-thumbs-o-up" aria-hidden="true"> </i> 50 </a> &nbsp; <br></br>
			                      <!-- date -->
			                      <a id="buttons-jungho" type="button">
			                        <i class="fa fa-calendar" aria-hidden="true"> </i> <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/> </a> &nbsp;
			                      <!-- IP -->
			                      <a id="buttons-jungho" type="button">
			                        <i class="fa fa-mobile-phone" aria-hidden="true"> </i> <c:out value="${dto.ip}"/> </a> &nbsp; <br></br>
			                      <!-- button -->
			                      <a class="btn btn-success" href="${ctxpath}/board/content.do?num=${dto.num}&pageNum=${currentPage}"> + 더보기 </a>
			                    </h6>
			                  </div>
			                </figcaption>
			                <!-- /figcaption -->
			              </figure>
			              <!-- /figure -->
									</c:forEach>
									<!-- /c:forEach -->
		            </div>
		            <!-- /row -->
		          </div>
		          <!-- component 1 -->
		        </div>
	        	<!-- /box -->

		        <!-- box -->
		        <div class="col-lg-8 col-sm-12 col-12"  data-aos="fade-left" data-aos-delay="300">
		        	<!-- component 2 -->
		          <div class="border-jungho2">
		          	<!-- row -->
		            <div class="row">
									<c:forEach var="dto" items="${list}" begin="1" step="4">
			              <div class="col-sm-6 col-12 box-2">
			                <figure class="figure">
				                <c:if test="${dto.fileupload != null}">
													<img src="${ctxpath}/${imgspath}/${dto.fileupload}" width="180px" height="180px" class="figure-img img-fluid">
												</c:if>
												<c:if test="${dto.fileupload == null}">
													<img src="images/nofile.jpg" class="figure-img img-fluid">
												</c:if>
			                </figure>
			              </div>
			              <div class="col-sm-6 col-12 box-3">
			                <h4> <a href="${ctxpath}/board/content.do?num=${dto.num}&pageNum=${currentPage}"> ${dto.subject} </a> </h4>
			                <h5>${dto.content} </h5>
			                <div class="component-jungho1">
			                  <h6>
													<!-- writer -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-user" aria-hidden="true"> </i> <c:out value="${dto.writer}"/> </a> &nbsp;
													<!-- comment -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-commenting-o" aria-hidden="true"> </i> <c:out value="${dto.re_level}"/> </a> &nbsp;
		                      <!-- readcount -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-eye" aria-hidden="true"> </i> <c:out value="${dto.readcount}"/> </a> &nbsp;
		                      <!-- thumbs -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-thumbs-o-up" aria-hidden="true"> </i> 12 </a> &nbsp; <br></br>
		                      <!-- date -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-calendar" aria-hidden="true"> </i> <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/> </a> &nbsp;
		                      <!-- IP -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-mobile-phone" aria-hidden="true"> </i> <c:out value="${dto.ip}"/> </a> &nbsp; <br></br>
		                      <!-- button -->
		                      <a class="btn btn-success" href="${ctxpath}/board/content.do?num=${dto.num}&pageNum=${currentPage}"> + 더보기 </a>
		                    </h6>
											</div>
										</div>
										<!-- /row -->
									</c:forEach>
									<!-- /c:forEach -->
								</div>
								<!-- /row -->
							</div>
							<!-- /component 2 -->

							<!-- component 3 -->
	            <div class="border-jungho2">
	            	<!-- row -->
	              <div class="row">
									<c:forEach var="dto" items="${list}" begin="2" step="4">
		                <div class="col-sm-6 col-12 box-4">
		                  <figure class="figure">
		                  	<c:if test="${dto.fileupload != null}">
													<img src="${ctxpath}/${imgspath}/${dto.fileupload}" width="180px" height="180px" class="figure-img img-fluid">
												</c:if>
												<c:if test="${dto.fileupload == null}">
													<img src="images/nofile.jpg" class="figure-img img-fluid">
												</c:if>
											</figure>
		                </div>
		                <div class="col-sm-6 col-12 box-5">
		                  <h4> ${dto.subject} </h4>
		                  <h5> ${dto.content} </h5>
		                  <div class="component-jungho1">
			                  <h6>
													<!-- writer -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-user" aria-hidden="true"> </i> <c:out value="${dto.writer}"/> </a> &nbsp;
													<!-- comment -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-commenting-o" aria-hidden="true"> </i> <c:out value="${dto.re_level}"/> </a> &nbsp;
		                      <!-- readcount -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-eye" aria-hidden="true"> </i> <c:out value="${dto.readcount}"/> </a> &nbsp;
		                      <!-- thumbs -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-thumbs-o-up" aria-hidden="true"> </i> 10 </a> &nbsp; <br></br>
		                      <!-- date -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-calendar" aria-hidden="true"> </i> <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/> </a> &nbsp;
		                      <!-- IP -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-mobile-phone" aria-hidden="true"> </i> <c:out value="${dto.ip}"/> </a> &nbsp; <br></br>
		                      <!-- button -->
		                      <a class="btn btn-success" href="${ctxpath}/board/content.do?num=${dto.num}&pageNum=${currentPage}"> + 더보기 </a>
		                    </h6>
	                		</div>
	              		</div>
	              		<!-- /row -->
									</c:forEach>
									<!-- /c:forEach -->
	            	</div>
	            	<!-- /row -->
	          	</div>
	          	<!-- /component 3 -->

							<!-- component 4 -->
			        <div class="border-jungho2">
			        	<!-- row -->
			          <div class="row">
									<c:forEach var="dto" items="${list}" begin="3" step="4">
				            <div class="col-sm-6 col-12 box-6">
				              <figure class="figure">
				                <c:if test="${dto.fileupload != null}">
													<img src="${ctxpath}/${imgspath}/${dto.fileupload}" width="180px" height="180px" class="figure-img img-fluid">
												</c:if>
												<c:if test="${dto.fileupload == null}">
													<img src="images/nofile.jpg" class="figure-img img-fluid">
												</c:if>
				              </figure>
				            </div>
				            <div class="col-sm-6 col-12 box-7">
				              <h4> ${dto.subject} </h4>
				              <h5> ${dto.content} </h5>
				              <div class="component-jungho1">
			                  <h6>
													<!-- writer -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-user" aria-hidden="true"> </i> <c:out value="${dto.writer}"/> </a> &nbsp;
													<!-- comment -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-commenting-o" aria-hidden="true"> </i> <c:out value="${dto.re_level}"/> </a> &nbsp;
		                      <!-- readcount -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-eye" aria-hidden="true"> </i> <c:out value="${dto.readcount}"/> </a> &nbsp;
		                      <!-- thumbs -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-thumbs-o-up" aria-hidden="true"> </i> 99 </a> &nbsp; <br></br>
		                      <!-- date -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-calendar" aria-hidden="true"> </i> <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/> </a> &nbsp;
		                      <!-- IP -->
		                      <a id="buttons-jungho" type="button">
		                        <i class="fa fa-mobile-phone" aria-hidden="true"> </i> <c:out value="${dto.ip}"/> </a> &nbsp; <br></br>
		                      <!-- button -->
		                      <a class="btn btn-success" href="${ctxpath}/board/content.do?num=${dto.num}&pageNum=${currentPage}"> + 더보기 </a>
		                    </h6>
	                		</div>
				            </div>
				          </div>
				          <!-- /row -->
			          </c:forEach>
								<!-- /c:forEach -->
			        </div>
			        <!-- /component 4 -->
			      </div>
			      <!-- /box -->
		      </div>
		      <!-- /row -->

			  <!-- border -->
			  <div class="border-jungho2">
			  	<!-- row -->
		      <div class="row">
		      	<!-- 공백 추가 -->
		         <div class="blank-jungho6"></div>
		          <!-- component -->
		          <div class="component-jungho1">
		          	<div class="col-sm-12">
		          		<ul>
		              	<h6>
									    <!-- c:if -->
											<c:if test="${count > 0}">
												<!-- c:if -->
												<c:if test="${endPage > pageCount}">
													<c:set var="endPage" value="${pageCount}"/>
												</c:if>
												<!-- c:if -->
				              	<c:if test="${startPage > 5}">
				                	<button class="btn btn-success" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${startPage - 5}'"> <i class="fa fa-angle-left" aria-hidden="true"> </i> </button>
				                </c:if>
				                <!-- c:forEach -->
				                <c:forEach var="i" begin="${startPage}" end="${endPage}">
				                	<button class="btn btn-success" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${i}'"> &nbsp; ${i} &nbsp; </button>
				                </c:forEach>
				                <!-- c:if -->
				                <c:if test="${endPage < pageCount}">
				                	<button class="btn btn-success" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${startPage + 5}'"> <i class="fa fa-angle-right" aria-hidden="true"> </i> </button>
				              	</c:if>
			              	</c:if>
											<!-- /c:if -->
		              	</h6>
		              </ul>
		            </div>
		          </div>
		          <!-- /component -->
		        </div>
		        <!-- /row -->
		      </div>
		      <!-- /border -->
     		</div>
				<!-- /container -->
	    </section>
		  <!-- /section -->
	  </c:if>
		<!-- /if -->
	</body>
	<!-- /body -->
</html>
<!-- /html -->
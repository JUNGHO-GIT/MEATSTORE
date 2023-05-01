<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<c:set var="imgspath" value="upload"/>

<!--[Html]----------------------------------------------------------------------------------------->
<!doctype html>
<html lang="ko, en">

<!--[Head]----------------------------------------------------------------------------------------->
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

  <!-- Optional JavaScript -->
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
  <script>
    document.getElementById("buttons-jungho").addEventListener("click", function() {
    });
  </script>

</head>

<!--[Body]----------------------------------------------------------------------------------------->
<body>
  
  <!-- 섹션(1) 웰컴 메시지 ------------------------------------------------------------------------>
  <section class="section-1">
    <div class="jumbotron d-flex align-items-center">
      <div class="gradient"> </div>
        <div class="container-fluid content">
        <h1 data-aos="fade-right" data-aos-delay="300"> 자유게시판 </h1>
        <h2 data-aos="fade-left" data-aos-delay="300"> [글 내용 보기] </h2>
      </div>
    </div>
  </section>
  <!----------------------------------------------------------------------------------------------->
  
  
  <!-- 섹션(4) 본문 부분 -------------------------------------------------------------------------->
  <section class="blog">

    <!-- container 1 ------------------------------------------------------------------------------>
    <div class="container">

      <div class="row">
        <!-- 공백 추가 -->
        <div class="blank-jungho0"></div>

        <!-- 머릿말 -->
        <div class="float-left">
          <h3> 당신을 표현해주세요! </h3>
        </div>

        <!-- 공백 추가 -->
        <div class="blank-jungho8"></div>

        <!-- 글쓰기 버튼 -->
        <div class="component-jungho1">
          <div class="col-sm-12">
            <ul>
              <h6>
                <input type="button" onclick="window.location.href='${ctxpath}/board/updateForm.do?num=${num}&pageNum=${pageNum}'" value="수정" class="btn btn-jungho"> &nbsp;
                <input type="button" onclick="window.location.href='${ctxpath}/board/deleteForm.do?num=${num}&pageNum=${pageNum}'" value="삭제" class="btn btn-jungho"> &nbsp;
                <input type="button" onclick="window.location.href='${ctxpath}/board/writeForm.do?num=${num}&pageNum=${pageNum}&ref=${dto.ref}&re_step=${dto.re_step}&re_level=${dto.re_level}'"
	        				value="답글쓰기" class="btn btn-jungho"> &nbsp;
                <input type="button" onclick="window.location.href='${ctxpath}/board/list.do'" value="목록보기" class="btn btn-jungho">
              </h6>
            </ul>
          </div>
        </div>
      </div>
      
    <br>






        <div class="container">
          <div class="row" data-aos="fade-up" data-aos-duration="700">
            <div class="col-sm-12">
            	<c:if test="${dto.fileupload != null}">
								<img src="${ctxpath}/${imgspath}/${dto.fileupload}" width="auto" height="auto" class="img-thumbnail image">
							</c:if>
							<c:if test="${dto.fileupload == null}">
								<img src="images/nofile.jpg" class="figure-img img-fluid">
							</c:if>
            </div>
          </div>
        </div>
        
        
      <br>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
              <div class="social-buttons" data-aos="fade-up" data-aos-duration="700">
              <div class="row">
                <div class="col-sm-5 col-md-6">
                  <div class="inner-jungho">
                    <h2> &nbsp; &nbsp; &nbsp; ${dto.subject} </h2> 
                    <h3> ${dto.regdate} <span> &nbsp; &nbsp; ${dto.writer} </span> </h3>
                  </div>
                </div>
                <div class="col-sm-7 col-md-6">
                  <ul class="mbm_social">
                      <li> <a class="social-facebook" href="#">
                          <i class="fa fa-facebook"> <small> 1.2m </small> </i>
                          
                          <div class="tooltip"> <span> facebook </span> </div>
                          </a>
                      </li>
                      <li> <a class="social-twitter" href="#">
                          <i class="fa fa-twitter"> <small> 448.6k </small> </i>
                          <div class="tooltip"> <span> Twitter </span> </div>
                          </a>
                      </li>
                      <li> <a class="social-google-plus" href="#">
                          <i class="fa fa-pinterest" aria-hidden="true"> <small>111.7k </small> </i>
                          <div class="tooltip"> <span> google+ </span> </div>
                          </a>
                      </li>
                  </ul>
                </div>
              </div>
            </div>
            
            
            <div class="jungho-jungho">
	             <div class="row" data-aos="fade-up" data-aos-duration="700">
	              <div class="col-sm-12 col-lg-12 box">
	                  <p aria-readonly="true"> ${dto.content} </p>
	              </div>
	            </div>
            </div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <br>
            
            
            <section class="section4 more-blog" data-aos="fade-up" data-aos-duration="700">
                <h2 class="background"> <span> 비슷한 게시물 </span> </h2>
                <div class="container">
                    <div class="row" data-aos="fade-up" data-aos-duration="700">
                        <div class="card-deck">
                            <div class="card">
		                      <img class="card-img-top" src="images//meat2.jpg" >
		                      <div class="card-body">
		                          <a class="btn btn-success" href="blog_main.html" role="button"> 더보기 </a>
		                          <p class="card-text"> <small class="text-muted"> January 24th 2023 </small> </p>
		                          <p class="card-text"> <a href="blog_single.html"> 최고급 소고기 </p>
		                      </div>
		                  </div>
		                  <div class="card">
		                      <img class="card-img-top" src="images//pig.jpg">
		                      <div class="card-body">
		                          <a class="btn btn-success" href="blog_main.html" role="button"> 더보기 </a>
		                          <p class="card-text"> <small class="text-muted"> January 24th 2023 </small> </p>
		                          <p class="card-text"> <a href="blog_single.html"> 최고급 돼지고기  </a> </p>
		                      </div>
		                  </div>
		                  <div class="card">
		                      <img class="card-img-top" src="images//chicken.jpg">
		                      <div class="card-body">
		                        <a class="btn btn-success" href="blog_main.html" role="button"> 더보기 </a>
		                        <p class="card-text"> <small class="text-muted"> January 24th 2023 </small> </p>
		                        <p class="card-text"> <a href="blog_single.html"> 최고급 닭고기  </a> </p>
		                      </div>
		                  </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
  </section>
</body>
</html>
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
	  function setThumbnail(event) {
	    let reader = new FileReader();
	    reader.onload = function(event) {
	      let img = document.createElement("img");
	        img.setAttribute("src", event.target.result);
	        img.setAttribute("height", "200");
	        img.setAttribute("width", "200");
	        let imageContainer = document.querySelector("div#image_container");
	        while (imageContainer.firstChild) {
	          imageContainer.removeChild(imageContainer.firstChild);
	        }
	      imageContainer.appendChild(img);
	    };
	    reader.readAsDataURL(event.target.files[0]);  
		}
	</script>
	<script>
    document.getElementById("buttons-jungho").addEventListener("click", function() {
    });
  </script>
  
  <script>
//uppwcheck()
  function uppwcheck() {
  	if(document.updateForm.pw.value == null) {
  		alert("암호는 필수입력");
  		document.updateForm.pw.focus();
  		return false;
  	}
  	return true;
  }

  function check() {
  	if($('#writer').val()=='') {
  		alert("이름을 입력 하세요");
  		$('#writer').focus();
  		return false;
  	}

  	if($('#subject').val()=='') {
  		alert("글제목을 입력 하세요");
  		$('#subject').focus();
  		return false;
  	}

  	if($('#content').val()=='') {
  		alert("내용을 입력 하세요");
  		$('#content').focus();
  		return false;
  	}

  	if($('#pw').val()=='') {
  		alert("암호를 입력하세요");
  		$('#pw').focus();
  		return false;
  	}
  	return true;
  }
  			
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
        <h2 data-aos="fade-left" data-aos-delay="300"> [글내용 수정하기] </h2>
      </div>
    </div>
  </section>
  <!----------------------------------------------------------------------------------------------->

  <!-- form --------------------------------------------------------------------------------------->
  <form name="updateForm" method="post" enctype="multipart/form-data" action="${ctxpath}/board/updatePro.do?pageNum=${pageNum}"
  onsubmit="return uppwcheck()">
  	<input type="hidden" name="pw" id="pw" value="${dto.pw}">
		<input type="hidden" name="num" value="${dto.num}">
  	
  	
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
                <input type="submit" value="수정" class="btn btn-jungho" value="수정" > &nbsp;
                <input type="file" name="fileupload" id="fileupload" onchange="setThumbnail(event);" class="btn btn-jungho"> &nbsp;
                <input type="button" onclick="window.location.href='${ctxpath}/board/deleteForm.do?num=${num}&pageNum=${pageNum}'" class="btn btn-jungho" value="삭제"> &nbsp;
                <input type="button" onclick="window.location.href='${ctxpath}/board/list.do'" class="btn btn-jungho" value="목록보기">
              </h6>
            </ul> 
          </div>
        </div>
        
      </div>
      
    <br>
    
        <div class="container">
          <div class="row" data-aos="fade-up" data-aos-duration="700">
            <div class="col-sm-12">
            	<div class="sibal">
	            	<div id="image_container" oninput="setThumbnail(event);" class="write_column_image">
									<c:if test="${dto.fileupload != null}">
										<img src="${ctxpath}/${imgspath}/${dto.fileupload}" width="auto" height="auto">
									</c:if>
								</div>
							</div>
            </div>
          </div>
        </div>
        
        
      <br>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
              <div class="social-buttons" data-aos="fade-up" data-aos-duration="700">
	          <div class="row">
	            <div class="col-sm-5 col-md-6">
	              <div class="inner-jungho">
	  							<h2> 
	  								&nbsp; &nbsp; &nbsp; 
	  								<input type="text" name="subject" id="subject" placeholder="제목을 입력하세요"> 
	  							</h2> 
	  							<span> &nbsp;
    								<h3> <input type="text" name="writer" id="writer" placeholder="이름을 입력하세요">
    							</span> </h3>
    							<span> 
    								<h3>
    									<input type="password" name="pw" id="pw" class="write_column_two" placeholder="암호를 입력하세요">
    								</h3>
    							</span>
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
            
				 	<div class="row" data-aos="fade-up" data-aos-duration="700">
				  	<div class="col-sm-12 col-lg-12 box">
				      <textarea name="content" id="content" class="write_column_textarea" placeholder="내용을 입력하세요"></textarea>
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
		                          <p class="card-text"> <a href="blog_single.html"> 최고급 소고기  /a> </p>
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
  </form>
</body>
</html>

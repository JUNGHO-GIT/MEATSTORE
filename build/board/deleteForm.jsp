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
  <link rel="stylesheet" href="css/board.css">

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"> </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"> </script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"> </script>
  <script src="js/animate.js"> </script>
  <script src="js/custom.js"> </script>
  <script src="js/board.js"> </script>
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
  
  <script type="text/javascript">
	//delpwcheck()
	function delpwcheck() {
		if(document.delForm.pw.value == null) {
			alert("암호는 필수입력");
			document.delForm.pw.focus();
			return false;
		}
		return true;
	}
	</script>
	
</head>

<!--[Body]----------------------------------------------------------------------------------------->
<body>

	<!-- form --------------------------------------------------------------------------------------->
	<form name="delForm" method="post" enctype="multipart/form-data" action="${ctxpath}/board/deletePro.do?pageNum=${pageNum}" 
	onsubmit="return delpwcheck()">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pw" id="pw" value="${dto.pw}">
		
		<section class="section-1">
	    <div class="jumbotron d-flex align-items-center">
	      <div class="gradient"> </div>
	        <div class="container-fluid content">
	        <h1 data-aos="fade-right" data-aos-delay="300"> 자유게시판 </h1>
	        <h2 data-aos="fade-left" data-aos-delay="300"> [글 삭제하기] </h2>
	      </div>
	    </div>
  	</section>
  	
  				<div class="component-jungho3">
				    <div class="col-sm-12">
				      <ul>
				        <h6>
					        <input type="password" name="pw" id="pw" placeholder="암호를 입력하세요">
					        <input type="submit" value="삭제" class="btn btn-jungho">
					        <input type="reset" value="다시쓰기" onclick="window.location.reload()" class="btn btn-jungho">
					        <input type="button" value="취소" onclick="window.location.href='${ctxpath}/board/list.do?pageNum=${pageNum}'" class="btn btn-jungho">
					        <input type="button" onclick="window.location.href='${ctxpath}/board/list.do'" value="목록보기" class="btn btn-jungho">
				      	</h6>
			      	</ul> 
			    	</div>
			    </div>
			  <br>
	</form>
</body>

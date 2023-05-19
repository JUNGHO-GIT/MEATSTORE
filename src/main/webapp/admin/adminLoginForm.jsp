<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />

<!doctype html>
<html lang="en, ko">

	<body>

		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">로그인 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[관리자]</h2>
				</div>
			</div>
		</section>

    <!-- section -->
    <section>
    	<div class="row">
    		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
    			<script>
    				function findAddr() {

    					new daum.Postcode({
    						oncomplete: function(data) {
    							document.getElementById('zipcode').value = data.zonecode;
    							document.getElementById('addr').value = data.address;
    						}
    					}).open();
    				}

    				function idCheck() {
    					if ($('#id').val() == '') {
    						alert("id를 입력 하세요");
    						$('#id').focus();
    						return false;
    					}
    					else {
    						$.ajax({
    							type: "POST",
    							url: "confirmID.jsp",
    							data: "id=" + $('#id').val(),
    							dataType: "JSON",
    							success: function(data) {
    								if (data.x == 1) {
    									alert("사용 중인 id입니다");
    									$('#id').val('').focus();
    								}
    								else {
    									alert("사용 가능한id입니다");
    									$('#idck').val('true');
    									$('#pw').focus();
    								}
    							}
    						})

    					}
    				}

    				function aa() {
    					if ($('#idck').val() == 'false') {
    						alert("id중복 체크 하세요");
    						$('#id').focus();
    						return false;
    					}
    				}
    			</script>
    			<form name="adminloginForm" method="post" action="${ctxpath}/admin/adminLoginPro.do">
            <div class="form-group">
              <input class="form-control" type="text" name="adminid" id="adminid" size="20" placeholder="아이디를 입력해주세요" />
            </div>
            <div class="form-group">
              <input class="form-control" type="password" name="adminpw" id="adminpw" size="20" placeholder="비밀번호를 입력해주세요" />
            </div>
            <div class="btn btn-group">
            	<button class="btn btn-jungho mt-2" type="submit">로그인</button>
              <button class="btn btn-secondary mt-2" type="reset">취소</button>
            </div>
				  </form>
        </div>
      </div>
		</section>
	</body>
</html>
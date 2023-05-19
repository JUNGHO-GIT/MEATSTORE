<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>

<!doctype html>
<html lang="en, ko">

	<body>

		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300">회원가입</h1>
					<h2 data-aos="fade-left" data-aos-delay="300">[회원가입을 환영합니다]</h2>
				</div>
			</div>
		</section>

		<!-- section -->
		<section>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
					<form name="insertForm" class="m-4" method="post" action="${ctxpath}/member/insertPro.do" onSubmit="return check2()">
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" type="text" name="id" id="id" size="20" placeholder="아이디를 입력해주세요" />
								<input type="hidden" name="idck" id="idck" value="false" />
								<button class="btn btn-jungho" type="button" onClick="idCheck()">ID중복체크</button>
							</div>
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="pw" id="pw" size="12" onFocus="aa()" placeholder="비밀번호를 입력해주세요" />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="pw2" id="pw2" size="12" placeholder="비밀번호를 한번 더 입력해주세요" />
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="name" id="name" size="30" placeholder="이름을 입력해주세요" />
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="email" id="email" size="30" placeholder="이메일을 입력해주세요" />
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="tel" id="tel" size="14" placeholder="전화번호를 입력해주세요" />
						</div>
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" type="text" name="addr" id="addr" size="50" readonly placeholder="주소를 입력해주세요" />
								<button class="btn btn-jungho" type="button" onClick="findAddr()">주소찾기</button>
							</div>
							<input class="form-control" type="text" name="addr2" id="addr2" size="20" placeholder="상세주소를 입력해주세요" />
							<input class="form-control" type="text" name="zipcode" id="zipcode" size="7" readonly placeholder="우편번호" />
						</div>
						<div class="btn btn-group">
							<button class="btn btn-jungho mt-2" type="submit">가입하기</button>&nbsp;&nbsp;
							<button class="btn btn-jungho mt-2" type="reset">재입력</button>&nbsp;&nbsp;
							<button class="btn btn-jungho mt-2" type="button" onClick="location='${ctxpath}/index.jsp'">가입안함</button>&nbsp;&nbsp;
						</div>
					</form>
				</div>
			</div>
		</section>

    <!-- script -->
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

	</body>
</html>
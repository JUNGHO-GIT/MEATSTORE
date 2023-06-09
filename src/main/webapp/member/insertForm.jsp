<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />

<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="dao.*" %> <%@ page import="dto.*" %>

<script>
  // ---------------------------------------------------------------------------------------------->
  function check2()  {
    if ($("#id").val() == "") {
      alert("ID를 입력 하세요");
      $("#id").focus();
      return false;
    }
    if ($("#pw").val() == "") {
      alert("암호를 입력 하세요");
      $("#pw").focus();
      return false;
    }
    if ($("#pw2").val() == "") {
      alert("암호확인를 입력 하세요");
      $("#pw2").focus();
      return false;
    }
    if ($("#pw").val() != $("#pw2").val()) {
      alert("암호와 암호확인이 다릅니다");
      $("#pw").val("").focus();
      $("#pw2").val("");
      return false;
    }
    if ($("#name").val() == "") {
      alert("이름을 입력 하세요");
      $("#name").focus();
      return false;
    }
    if ($("#email").val() == "") {
      alert("이메일을 입력 하세요");
      $("#email").focus();
      return false;
    }
    if ($("#tel").val() == "") {
      alert("전화을 입력 하세요");
      $("#tel").focus();
      return false;
    }
    return true;
  }

  // ---------------------------------------------------------------------------------------------->
  function findAddr()  {
    new daum.Postcode({
      oncomplete: function (data)  {
        document.getElementById("zipcode").value = data.zonecode;
        document.getElementById("addr").value = data.address;
      },
    }).open();
  }

  // ---------------------------------------------------------------------------------------------->
  function idCheck()  {
    if ($("#id").val() == "") {
      alert("id를 입력 하세요");
      $("#id").focus();
      return false;
    }
    else {
      $.ajax({
        type: "POST",
        url: "confirmID.jsp",
        data: "id=" + $("#id").val(),
        dataType: "JSON",
        success: function  (data)  {
          if (data.checkParam == 1) {
            alert("사용 중인 ID 입니다");
            $("#id").val("").focus();
          }
          else {
            alert("사용 가능한ID 입니다");
            $("#idck").val("true");
            $("#pw").focus();
          }
        },
      });
    }
  }

  // ---------------------------------------------------------------------------------------------->
  function aa() {
    if ($("#idck").val() == "false") {
      alert("id중복 체크 하세요");
      $("#id").focus();
      return false;
    }
  }
</script>

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
<section class="section">
  <form name="insertForm" class="m-4" method="POST" action="${ctxPath}/member/insertPro.do" onSubmit="return check2()">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <table class="table table-borderless">
          <tr>
            <th style="width: 100px; border-top: transparent;">아이디</th>
            <th>
              <div class="input-group">
								<input class="form-control" type="text" name="id" id="id" placeholder="아이디를 입력해주세요" required />
								<input type="hidden" name="idck" id="idck" value="false" />
								<button class="btn btn-jungho" type="button" onclick="return idCheck();">
                ID중복체크</button>
							</div>
            </th>
          </tr>
          <tr>
            <th style="width: 100px;">비밀번호</th>
            <th><input class="form-control" type="password" name="pw" id="pw" onFocus="aa()" placeholder="비밀번호를 입력해주세요" required /></th>
          </tr>
          <tr>
            <th style="width: 100px;">확인</th>
            <th><input class="form-control" type="password" name="pw2" id="pw2" placeholder="비밀번호를 한번 더 입력해주세요" required /></th>
          </tr>
          <tr>
            <th style="width: 100px;">이름</th>
            <th><input class="form-control" type="text" name="name" id="name" placeholder="이름을 입력해주세요" required /></th>
          </tr>
          <tr>
            <th style="width: 100px;">이메일</th>
            <th><input class="form-control" type="email" name="email" id="email" placeholder="이메일을 입력해주세요" required /></th>
          </tr>
          <tr>
            <th>전화번호</th>
            <label for="tel" class="form-label"></label>
            <th><input class="form-control" type="tel" name="tel" id="tel" placeholder="전화번호를 입력해주세요" required /></th>
          </tr>
          <tr>
            <th style="width: 100px;">주소</th>
            <th>
              <div class="input-group">
								<input class="form-control" type="text" name="addr" id="addr" placeholder="주소를 입력해주세요" required />
								<button class="btn btn-jungho" type="button" onclick="findAddr()">주소찾기</button>
							</div>
                <input class="form-control" type="text" name="addr2" id="addr2" placeholder="상세주소를 입력해주세요" required />
                <input class="form-control" type="text" name="zipcode" id="zipcode" size="7" readonly placeholder="우편번호" required />
            </th>
          </tr>
        </table>
      </div>
    </div>
    <br/>
    <br/>

    <!-- button -->
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 d-flex justify-content-center align-items-center">
        <div class="btn btn-group d-flex justify-content-center align-items-center">
          <button class="btn btn-jungho mt-2" type="submit">가입하기</button>
          &nbsp;&nbsp;
          <button class="btn btn-jungho mt-2" type="button" onclick="window.location.reload()">
          다시작성</button>
          &nbsp;&nbsp;
           <button class="btn btn-secondary mt-2" type="button" onclick="window.location.href='${ctxPath}/index.jsp'">취소</button>
          &nbsp;&nbsp;
        </div>
      </div>
    </div>

  </form>
</section>
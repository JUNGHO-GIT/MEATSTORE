<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/header/header.jsp" %>
<%--loginForm.jsp --%>

<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
   
      <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
      <script type="text/javascript" src="aa.js"></script>
      <link rel="stylesheet" type="text/css"
	href="${ctxpath}/css/loginForm_css.css">


</head>
<body >
      <h2>로그인</h2>
      
      <form name="loginForm" method="post" action="${ctxpath}/member/loginPro.do" onSubmit="return loginCheck()">
         <table class = "dataTable" >
               
         <tr>
         <%--
            <td>ID</td>  --%>
            <td><input type="text" name="id" id="id" size="20" placeholder="ID를 입력해주세요."></td>
         </tr>
         
         
         <tr>
         <%--
            <td>암호</td> --%>
            <td><input type="password" name="pw" id="pw" size="20" placeholder="비밀번호를 입력해주세요."></td>
         </tr>
         
               
             
            <tr>
               <td colspan="2" align="center"  class="submit_id">
                  <input type="submit"  id="submit_button" value="로그인"><br>
                  <input type="reset" value="다시입력"><br>
                  <input type="button" value="관리자 로그인" onClick="location='${ctxpath}/admin/adminLoginForm.do'">
               </td>
            </tr>   
         </table>
      </form>
      
</body>
</html>
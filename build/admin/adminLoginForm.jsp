<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
	 function adminCheck(){
		 if($('#adminid').val()==''){
			 alert("adminID를 입력하세요");
			 $('#adminid').focus();
			 return false;
		 }
		 if($('#adminpw').val()==''){
			 alert("암호를 입력하세요");
			 $('#adminpw').focus();
			 return false;
		 }
		 //return true
		 document.adminloginForm.submit();//서버로 전송
		 //<input type="button" value="" onClick="">
	 }//adminCheck()-end
	</script>
</head>
<body>
	<h2>관리자 로그인</h2>
		<form name="adminloginForm" method="post" action="${ctxpath}/admin/adminLoginPro.do">
			<table border="1">
				<tr>
					<td>관리자ID</td>
					<td>
					<input type="text" name="adminid" id="adminid" size="20">
					</td>
				</tr>
				
				<tr>
					<td>관리자 암호</td>
					<td>
					<input type="password" name="adminpw" id="adminpw" size="20">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<input type="button" value="로그인" onClick="adminCheck()">
					<input type="button" value="취소" onClick="location='${ctxpath}/template/template.jsp'">
					</td>
				</tr>	
			</table>
		</form>

</body>
</html>
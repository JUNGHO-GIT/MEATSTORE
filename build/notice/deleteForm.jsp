<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--/notice/deleteForm.jsp --%>
<%@ include file = "/header/header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 후에 css넣어야함 -->
<!-- <link rel="stylesheet" type="text/css" href=""> -->
<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="check.js"></script>
<script>
      function pwcheck(){
    	  if(document.delForm.pw.value==""){
    		  alert("암호는 필수 입력입니다.");
    		  document.delForm.pw.focus();
    		  return false
    	  }
    	  return true;
      }
    </script>
</head>
<body>
	<h2>글 삭제</h2>
	<form name="delForm" method="post"
		action="${ctxpath}/notice/deletePro.do?pageNum=${pageNum}"
		onSubmit="return pwcheck()">

		<table border="1" width="350">
			<tr>
				<td colspan="2">
				<h4>암호를 입력 하세요.</h4>
				</td>
			</tr>		
						
			<tr>
				<td>
				<h4>암호</h4>
				<input type="password" name="pw" id="pw" size="12">
				<input type="hidden" name="num" value="${num}">
				</td>
			</tr>		
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글 삭제">
					<input type="button" value="리스트"
					onClick="location='${ctxpath}/notice/list.do?pageNum=${pageNum}'"></td>
			</tr>
		</table>
		</form>
</body>
</html>
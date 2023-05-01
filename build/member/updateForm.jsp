<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--updateForm.jsp --%>
<%@ include file="/header/header.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="aa.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
	<script>
	 function findAddr(){
	       
	     new daum.Postcode({
	         oncomplete:function(data){
	            document.getElementById('zipcode').value=data.zonecode;
	            document.getElementById('addr').value=data.address;
	            }
	         }).open();
	      }//openDaumPostcode()---
	</script>	
</head>
<body>
	<h2>내정보 수정</h2>
	<form method="post" action="${ctxpath}/member/updatePro.do" onSubmit="return updateCheck()">
	<table border="1">
			
			
			<tr>
				<td>ID</td>
					<td>
						${dto.id}
							<input type="hidden" name="id" id="id" value="${dto.id}">
					</td>
			</tr>
			
			
			<tr>
				<td>암호</td>
				<td>
					<input type="password" name="pw" id="pw" size="20">
				</td>
			</tr>
			
			
			<tr>
				<td>암호확인</td>
				<td>
					<input type="password" name="pw2" id="pw2" size="20">
				</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" size="40" value="${dto.name}"></td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" id="email" size="40" value="${dto.email}"></td>
			</tr>
			
			
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" id="tel" size="40" value="${dto.tel}"></td>
			</tr>
			
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" name="zipcode" id="zipcode" size="7" value="${dto.zipcode}"readonly>
					<input type="button" value="주소찾기" onClick="findAddr()">
				</td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" id="addr" size="50" value="${dto.addr}" readonly></td>
			</tr>
				
				<tr>
					<td>상세주소</td>
					<td><input type="text" name="addr2" id="addr2" size="20" value="${dto.addr2}"></td>
				</tr>
				
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="내정보수정">
					<input type="reset" value="다시입력">
					<input type="button" value="취소" onClick="location.href='${ctxpath}/template/template.jsp'">
				</td>
			</tr>						
	</table>
	</form>
</body>
</html>
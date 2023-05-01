<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopdb.*"%>
    
<%@ include file="/header/header.jsp" %>
<%--cartPro.jsp --%>

<jsp:useBean id="cartMgr" class="shopdb.CartMgr" scope="session">
</jsp:useBean>

<jsp:useBean id="orderDTO" class="shopdb.OrderDTO">
 <jsp:setProperty name="orderDTO" property="*"/>
</jsp:useBean>

<%
String state=request.getParameter("state");
orderDTO.setState(state);

String flag=request.getParameter("flag"); //script.js에서 가져옴 flag
%>
<c:if test="${empty sessionScope.id}">
  <meta http-equiv="Refresh" content="0;url=${ctxpath}/member/loginForm.do"> 
</c:if>

<c:if test="${!empty sessionScope.id}">
  <%
   String id=(String)session.getAttribute("id");
  
   if(flag==null){//장바구니에 넣으면
		orderDTO.setUserid(id);
		cartMgr.addCart(orderDTO);
		%>
		<script>
		alert("장바구니에 담았습니다");
		</script>
		<meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/cartList.do">
		
	<%	
	}else if(flag.equals("update")){
		orderDTO.setUserid(id);
		cartMgr.updateCart(orderDTO);//장바구니 내용 수정하는 메서드 호출
		%>
		<script>
		alert("장바구니 내용이 수정 되었습니다");
		</script>
		<meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/cartList.do">
		
		
	<%
	}else if(flag.equals("del")){
		cartMgr.deleteCart(orderDTO);//장바구니에서 제거하는 메서드
	%>
		<script>
		  alert("장바구니 목록이 삭제되었습니다");
		</script>
		<meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/cartList.do">
	<%
	}//else if-end
	%>
</c:if>
 
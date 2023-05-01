<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="shopdb.*"%>
<%@ include file="/module/header.jsp" %>

<jsp:useBean id="cartMgr" class="shopdb.CartMgr" scope="session"></jsp:useBean>

<jsp:useBean id="orderDTO" class="shopdb.OrderDTO">
  <jsp:setProperty name="orderDTO" property="*" />
</jsp:useBean>

<%
  String state=request.getParameter("state");
  orderDTO.setState(state);
  String flag=request.getParameter("flag");
%>

<c:if test="${empty sessionScope.id}">
  <meta http-equiv="Refresh" content="0;url=${ctxpath}/member/loginForm.do" />
</c:if>

<c:if test="${!empty sessionScope.id}">
  <%
    String id=(String)session.getAttribute("id");
    if(flag==null) {
  %>
  <script>
    alert("장바구니에 담았습니다");
  </script>

  <meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/cartList.do" />

  <%
    }
    else if(flag.equals("update")) {
      orderDTO.setUserid(id);
      cartMgr.updateCart(orderDTO);
  %>

  <script>
    alert("장바구니 내용이 수정 되었습니다");
  </script>

  <meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/cartList.do" />

  <%
    }
    else if(flag.equals("del")) {
      cartMgr.deleteCart(orderDTO);
  %>

  <script>
    alert("장바구니 목록이 삭제되었습니다");
  </script>

  <meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/cartList.do" />

  <%
    }
  %>

</c:if>
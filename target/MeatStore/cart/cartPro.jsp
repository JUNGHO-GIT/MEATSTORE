<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="cartDAO" class="dao.CartDAO" scope="session">
</jsp:useBean>

<jsp:useBean id="orderListDTO" class="dto.OrderListDTO">
  <jsp:setProperty name="orderListDTO" property="*" />
</jsp:useBean>

<%
  String state=request.getParameter("state");
  orderListDTO.setState(state);
  String flag=request.getParameter("flag");
%>

<c:if test="${empty sessionScope.id}">
  <script>
    alert("로그인 후 이용해 주세요");
    setTimeout(function() {
      window.location.href = "${ctxpath}/member/loginForm.do";
    }, 100);
  </script>
</c:if>

<c:if test="${!empty sessionScope.id}">
  <%
    String id=(String)session.getAttribute("id");
    if(flag==null) {
  %>

  <script>
    alert("장바구니에 담았습니다");
    setTimeout(function() {
      window.location.href = "${ctxpath}/cart/list.do";
    }, 100);
  </script>

  <%
    }
    else if(flag.equals("update")) {
      orderListDTO.setUserid(id);
      cartDAO.updateCart(orderListDTO);
  %>

  <script>
    alert("장바구니 내용이 수정 되었습니다");
    setTimeout(function() {
      window.location.href = "${ctxpath}/cart/list.do";
    }, 100);
  </script>

  <%
    }
    else if(flag.equals("del")) {
      cartDAO.deleteCart(orderListDTO);
  %>

  <script>
    alert("장바구니 목록이 삭제되었습니다");
    setTimeout(function() {
      window.location.href = "${ctxpath}/cart/list.do";
    }, 100);
  </script>


  <%
    }
  %>

</c:if>
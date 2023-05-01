<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="shopdb.*" import="java.util.*" %>
<%@ include file="/module/header.jsp" %>
<jsp:useBean id="cartMgr" class="shopdb.CartMgr" scope="session" />
<jsp:useBean id="orderDAO" class="shopdb.OrderDAO" />
<%
  ProductDAO productDAO = ProductDAO.getInstance();
  Hashtable hcart = cartMgr.getCartList();
  Enumeration hcartKeys = hcart.keys();

  if (hcart.size() != 0) {
    while (hcartKeys.hasMoreElements()) {
      OrderDTO orderDTO = (OrderDTO) hcart.get(hcartKeys.nextElement());
      try {
        productDAO.reduceProduct(orderDTO);
        String result = orderDAO.insertOrder(orderDTO);
        if (result.equals("noItem")) {
%>
<script>
	alert("남아있는 수량이 부족합니다");
	history.back();
</script>
<%
        } else if (result.isEmpty() || result.length() < 1) {
          cartMgr.deleteCart(orderDTO);
        }
      } catch (Exception ee) {
        System.out.println("orderPro.do" + ee);
      }
    }
%>
<script>
	alert("주문처리 되었습니다!");
	location.href = "../shop/orderList.do";
</script>
<%
  }
%>
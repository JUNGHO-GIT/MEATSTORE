<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="shopdb.*" import="java.util.*" %>
<%@ include file="/module/header.jsp" %>
<%
  ProductDAO productDAO = ProductDAO.getInstance();
  OrderDAO orderDAO = new OrderDAO();

  String flag = request.getParameter("flag");
  boolean result = false;
  int iti = 0;

  if (flag.equals("delete")) {
    Vector vec = orderDAO.getOrderList();
    if (vec.size() == 0) {
      int im_pro_no = Integer.parseInt(request.getParameter("pro_no"));
      result = productDAO.deleteProduct(request, im_pro_no);
    }
    response.sendRedirect(request.getContextPath() + "/shop/productList.do");
  }
  else {
    Vector vec = orderDAO.getOrderList();
    for (int i = 0; i < vec.size(); i++) {
      OrderDTO orderDTO = (OrderDTO) vec.get(i);
      int pro_no = orderDTO.getPro_no();
      if (pro_no == Integer.parseInt(request.getParameter("pro_no"))) {
        iti++;
      }
    }
    if (iti == 0) {
      int im_pro_no = Integer.parseInt(request.getParameter("pro_no"));
      result = productDAO.deleteProduct(request, im_pro_no);
      response.sendRedirect(request.getContextPath() + "/shop/productList.do");
    }
    else {
      result = false;
    %>
      <script>
        alert("주문 상태여서 삭제 못함");
        window.location.href = "${ctxpath}/shop/productList.do";
      </script>
    <%
    }
  }
%>

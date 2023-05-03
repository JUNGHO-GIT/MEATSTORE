<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>
<%
  ProductDAO productDAO = ProductDAO.getInstance();
  OrderListDAO orderListDAO = new OrderListDAO();

  String flag = request.getParameter("flag");
  boolean result = false;
  int iti = 0;

  if (flag.equals("delete")) {
    Vector vec = orderListDAO.getOrderList();
    if (vec.size() == 0) {
      int im_pro_no = Integer.parseInt(request.getParameter("pro_no"));
      result = productDAO.deleteProduct(request, im_pro_no);
    }
    response.sendRedirect(request.getContextPath() + "/product/list.do");
  }
  else {
    Vector vec = orderListDAO.getOrderList();
    for (int i = 0; i < vec.size(); i++) {
      OrderListDTO orderListDTO = (OrderListDTO) vec.get(i);
      int pro_no = orderListDTO.getPro_no();
      if (pro_no == Integer.parseInt(request.getParameter("pro_no"))) {
        iti++;
      }
    }
    if (iti == 0) {
      int im_pro_no = Integer.parseInt(request.getParameter("pro_no"));
      result = productDAO.deleteProduct(request, im_pro_no);
      response.sendRedirect(request.getContextPath() + "/product/list.do");
    }
    else {
      result = false;
    %>
      <script>
        alert("주문 상태여서 삭제 못함");
        window.location.href = "/product/list.do";
      </script>
    <%
    }
  }
%>

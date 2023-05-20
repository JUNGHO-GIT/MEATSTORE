<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="imgsPath" value="${ctxPath}/res/imgs" />
<c:set var="uploadPath" value="${ctxPath}/res/upload" />
<c:set var="cloudPath" value="https://storage.googleapis.com/jungho-bucket/MEATSTORE" />
<% request.setCharacterEncoding("UTF-8"); %>
<%
  ProductDAO productDAO = ProductDAO.getInstance();
  OrderDAO orderDAO = new OrderDAO();

  String flag = request.getParameter("flag");
  boolean result = false;
  int iti = 0;

  if (flag.equals("delete")) {
    Vector vec = orderDAO.getOrder();
    if (vec.size() == 0) {
      int im_num = Integer.parseInt(request.getParameter("num"));
      result = productDAO.deleteProduct(request, im_num);
    }
    response.sendRedirect(request.getConnectiontextPath() + "/product/listForm.do");
  }
  else {
    Vector vec = orderDAO.getOrder();
    for (int i = 0; i < vec.size(); i++) {
      OrderDTO orderDTO = (OrderDTO) vec.get(i);
      int num = orderDTO.getNum();
      if (num == Integer.parseInt(request.getParameter("num"))) {
        iti++;
      }
    }
    if (iti == 0) {
      int im_num = Integer.parseInt(request.getParameter("num"));
      result = productDAO.deleteProduct(request, im_num);
      response.sendRedirect(request.getConnectiontextPath() + "/product/listForm.do");
    }
    else {
      result = false;
    %>
      <script>
        alert("주문 상태여서 삭제 못함");
        window.location.href = "/product/listForm.do";
      </script>
    <%
    }
  }
%>

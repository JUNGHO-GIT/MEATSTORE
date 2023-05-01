<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopdb.*"
    import="java.util.*"
    %>
    <%@ include file="/header/header.jsp" %>
<%--orderList.jsp --%>
<jsp:useBean id="orderDAO" class="shopdb.OrderDAO"/><%--객체생성 --%>
<%
ProductDAO productDAO=ProductDAO.getInstance();//객체얻기
%>

<%
if(session.getAttribute("id")==null){
   %>
     <meta http-equiv="Refresh" content="0;url=${ctxpath}/member/loginForm.do">
   <%
}
String id=(String)session.getAttribute("id");
%>
<html>
<head>
   <script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
   <script type="text/javascript" src="script.js"></script>
	<link rel="stylesheet" type="text/css"
			href="${ctxpath}/css/productList_css.css">
</head>

<body>
  <table width="80%" class = "dataTable">
    <tr>
      <td align="center">
        <font size="5" color = "#9B111E"><b><%=id %>님의 구매 목록</b></font>
      </td>
    </tr>
    
    


    
    <tr >
      <td align="center" >
        <table width="90%">
          <tr>
            <td>주문번호</td>
            <td>제품</td>
            <td>주문수량</td>
            <td>주문날짜</td>
            <td>주문상태</td>
          </tr>
          <%
          Vector vec=orderDAO.getOrder(id);//메서드 호출
          
          if(vec.size()==0){
             out.println("구매목록이 없습니다.");
          }else{//구매목록이 있을 때
             for(int i=0; i<vec.size(); i++){
                OrderDTO orderDTO=(OrderDTO)vec.get(i);
                int pro_no=orderDTO.getPro_no();
                
                ProductDTO productDTO=productDAO.getProduct(pro_no);
                %>
                <tr>
                  <td><%=orderDTO.getOrdno() %></td>
                  
                  <td>
                    <!-- 상품이름을 클릭하면 상세보기로 가기 -->
                    <a href="javaScript:productDetail('<%=productDTO.getCode()%>')">
                      <%=productDTO.getName() %>
                    </a>
                  </td>
                  
                  <td><%=orderDTO.getQuantity() %></td>
                  <td><%=orderDTO.getOrddate() %></td>
                  
                  <td>
                  <!-- 주문 상태 -->
                  <%
                  switch(Integer.parseInt(orderDTO.getState())){
                  case 1:
                     out.println("접수중");
                     break;
                  case 2:
                     out.println("접수");
                     break;
                  case 3:
                     out.println("입금확인");
                     break;
                  case 4:
                     out.println("배송준비");
                     break;
                  case 5:
                     out.println("배송중");
                     break;
                  case 6:
                     out.println("배송완료");
                     break;
                  }//switch-end
                  %>
                  </td>
                </tr>
                <%
             }//for-end
          }//else-end
          %>
        </table>
      </td>
    </tr>
  </table>
    <form name="detail" action="${ctxpath}/shop/productDetail.do">
      <input type="hidden" name="code"><!--  code값은 javaScript에서 넣는다 -->
    </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopdb.*"
    import="java.util.*"
    %>
<%@ include file="/header/header.jsp" %>
<jsp:useBean id="cartMgr" class="shopdb.CartMgr" scope="session"/>
<jsp:useBean id="orderDAO" class="shopdb.OrderDAO"/><%--객체생성 --%>
<%
ProductDAO productDAO=ProductDAO.getInstance();
Hashtable hcart=cartMgr.getCartList();

Enumeration hcartKeys=hcart.keys();
if(hcart.size() != 0){//장바구니에 내용이 있으면
while(hcartKeys.hasMoreElements()){//자료가 있는 동안 반복 실행
    OrderDTO orderDTO=(OrderDTO)hcart.get(hcartKeys.nextElement());
    
    try{
       productDAO.reduceProduct(orderDTO);//남은 물량 계산
    
       String result=orderDAO.insertOrder(orderDTO);//주문내용 insert
       //System.out.println("result:"+result);
       if(result=="noItem"){
          %>
          <script>
          alert("남아있는 수량이 부족합니다");
          history.back();
          </script>
          <%
       }
       if(result=="" || result.length()<1){
            cartMgr.deleteCart(orderDTO);//장바구니 비우기
          }//if-end
       
      }catch(Exception ee){
       System.out.println("orderPro.do"+ee);
   }
 }//while-end

 %>
 <script>
 alert("주문처리 되었습니다!");
 location.href="../shop/orderList.do";
 </script>

 <%
 }
%>

	

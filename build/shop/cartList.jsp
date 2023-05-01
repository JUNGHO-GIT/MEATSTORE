<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopdb.*"
    import="java.util.*"
    %>
<%@ include file="/header/header.jsp" %>
<jsp:useBean id="cartMgr" class="shopdb.CartMgr" scope="session"/>
<%
OrderDTO orderDTO=null;
ProductDTO productDTO=null;
ProductDAO productDAO=null;
Hashtable hcart=null;

productDAO=ProductDAO.getInstance();
%>
<c:if test="${empty sessionScope.id }">
  <meta http-equiv="Refresh" content="0;url=${ctxpath}/member/loginForm.do">
</c:if>

<c:if test="${!empty sessionScope.id }">
  <html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>
			
			<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
			<script type="text/javascript" src="script.js"></script>
			<link rel="stylesheet" type="text/css"
			href="${ctxpath}/css/productList_css.css">
		</head>
		
		
		<body>
		  <table align="center"  class = "dataTable">
		    <tr>
		      <td align="center">
		        <table width="1000">
		          <tr id = "list">
		            <td>제품</td>
		            <td>수량</td>
		            <td>가격</td>
		            <td>수정/삭제</td>
		            <td>조회</td>
		          </tr>
		<%
		int totalPrice=0;
		hcart=cartMgr.getCartList();//장바구니 내용 모두 담기
		
		if(hcart.size()==0){
			out.println("<tr><td align=center colspan='5'>장바구니 내용이 비어 있습니다</td></tr>");
		}else{//장바구니 내용이 있으면
			out.println("<tr><td align=center colspan='5'>장바구니에 들어있는 상품 목록</td></tr>");
			Enumeration hcartKeys=hcart.keys();
			
			while(hcartKeys.hasMoreElements()){//자료가 있는 동안 반복
				orderDTO=(OrderDTO)hcart.get(hcartKeys.nextElement());
				productDTO=productDAO.getProduct(orderDTO.getPro_no());
				
				int price=productDTO.getPrice();//가격
				int quantity=Integer.parseInt(orderDTO.getQuantity());
				int subTotal=price*quantity;
				totalPrice +=subTotal;//전체 금액 계산
				%>
				<form method="post" action="cartPro.do">
				  <input type="hidden" name="pro_no" value="<%=productDTO.getPro_no()%>">
				  <input type="hidden" name="flag">
				  <input type="hidden" name="state" value="1">
				  <tr>
				    <td><%=productDTO.getName()%></td>
				    <td>
				    <input type="text" name="quantity" id="quantity" value="<%=orderDTO.getQuantity()%>" size="5">
				    </td>
				    <td><%=subTotal%></td>
				    
				    <td>
				    <input type="button" value="장바구니 수정" onClick="javaScript:cartUpdate(this.form)">
				    <input type="button" value="장바구니 삭제" onClick="javaScript:cartDelete(this.form)">
				    </td>
				    
				    <td>
				    <a href="javaScript:productDetail('<%=productDTO.getCode() %>')">상세보기</a>
				    </td>
				  </tr>
				</form>
				<%
			}//while-end
			%>
			
			<tr>
			  <td colspan="4" align="right">
			<%
			String totalPriceStr=String.format("%d",totalPrice);
			%>
			총 금액:<%=totalPriceStr%>
			</td>
			  <td align="center">
			  
			  <a href="${ctxpath}/shop/orderPro.do">주문하기</a>
			  </td>
			</tr>
			</form>
			<%		
		}//else-end
		%>
		 </table>
		 </td>
		</tr> 
	 </table>
	 <form name="detail" method="post" action="${ctxpath}/shop/productDetail.do">
	   <input type="hidden" name="code">
	 </form>
  </body>
  </html>
</c:if> 
		
	 
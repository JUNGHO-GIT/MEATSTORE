<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopdb.*"
    import="java.util.*"
    %>
<%@ include file="/header/header.jsp"%>
<%
ProductDAO productDAO=ProductDAO.getInstance();
%>
<jsp:useBean id="orderDAO" class="shopdb.OrderDAO"/>

<%String flag=request.getParameter("flag");
boolean result=false;

int iti=0;

if(flag.equals("delete")){
	Vector vec=orderDAO.getOrderList();
	
	if(vec.size()==0){
		int im_pro_no=Integer.parseInt(request.getParameter("pro_no"));
		result=productDAO.deleteProduct(request, im_pro_no);
		%>
		<meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/productList.do">
		<%
		
	}else{
		for(int i=0; i<vec.size(); i++){
			OrderDTO orderDTO=(OrderDTO)vec.get(i);//장바구니에 있는 경우
			int pro_no=orderDTO.getPro_no();
			
			if(pro_no==Integer.parseInt(request.getParameter("pro_no"))){
				iti++;//주문상황
			}
		}//for-end	
		if(iti==0){//주문 상황이 아니면 삭제
			int im_pro_no=Integer.parseInt(request.getParameter("pro_no"));
			result=productDAO.deleteProduct(request, im_pro_no);//
			%>
			<meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/productList.do">
			<%
		}else{
			result=false;
			%>
			<script>
				alert("주문 상태여서 삭제 못함");
			</script>
				<meta http-equiv="Refresh" content="0;url=${ctxpath}/shop/productList.do">
			<%
		}//
	}
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    %>
<%--confirmID.jsp --%>
<%
String id=request.getParameter("id");//Ajax에서 넘겨준 데이터 받기 
MemberDAO dao=MemberDAO.getInstance();//dao객체 얻기 
int x=dao.confirmID(id);//dao메서춯 , 결과 받고
%>
{
"x":<%=x%>
}
 
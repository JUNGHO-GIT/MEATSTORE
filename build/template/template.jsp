<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>


<link rel="stylesheet" type="text/css"
	href="${ctxpath}/css/template_css.css">

<html>
<body>
 <table width="100%" height="80%" >
 	<tr class="menulist" >
	  <td  width="10%" valign="top" >
	    <a href="${ctxpath}/template/template.jsp">
	    <img src="${ctxpath}/imgs/logo.png"
	    width = "150px" height="150px" >
	    
	    </a>
	  </td> 
	  <td align="center">
	    <%@ include file="/module/top.jsp"%><br>
	  </td>
	  
	  <td align="right">
	  <%@ include file="/member/main.jsp" %>
	  </td>
	 </tr>
 
	 <tr valign="top">
	  <td align="center" colspan="3">
	  
	    <c:if test="${CONTENT!=null}">
	      <jsp:include page="${CONTENT}" flush="false"/>
	    </c:if>
	    
	    <c:if test="${CONTENT==null}">
	      
	    
	    
	    <div class="div1"></div>
	    
	      
	    <%-- 비디오 삽입 --%>
	     <video autoplay loop muted>
	    <source src="${ctxpath}/imgs/meat_video.mp4" type="video/mp4" >
	 	 </video>
	 	 <%--  <img id="im"  src="${ctxpath}/imgs/store2.jpg"/>
	    --%>
	    
	    <img id="img" src="${ctxpath}/imgs/logo.png"/>
	    </c:if>
	  </td>
	</tr>
  <tr>
   <td colspan="3">&nbsp;</td>
  </tr>
  <tr height="10%" valign="bottom">
   <td colspan="3" align="center">
       <jsp:include page="/module/bottom.jsp" flush="false"/>
  </td>
  </tr>
</table>
	
</body>
</html>
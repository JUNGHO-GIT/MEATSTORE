<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="imgspath" value="/board/upload" />

<!doctype html>
<html lang="en, ko">

	<body>
		<!-- header -->
		<section class="section">
			<div class="jumbotron d-flex align-items-center">
				<div class="gradient"></div>
				<div class="container-fluid content">
					<h1 data-aos="fade-right" data-aos-delay="300"> 주문 정보 </h1>
					<h2 data-aos="fade-left" data-aos-delay="300"> [ID : ${sessionScope.id}] </h2>
				</div>
			</div>
		</section>

    <!-- section -->
    <section>
      <form method="post" action="/cart/cartPro.do">
        <table width="30%" cellpadding="3" class="detail_css" id="center_list">
          <tr>
            <td colspan="2" align="center">
              <img src="/res/imgs/${dto.image}" width="500px" height="500px" />
            </td>
          </tr>
        </table>
        <hr width="500" color="#9B111E" noshade />
        <table width="500" cellpadding="3" class="detail_css" id="center_list">
          <tr>
            <td colspan="2" align="center">
              <font size="+2">${dto.name}</font>
            </td>
          </tr>
          <tr>
            <td id="list_center">상품코드</td>
            <td>
              <input type="text" name="code" id="code" style="border: 0 solid black"
                value="${dto.code}" readonly />
            </td>
          </tr>
          <tr>
            <td id="list_center" id="line_deco">상품가격</td>
            <td>
              <input type="text" name="price" id="price" style="border: 0 solid black"
                value="${dto.price}원" readonly />
            </td>
          </tr>
          <tr>
            <td id="list_center">제품수량</td>
            <td>
              <input type="text" name="stock" id="stock" style="border: 0 solid black"
                value="${dto.stock}" readonly />
            </td>
          </tr>
          <tr>
            <td id="list_center">등록날짜</td>
            <td>${dto.regdate}</td>
          </tr>
          <tr>
            <td id="list_center">제조회사</td>
            <td>
              <input type="text" name="comp" id="comp" style="border: 0 solid black"
                value="${dto.comp}" readonly />
            </td>
          </tr>
          <tr>
            <td id="list_center">주문수량</td>
            <td>
              <select name="quantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center" id="submit_button">
              <input type="submit" id="submit_detail" value="장바구니 담기" />
              <input type="button" id="button_detail" value="취소"
                onClick="location='/product/productList.do'" />
              <input type="hidden" name="pro_no" id="pro_no" value="${dto.pro_no}" />
              <input type="hidden" name="id" id="id" value="${sessionScope.id}" />
              <input type="hidden" name="state" value="1" />
            </td>
          </tr>
        </table>
      </form>
      <c:if test="${!empty sessionScope.adminid}">
        <table>
          <tr>
            <td colspan="3" align="center">
              <a href="javaScript:productUpdate(${dto.pro_no})">수정하기</a>
              <a href="javaScript:productDelete(${dto.pro_no})">삭제하기</a>
            </td>
          </tr>
        </table>
        <form name="updateForm" method="post" action="/admin/productUpdateForm.do">
          <input type="hidden" name="pro_no" />
        </form>
        <form name="delForm" method="post" action="/admin/productDelete.do?flag=delete">
          <input type="hidden" name="pro_no" value="${dto.pro_no}" />
        </form>
      </c:if>
    </section>

	</body>
</html>
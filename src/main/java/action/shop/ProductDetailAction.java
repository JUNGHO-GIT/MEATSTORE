package action.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopdb.*;
import command.CommandAction;

public class ProductDetailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//productList에서 받아온 값
		ProductDAO dao=ProductDAO.getInstance();
		String code=request.getParameter("code");
		
		ProductDTO dto=dao.getDetail(code);
		
		//JSP출력
		request.setAttribute("code", code);
		request.setAttribute("dto", dto);
		
		return "/shop/productDetail.jsp";
	}

}

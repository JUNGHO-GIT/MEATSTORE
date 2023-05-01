package action.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import shopdb.OrderDAO;
import shopdb.ProductDAO;
import command.CommandAction;

public class OrderListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		String id=request.getParameter("id");
		ProductDAO productDAO=ProductDAO.getInstance();
		
		request.setAttribute("id", id);
		request.setAttribute("productDAO", productDAO);
		
		return "/shop/orderList.jsp";
	}

}

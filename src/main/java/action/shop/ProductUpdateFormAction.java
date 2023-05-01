package action.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import shopdb.*;
import command.CommandAction;

public class ProductUpdateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		int pro_no=Integer.parseInt(request.getParameter("pro_no"));
		
		ProductDAO dao=ProductDAO.getInstance();
		ProductDTO dto=dao.getProduct(pro_no);
		
		request.setAttribute("pro_no", pro_no);
		request.setAttribute("dto", dto);
		request.setAttribute("dao", dao);
		
		return "/admin/productUpdateForm.jsp";
	}

}

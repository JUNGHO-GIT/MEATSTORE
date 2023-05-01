package action.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import shopdb.*;
import command.CommandAction;

public class ProductInsertProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO=ProductDAO.getInstance();
		String flag=request.getParameter("flag");
		boolean result=false;//qustn

		int iti=0;

		if(flag.equals("insert")){
			result=productDAO.insertProduct(request);
		}else if(flag.equals("update")){
			result=productDAO.updateProduct(request);

		}

		return "/admin/productInsertPro.jsp";
	}

}

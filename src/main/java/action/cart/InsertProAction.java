package action.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;

public class InsertProAction implements CommandAction {

  @Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return "/cart/insertPro.jsp";
	}

}
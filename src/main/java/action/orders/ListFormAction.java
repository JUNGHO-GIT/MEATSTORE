package action.orders;

import command.CommandAction;
import dao.ProductDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class ListFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    String id = request.getParameter("id");
    ProductDAO productDAO = ProductDAO.getInstance();
    request.setAttribute("id", id);
    request.setAttribute("productDAO", productDAO);
    return "/orders/listForm.jsp";
  }
}

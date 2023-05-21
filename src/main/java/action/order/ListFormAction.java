package action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import core.command.CommandAction;
import data.dao.ProductDAO;

public class ListFormAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    String id = request.getParameter("id");
    ProductDAO productDAO = ProductDAO.getInstance();

    request.setAttribute("id", id);
    request.setAttribute("productDAO", productDAO);

    return "/order/listForm.jsp";
  }
}

package action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.ProductDAO;

public class OrderListAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    String id = request.getParameter("id");
    ProductDAO productDAO = ProductDAO.getInstance();

    request.setAttribute("id", id);
    request.setAttribute("productDAO", productDAO);

    return "/order/orderList.jsp";
  }
}

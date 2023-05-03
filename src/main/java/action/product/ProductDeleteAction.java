package action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;

public class ProductDeleteAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    request.setCharacterEncoding("UTF-8");

    return "/admin/productDelete.jsp";
  }
}

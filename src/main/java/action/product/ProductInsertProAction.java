package action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.ProductDAO;

public class ProductInsertProAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    request.setCharacterEncoding("UTF-8");
    ProductDAO productDAO = ProductDAO.getInstance();
    String flag = request.getParameter("flag");
    boolean result = false;

    int init = 0;

    if (flag.equals("insert")) {
      result = productDAO.insertProduct(request);
    }
        else if (flag.equals("update")) {
      result = productDAO.updateProduct(request);
    }

    return "/admin/productInsertPro.jsp";
  }
}

package action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.ProductDAO;
import dto.ProductDTO;

public class DetailAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    ProductDAO dao = ProductDAO.getInstance();
    String code = request.getParameter("code");

    ProductDTO dto = dao.getDetail(code);

    request.setAttribute("code", code);
    request.setAttribute("dto", dto);

    return "/product/detailForm.jsp";
  }
}

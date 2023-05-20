package action.product;

import command.CommandAction;
import dao.ProductDAO;
import dto.ProductDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class UpdateFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
    ProductDAO dao = ProductDAO.getInstance();
    ProductDTO dto = dao.getProduct(num);
    request.setAttribute("num", num);
    request.setAttribute("dto", dto);
    request.setAttribute("dao", dao);
    return "/product/updateForm.jsp";
  }
}

package action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import core.command.CommandAction;
import data.dao.ProductDAO;
import data.dto.ProductDTO;

// ------------------------------------------------------------------------------------------------>
public class UpdateFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    ProductDAO dao = ProductDAO.getInstance();
    ProductDTO dto = dao.getUpdate(num);
    request.setAttribute("pageNum", pageNum);
    request.setAttribute("dto", dto);
    return "/product/updateForm.jsp";
  }
}

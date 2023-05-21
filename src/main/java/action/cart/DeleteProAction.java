package action.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.CartDAO;

public class DeleteProAction implements CommandAction {
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {

    request.setCharacterEncoding("UTF-8");
    String codesString = request.getParameter("codes");
    String[] codes = codesString.split(",");
    String pageNum = request.getParameter("pageNum");

    CartDAO dao = CartDAO.getInstance();
    int checkParam = dao.deleteCart(codes);

    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);

    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    if (checkParam > 0) {
      response.getWriter().write("success");
    }
    else {
      response.getWriter().write("fail");
    }
    return "cart/listForm.jsp";
  }
}

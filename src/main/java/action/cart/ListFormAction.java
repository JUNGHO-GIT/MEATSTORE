package action.cart;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.CartDAO;
import dto.CartDTO;

public class ListFormAction implements CommandAction {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    String id = request.getParameter("id");
    if (id == null) {
      return "/member/loginForm.jsp";
    }
    CartDAO cartDAO = new CartDAO();
    List<CartDTO> cartList = cartDAO.getCartList(id);
    request.setAttribute("cartList", cartList);
    return "/cart/listForm.jsp";
  }
}
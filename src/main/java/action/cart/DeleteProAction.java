package action.cart;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandAction;
import dao.CartDAO;

// ------------------------------------------------------------------------------------------------>
public class DeleteProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {

    ServletContext context = request.getServletContext();
    String uploadPath = context.getRealPath("/res/upload/cart");
    int sizeLimit = 1024 * 1024 * 10;
    MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

    int num = Integer.parseInt(multi.getParameter("num"));
    String pageNum = request.getParameter("pageNum");

    CartDAO dao = CartDAO.getInstance();
    dao.deleteCart(num);
    int checkParam = num;

    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);

    return "/cart/deletePro.jsp";
  }
}

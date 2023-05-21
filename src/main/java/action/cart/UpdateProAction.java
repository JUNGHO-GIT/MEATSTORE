package action.cart;

import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandAction;
import dao.CartDAO;
import dto.CartDTO;

// ------------------------------------------------------------------------------------------------>
public class UpdateProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {

    ServletContext context = request.getServletContext();
    String uploadPath = context.getRealPath("/res/upload/cart");
    String pageNum = request.getParameter("pageNum");
    int sizeLimit = 1024 * 1024 * 10;

    MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

    CartDTO dto = new CartDTO();
    dto.setNum(Integer.parseInt(multi.getParameter("num")));
    dto.setCode(multi.getParameter("code"));
    dto.setName(multi.getParameter("name"));
    dto.setPrice(Integer.parseInt(multi.getParameter("price")));
    dto.setQuantity(Integer.parseInt(multi.getParameter("quantity")));
    dto.setImageFile(multi.getParameter("imageFile"));

    Enumeration files = multi.getFileNames();
    String file = (String) files.nextElement();
    String filename = multi.getFilesystemName(file);

    dto.setImageFile(filename);
    CartDAO dao = CartDAO.getInstance();
    int checkParam = dao.updateCart(dto);

    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);

    return "/cart/updatePro.jsp";
  }
}

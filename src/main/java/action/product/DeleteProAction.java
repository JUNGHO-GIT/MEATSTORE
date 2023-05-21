package action.product;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import core.command.CommandAction;
import data.dao.ProductDAO;

// ------------------------------------------------------------------------------------------------>
public class DeleteProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    ServletContext context = request.getServletContext();
    String uploadPath = context.getRealPath("/res/upload/product");
    int sizeLimit = 1024 * 1024 * 10;
    MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
    int num = Integer.parseInt(multi.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    String pw = multi.getParameter("pw");
    ProductDAO dao = ProductDAO.getInstance();
    int checkParam = dao.getDelete(num, pw);
    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);
    return "/product/deletePro.jsp";
  }
}

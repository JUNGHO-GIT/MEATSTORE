package action.product;

import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import core.command.CommandAction;
import data.dao.ProductDAO;
import data.dto.ProductDTO;

// ------------------------------------------------------------------------------------------------>
public class InsertProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {

    ServletContext context = request.getServletContext();
    String uploadPath = context.getRealPath("/res/upload/product");
    int sizeLimit = 1024 * 1024 * 10;

    MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

    ProductDTO dto = new ProductDTO();
    dto.setNum(Integer.parseInt(multi.getParameter("num")));
    dto.setCode(multi.getParameter("code"));
    dto.setName(multi.getParameter("name"));
    dto.setPrice(Integer.parseInt(multi.getParameter("price")));
    dto.setStock(Integer.parseInt(multi.getParameter("stock")));
    dto.setContent(multi.getParameter("content"));
    dto.setComp(multi.getParameter("comp"));
    dto.setRef(Integer.parseInt(multi.getParameter("ref")));
    dto.setRe_step(Integer.parseInt(multi.getParameter("re_step")));
    dto.setRe_indent(Integer.parseInt(multi.getParameter("re_indent")));
    dto.setImageFile(multi.getParameter("imageFile"));

    Enumeration files = multi.getFileNames();
    String file = (String) files.nextElement();
    String filename = multi.getFilesystemName(file);

    dto.setImageFile(filename);
    ProductDAO dao = ProductDAO.getInstance();
    dao.insertProduct(dto);

    return "/product/insertPro.jsp";
  }
}

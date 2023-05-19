package action.board;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandAction;
import dao.BoardDAO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class DeleteProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    ServletContext context = request.getServletContext();
    String uploadPath = context.getRealPath("/res/upload");
    int sizeLimit = 1024 * 1024 * 10;
    MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
    int num = Integer.parseInt(multi.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    String pw = multi.getParameter("pw");
    BoardDAO dao = BoardDAO.getInstance();
    int checkParam = dao.deleteBoard(num, pw);
    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);
    return "/board/deletePro.jsp";
  }
}

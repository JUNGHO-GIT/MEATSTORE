package action.board;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import core.command.CommandAction;
import data.dao.BoardDAO;
import data.dto.BoardDTO;
import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class UpdateProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    ServletContext context = request.getServletContext();
    String uploadPath = context.getRealPath("/res/upload/board");
    String pageNum = request.getParameter("pageNum");
    int sizeLimit = 1024 * 1024 * 10;
    MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
    BoardDTO dto = new BoardDTO();
    dto.setNum(Integer.parseInt(multi.getParameter("num")));
    dto.setWriter(multi.getParameter("writer"));
    dto.setSubject(multi.getParameter("subject"));
    dto.setContent(multi.getParameter("content"));
    dto.setPw(multi.getParameter("pw"));
    dto.setImageFile(multi.getParameter("imageFile"));
    Enumeration files = multi.getFileNames();
    String file = (String) files.nextElement();
    String filename = multi.getFilesystemName(file);
    dto.setImageFile(filename);
    BoardDAO dao = BoardDAO.getInstance();
    int checkParam = dao.updateBoard(dto);
    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);
    return "/board/updatePro.jsp";
  }
}

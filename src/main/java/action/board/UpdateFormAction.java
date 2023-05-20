package action.board;

import command.CommandAction;
import dao.BoardDAO;
import dto.BoardDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class UpdateFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    BoardDAO dao = BoardDAO.getInstance();
    BoardDTO dto = dao.getUpdate(num);
    request.setAttribute("pageNum", pageNum);
    request.setAttribute("dto", dto);
    return "/board/updateForm.jsp";
  }
}

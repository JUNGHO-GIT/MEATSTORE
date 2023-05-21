package action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.BoardDAO;
import dto.BoardDTO;

// ------------------------------------------------------------------------------------------------>
public class DetailFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    BoardDAO dao = BoardDAO.getInstance();
    BoardDTO dto = dao.getBoard(num);
    request.setAttribute("num", num);
    request.setAttribute("pageNum", pageNum);
    request.setAttribute("dto", dto);
    return "/board/detailForm.jsp";
  }
}

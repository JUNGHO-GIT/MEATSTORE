package action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.QnaDAO;
import dto.QnaDTO;

// ------------------------------------------------------------------------------------------------>
public class UpdateFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    QnaDAO dao = QnaDAO.getInstance();
    QnaDTO dto = dao.getQna(num);
    request.setAttribute("pageNum", pageNum);
    request.setAttribute("dto", dto);
    return "/qna/updateForm.jsp";
  }
}

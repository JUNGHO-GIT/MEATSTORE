package action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.QnaDAO;
import dto.QnaDTO;

// ------------------------------------------------------------------------------------------------>
public class UpdateProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    String pageNum = request.getParameter("pageNum");
    QnaDTO dto = new QnaDTO();
    dto.setNum(Integer.parseInt(request.getParameter("num")));
    dto.setWriter(request.getParameter("writer"));
    dto.setSubject(request.getParameter("subject"));
    dto.setContent(request.getParameter("content"));
    dto.setPw(request.getParameter("pw"));
    QnaDAO dao = QnaDAO.getInstance();
    int checkParam = dao.updateQna(dto);
    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);
    return "/qna/updatePro.jsp";
  }
}

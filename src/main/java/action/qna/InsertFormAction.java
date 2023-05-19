package action.qna;

import command.CommandAction;
import dao.QnaDAO;
import dto.QnaDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class InsertFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    int num = 0;
    int ref = 1;
    int re_step = 0;
    int re_indent = 0;
    if (request.getParameter("num") != null) {
      num = Integer.parseInt(request.getParameter("num"));
      ref = Integer.parseInt(request.getParameter("ref"));
      re_step = Integer.parseInt(request.getParameter("re_step"));
      re_indent = Integer.parseInt(request.getParameter("re_indent"));
    }

    QnaDAO dao = QnaDAO.getInstance();
    QnaDTO dto = dao.getQna(num);
    if (dto != null) {
      request.setAttribute("content", dto.getContent());
    }

    request.setAttribute("num", num);
    request.setAttribute("ref", ref);
    request.setAttribute("re_step", re_step);
    request.setAttribute("re_indent", re_indent);
    return "/qna/insertForm.jsp";
  }
}

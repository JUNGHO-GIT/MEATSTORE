package action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.QnaDAO;
import dto.QnaDTO;

// ------------------------------------------------------------------------------------------------>
public class InsertFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    int num = 0;
    int ref = 1;
    int re_indent = 0;
    if (request.getParameter("num") != null) {
      num = Integer.parseInt(request.getParameter("num"));
      ref = Integer.parseInt(request.getParameter("ref"));
      re_indent = Integer.parseInt(request.getParameter("re_indent"));
      re_indent = Integer.parseInt(request.getParameter("re_indent"));
    }

    QnaDAO dao = QnaDAO.getInstance();
    QnaDTO dto = dao.getQna(num);
    if (dto != null) {
      request.setAttribute("content", dto.getContent());
    }

    request.setAttribute("num", num);
    request.setAttribute("ref", ref);
    request.setAttribute("re_indent", re_indent);
    request.setAttribute("re_indent", re_indent);
    return "/qna/insertForm.jsp";
  }
}

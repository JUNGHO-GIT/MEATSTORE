package action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.QnaDAO;
import dto.QnaDTO;

// ------------------------------------------------------------------------------------------------>
public class InsertProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    QnaDTO dto = new QnaDTO();
    dto.setNum(Integer.parseInt(request.getParameter("num")));
    dto.setWriter(request.getParameter("writer"));
    dto.setSubject(request.getParameter("subject"));
    dto.setContent(request.getParameter("content"));
    dto.setPw(request.getParameter("pw"));
    dto.setRef(Integer.parseInt(request.getParameter("ref")));
    dto.setRe_indent(Integer.parseInt(request.getParameter("re_indent")));
    dto.setRe_indent(Integer.parseInt(request.getParameter("re_indent")));
    QnaDAO dao = QnaDAO.getInstance();
    dao.insertQna(dto);
    return "/qna/insertPro.jsp";
  }
}

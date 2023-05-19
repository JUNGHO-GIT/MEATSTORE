package action.qna;

import command.CommandAction;
import dao.QnaDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProAction implements CommandAction {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
  throws Throwable {

    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    String pw = request.getParameter("pw");

    QnaDAO dao = QnaDAO.getInstance();
    int x = dao.deleteQna(num, pw);

    request.setAttribute("x", x);
    request.setAttribute("pageNum", pageNum);

    return "/qna/deletePro.jsp";
  }
}

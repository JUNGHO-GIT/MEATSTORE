package action.notice;

import command.CommandAction;
import dao.NoticeDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class DeleteProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    String pw = request.getParameter("pw");
    NoticeDAO dao = NoticeDAO.getInstance();
    int checkParam = dao.getDelete(num, pw);
    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);
    return "/notice/deletePro.jsp";
  }
}

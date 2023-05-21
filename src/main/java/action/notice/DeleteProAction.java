package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import core.command.CommandAction;
import data.dao.NoticeDAO;

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

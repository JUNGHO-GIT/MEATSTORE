package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import core.command.CommandAction;
import data.dao.NoticeDAO;
import data.dto.NoticeDTO;

// ------------------------------------------------------------------------------------------------>
public class UpdateFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response)
  throws Throwable {
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    NoticeDAO dao = NoticeDAO.getInstance();
    NoticeDTO dto = dao.getUpdate(num);
    request.setAttribute("pageNum", pageNum);
    request.setAttribute("dto", dto);
    return "/notice/updateForm.jsp";
  }
}

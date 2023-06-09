package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.NoticeDAO;
import dto.NoticeDTO;

// ------------------------------------------------------------------------------------------------>
public class UpdateProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    String pageNum = request.getParameter("pageNum");
    NoticeDTO dto = new NoticeDTO();
    dto.setNum(Integer.parseInt(request.getParameter("num")));
    dto.setWriter(request.getParameter("writer"));
    dto.setSubject(request.getParameter("subject"));
    dto.setContent(request.getParameter("content"));
    dto.setPw(request.getParameter("pw"));
    NoticeDAO dao = NoticeDAO.getInstance();
    int checkParam = dao.updateNotice(dto);
    request.setAttribute("checkParam", checkParam);
    request.setAttribute("pageNum", pageNum);
    return "/notice/updatePro.jsp";
  }
}

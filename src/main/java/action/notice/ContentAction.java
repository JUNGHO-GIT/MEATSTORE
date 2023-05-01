package action.notice;

import command.CommandAction;
import dao.NoticeDAO;
import dto.NoticeDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ContentAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");

    NoticeDAO dao = NoticeDAO.getInstance();
    NoticeDTO dto = dao.getNotice(num);

    request.setAttribute("num", num);
    request.setAttribute("pageNum", pageNum);
    request.setAttribute("dto", dto);

    return "/notice/content.jsp";
  }
}

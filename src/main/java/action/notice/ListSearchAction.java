package action.notice;

import command.CommandAction;
import dao.NoticeDAO;
import dto.NoticeDTO;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class ListSearchAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
      pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int pageSize = 10;
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    int pageBlock = 10;
    List<NoticeDTO> list = null;
    NoticeDAO dao = NoticeDAO.getInstance();
    count = dao.getCount();
    String keyword = request.getParameter("keyword");
    String search = request.getParameter("search");
    String subject = null;
    String writer = null;
    if (keyword != null && search != null) {
      count = dao.getCount(keyword, search);
    }

    if (keyword != null && keyword.equals("subject")) {
      subject = search;
    }
    else {
      writer = search;
    }

    if (count > 0) {
      list = dao.listSearch(startRow, pageSize, subject, writer);
    }
    else {
      list = Collections.emptyList();
    }

    number = count - (currentPage - 1) * pageSize;
    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
    int startPage = (currentPage / pageBlock) * 10 + 1;
    pageBlock = 10;
    if (currentPage % pageBlock == 0 && currentPage >= pageBlock) {
      startPage = currentPage - 9;
    }

    int endPage = startPage + pageBlock - 1;
    request.setAttribute("startPage", startPage);
    request.setAttribute("endPage", endPage);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("startRow", startRow);
    request.setAttribute("endRow", endRow);
    request.setAttribute("pageBlock", pageBlock);
    request.setAttribute("pageCount", pageCount);
    request.setAttribute("count", count);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("number", number);
    request.setAttribute("list", list);
    return "/notice/listForm.jsp";
  }
}

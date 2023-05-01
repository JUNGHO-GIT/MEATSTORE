package action.board;

import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.BoardDAO;

public class ListAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
      pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int pageSize = 4;
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    int pageBlock = 10;

    List list = null;

    BoardDAO dao = BoardDAO.getInstance();
    count = dao.getCount();

    if (count > 0) {
      list = dao.getList(startRow, pageSize);
    }
    else {
      list = Collections.EMPTY_LIST;
    }

    number = count - (currentPage - 1) * pageSize;
    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
    int startPage = (int) (currentPage / pageBlock) * 10 + 1;

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

    return "/board/list.jsp";
  }
}

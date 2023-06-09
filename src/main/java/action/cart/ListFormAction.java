package action.cart;

import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.CartDAO;

public class ListFormAction implements CommandAction {

  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    String pageNum = request.getParameter("pageNum");
    String id = (String) request.getSession().getAttribute("id");

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
    List<dto.CartDTO> list = null;
    CartDAO dao = CartDAO.getInstance();
    count = dao.getCount(id);
    if (count > 0) {
      list = dao.getList(id, startRow, pageSize);
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
    return "/cart/listForm.jsp";
  }
}

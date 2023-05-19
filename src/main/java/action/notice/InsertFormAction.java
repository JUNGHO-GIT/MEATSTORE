package action.notice;

import command.CommandAction;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertFormAction implements CommandAction {

  @Override
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {

    int num = 0;

    if (request.getParameter("num") != null) {
      num = Integer.parseInt(request.getParameter("num"));
    }

    request.setAttribute("num", num);

    return "/notice/insertForm.jsp";
  }
}

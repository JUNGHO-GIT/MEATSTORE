package action.member;

import command.CommandAction;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements CommandAction {

  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {
    return "/member/main.jsp";
  }
}

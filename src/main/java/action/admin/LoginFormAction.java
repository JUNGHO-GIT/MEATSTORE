package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import core.command.CommandAction;

// ------------------------------------------------------------------------------------------------>
public class LoginFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    return "/admin/loginForm.jsp";
  }
}

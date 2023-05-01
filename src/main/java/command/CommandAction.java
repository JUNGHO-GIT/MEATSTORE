package command;

import javax.servlet.http.*;

public interface CommandAction {
  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable;
}

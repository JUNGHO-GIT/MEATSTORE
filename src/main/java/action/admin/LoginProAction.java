package action.admin;

import command.CommandAction;
import dao.AdminDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class LoginProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    String adminId = request.getParameter("adminId");
    String adminPw = request.getParameter("adminPw");
    AdminDAO dao = AdminDAO.getInstance();
    int checkParam = dao.adminCheck(adminId, adminPw);
    request.setAttribute("checkParam", checkParam);
    request.setAttribute("adminId", adminId);
    return "/admin/loginPro.jsp";
  }
}
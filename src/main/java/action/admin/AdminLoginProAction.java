package action.admin;

import command.CommandAction;
import dao.MemberDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class AdminLoginProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    String adminid = request.getParameter("adminid");
    String adminpw = request.getParameter("adminpw");
    MemberDAO dao = MemberDAO.getInstance();
    int x = dao.adminLogin(adminid, adminpw);
    request.setAttribute("x", x);
    request.setAttribute("adminid", adminid);
    request.setAttribute("adminpw", adminpw);
    return "/admin/adminLoginPro.jsp";
  }
}

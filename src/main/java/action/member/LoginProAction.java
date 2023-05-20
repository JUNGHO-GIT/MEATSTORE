package action.member;

import command.CommandAction;
import dao.MemberDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class LoginProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    MemberDAO dao = MemberDAO.getInstance();
    int x = dao.userCheck(id, pw);
    request.setAttribute("x", x);
    request.setAttribute("id", id);
    return "/member/loginPro.jsp";
  }
}

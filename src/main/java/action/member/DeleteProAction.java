package action.member;

import command.CommandAction;
import dao.MemberDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ------------------------------------------------------------------------------------------------>
public class DeleteProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    MemberDAO dao = MemberDAO.getInstance();
    int x = dao.deleteMember(id, pw);
    request.setAttribute("x", x);
    return "/member/deletePro.jsp";
  }
}

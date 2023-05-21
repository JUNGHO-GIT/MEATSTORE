package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.MemberDAO;

// ------------------------------------------------------------------------------------------------>
public class DeleteProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    MemberDAO dao = MemberDAO.getInstance();
    int checkParam = dao.getDelete(id, pw);
    request.setAttribute("checkParam", checkParam);
    return "/member/deletePro.jsp";
  }
}

package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import command.CommandAction;
import dao.MemberDAO;
import dto.MemberDTO;

// ------------------------------------------------------------------------------------------------>
public class UpdateFormAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    HttpSession session = request.getSession();
    String id = (String) session.getAttribute("id");
    MemberDAO dao = MemberDAO.getInstance();
    MemberDTO dto = dao.getMember(id);
    request.setAttribute("dto", dto);
    return "/member/updateForm.jsp";
  }
}

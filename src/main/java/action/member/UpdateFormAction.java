package action.member;

import command.CommandAction;
import dao.MemberDAO;
import dto.MemberDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateFormAction implements CommandAction {

  public String requestPro(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws Throwable {
    String id = request.getParameter("id");
    MemberDAO dao = MemberDAO.getInstance();
    MemberDTO dto = dao.getMember(id);

    request.setAttribute("dto", dto);

    return "/member/updateForm.jsp";
  }
}

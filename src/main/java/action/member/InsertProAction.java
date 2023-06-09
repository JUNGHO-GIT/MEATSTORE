package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import dao.MemberDAO;
import dto.MemberDTO;

// ------------------------------------------------------------------------------------------------>
public class InsertProAction implements CommandAction {

  // ---------------------------------------------------------------------------------------------->
  @Override
  public String requestPro (HttpServletRequest request, HttpServletResponse response) throws Throwable {
    request.setCharacterEncoding("UTF-8");
    MemberDTO dto = new MemberDTO();
    dto.setId(request.getParameter("id"));
    dto.setPw(request.getParameter("pw"));
    dto.setName(request.getParameter("name"));
    dto.setEmail(request.getParameter("email"));
    dto.setTel(request.getParameter("tel"));
    dto.setZipcode(request.getParameter("zipcode"));
    dto.setAddr(request.getParameter("addr"));
    dto.setAddr2(request.getParameter("addr2"));
    MemberDAO dao = MemberDAO.getInstance();
    dao.insertMember(dto);
    return "/member/insertPro.jsp";
  }
}

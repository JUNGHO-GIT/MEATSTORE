package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import member.*;
import command.CommandAction;

public class UpdateProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");//ù�ٿ� 
		
		//updateform���� ������ �����͸� dto�� ���, dto�� dao �޼��� ȣ���ؼ� dao�� ������ 
		
		String id=request.getParameter("id");
		MemberDTO dto=new MemberDTO();
		
		dto.setId(id);
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddr(request.getParameter("addr"));
		dto.setAddr2(request.getParameter("addr2"));
		
		MemberDAO dao=MemberDAO.getInstance();
		dao.updateMember(dto);
		request.setAttribute("id", id);
		
		return "/member/updatePro.jsp";//�丮��
	}

}

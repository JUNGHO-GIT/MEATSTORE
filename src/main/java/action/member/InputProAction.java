package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.*;//DTO,DAO

public class InputProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");// ������ ù��° �ٿ�
		MemberDTO dto=new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));

		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));

		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddr(request.getParameter("addr"));
		dto.setAddr2(request.getParameter("addr2"));


		MemberDAO dao=MemberDAO.getInstance();//dao��ü ���
		dao.insertMember(dto);//dao�޼��� ȣǮ

		//String id=request.getParameter("id");
		//request.setAttribute("id", id);

		//inputForm.jsp�Ѱ��� �ڷḦ dto���, dto�� dao�޼���� �Ѱ��ش�


		return "/member/inputPro.jsp";//�丮��
	}

}

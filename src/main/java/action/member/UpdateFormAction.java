package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.*;

import command.CommandAction;

public class UpdateFormAction implements CommandAction{


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		//content.jsp ������ ���� �ޱ�

		String id=request.getParameter("id");
		MemberDAO dao=MemberDAO.getInstance();//dao ��ü ���
		MemberDTO dto=dao.getMember(id);//


		//JSP���� ����� �� ����

		request.setAttribute("dto", dto);


		return "/member/updateForm.jsp";//�丮��
	}

}

package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.*;


public class LoginProAction implements CommandAction{


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		//loginForm.jsp���� ������ �ޱ�
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");

		MemberDAO dao=MemberDAO.getInstance();//dao��ü ���
		int x=dao.userCheck(id, pw);//dao�޼��� ȣ��

		//JSP���� ����� �Ӽ� ����
		request.setAttribute("x", x);
		request.setAttribute("id", id); //session�� ��� JSP����


		return "/member/loginPro.jsp";//�丮��
	}

}

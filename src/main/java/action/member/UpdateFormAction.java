package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.*;

import command.CommandAction;

public class UpdateFormAction implements CommandAction{


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		//content.jsp 보내준 내용 받기

		String id=request.getParameter("id");
		MemberDAO dao=MemberDAO.getInstance();//dao 객체 얻기
		MemberDTO dto=dao.getMember(id);//


		//JSP에서 사용할 값 설정

		request.setAttribute("dto", dto);


		return "/member/updateForm.jsp";//뷰리턴
	}

}

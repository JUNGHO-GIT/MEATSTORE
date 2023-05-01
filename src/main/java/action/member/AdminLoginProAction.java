package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import command.CommandAction;

public class AdminLoginProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		//admin.jsp에서 데이터 받기
		String adminid=request.getParameter("adminid");
		String adminpw=request.getParameter("adminpw");

		MemberDAO dao=MemberDAO.getInstance();
		int x=dao.adminLogin(adminid, adminpw);

		request.setAttribute("x", x);
		request.setAttribute("adminid", adminid);
		request.setAttribute("adminpw", adminpw);


		return "/admin/adminLoginPro.jsp";
	}

}

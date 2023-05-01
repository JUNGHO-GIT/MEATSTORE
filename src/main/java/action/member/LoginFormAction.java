package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class LoginFormAction  implements CommandAction{


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		//System.out.println("LoginFormAction");

		return "/member/loginForm.jsp";//∫‰∏Æ≈œ
	}

}

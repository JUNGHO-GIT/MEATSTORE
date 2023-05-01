package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class ModifyAction implements CommandAction{


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		return "/member/modify.jsp";//∫‰∏Æ≈œ
	}

}

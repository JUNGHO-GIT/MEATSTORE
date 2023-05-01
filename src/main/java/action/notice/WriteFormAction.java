package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class WriteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = 0;
		
		if(request.getParameter("num")!= null) {
			num=Integer.parseInt(request.getParameter("num"));
		}
		
		//-----------
		
		request.setAttribute("num", num);
		
		return "/notice/writeForm.jsp";
	}

}

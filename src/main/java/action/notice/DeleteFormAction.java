package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
///notice/deleteFormaction
import command.CommandAction;

public class DeleteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		//jsp에서 사용할 값 설정
		request.setAttribute("num", num);
		request.setAttribute("pageNum",pageNum);
		return "/notice/deleteForm.jsp";
	}

}

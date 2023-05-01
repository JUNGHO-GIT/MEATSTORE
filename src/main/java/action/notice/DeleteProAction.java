package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import notice.*;
public class DeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		String pageNum=request.getParameter("pageNum");
		String pw=request.getParameter("pw");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		int x=dao.deleteNotice(num, pw);
		
		//x==1 삭제 성공
		//x==-1 암호틀림
				
		request.setAttribute("x", x);
		request.setAttribute("pageNum", pageNum);
				
		
		return "/notice/deletePro.jsp";
	}

}
package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notice.*;

import command.CommandAction;

public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		//list.jsp가 보내준 데이터 받기
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");

		//dao객체 얻어서 num에 해당한 글 얻어오기
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeDTO dto = dao.getNotice(num);

		//jsp에서 사용할 값 설정
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);

		return "/notice/content.jsp";
	}

}

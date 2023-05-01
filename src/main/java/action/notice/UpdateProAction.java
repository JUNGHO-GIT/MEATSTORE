package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notice.*;
import command.CommandAction;

public class UpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		//updateForm.jsp에서 보내준 한글을 인코딩 처리한다.
		
		String pageNum=request.getParameter("pageNum");
		//updateForm.jsp 에서 pageNum을 받아온다.
		
		NoticeDTO dto = new NoticeDTO();
		//noticeDTO에서도 정보꺼내올래
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setWriter(request.getParameter("writer"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setPw(request.getParameter("pw"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		int x = dao.updateNotice(dto);
		//dao에서 메서드를 호출
		//x==1 정상적으로 수정
		//x == -1 암호가 틀림
		
		request.setAttribute("x", x);
		request.setAttribute("pageNum", pageNum);
		
		return "/notice/updatePro.jsp";
	}

}

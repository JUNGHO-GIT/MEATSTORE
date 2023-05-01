package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.*;
import command.CommandAction;

public class WriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {


		//한글 인코딩 처리
		request.setCharacterEncoding("utf-8");


		NoticeDTO dto = new NoticeDTO();

		에서 보내준  데이터를 dto에 저장
				dto.setNum(Integer.parseInt(request.getParameter("num")));
				dto.setWriter(request.getParameter("writer"));
				dto.setTitle(request.getParameter("title"));
				dto.setContent(request.getParameter("content"));
				dto.setPw(request.getParameter("pw"));

				dto.setIp(request.getRemoteAddr());//ip

		//dao메서드 호출

		NoticeDAO dao = NoticeDAO.getInstance();
		dao.insertNotice(dto);


		return "/notice/writePro.jsp";
	}

}

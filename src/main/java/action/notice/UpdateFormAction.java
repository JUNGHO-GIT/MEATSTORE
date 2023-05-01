package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notice.*;

import command.CommandAction;

public class UpdateFormAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		int num=Integer.parseInt(request.getParameter("num"));
		//num에 받아온 문자열 num을 숫자로 변환해 대입한다.
		String pageNum=request.getParameter("pageNum");
		//pageNum에 문자열 pageNum을 받아와 대입한다.

		NoticeDAO dao = NoticeDAO.getInstance();
		//DAO 메서드 불러오기

		NoticeDTO dto = dao.getUpdate(num);
		//DTO의 getUpdate(num) 실행
		//매개변수 num에 해당하는 모든 다른 칼럼 값들을 가져온다.

		//받아온 pageNum을 가져갈수있도록 session에 설정해둔다
		request.setAttribute("pageNum",pageNum);

		//받아온 dto를 가져갈수있도록 session에 설정해둔다
		request.setAttribute("dto", dto);

		return "/notice/updateForm.jsp";
	}

}

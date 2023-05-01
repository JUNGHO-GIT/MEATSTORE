package action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import qna.QnaDAO;
import qna.QnaDTO;

public class WriteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		int num = 0;
		int ref = 1;
		int re_step = 0;
		int re_indent = 0;

		if(request.getParameter("num") != null){
			//만일, 받아온 값에 뭐라도 있다고 한다면

			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_indent = Integer.parseInt(request.getParameter("re_indent"));
			//값들을 받아온다.
		}

//		System.out.println(num);
		QnaDAO dao = QnaDAO.getInstance();
		QnaDTO dto = dao.getQna(num);

		if(dto != null) {
			//db에서 값이 있을때만 content를 받아와서 넘겨준다
			request.setAttribute("content", dto.getContent());
		}


		//jsp로 받아온 값들 보내줍니다.
		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_indent", re_indent);


		return "/qna/writeForm.jsp";
	}

}

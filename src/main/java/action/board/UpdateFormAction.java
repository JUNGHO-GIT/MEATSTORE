package action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import board.*;

public class UpdateFormAction implements CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
	throws Throwable {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.getUpdate(num);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);

		return "/board/updateForm.jsp";
	}
}

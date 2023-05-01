package action.board;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandAction;

public class DeleteProAction implements CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
	throws Throwable {

		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("/upload");
		int sizeLimit = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		int num = Integer.parseInt(multi.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String pw = multi.getParameter("pw");

		BoardDAO dao = BoardDAO.getInstance();
		int checkparam = dao.getDelete(num, pw);

		request.setAttribute("checkparam", checkparam);
		request.setAttribute("pageNum", pageNum);

		return "/board/deletePro.jsp";
	}

}

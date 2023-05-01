package action.board;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandAction;
import java.util.Enumeration;

public class UpdateProAction implements CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
	throws Throwable {

		// 멀티파트 리퀘스트 객체 생성
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("/upload");
		String pageNum = request.getParameter("pageNum");
		int sizeLimit = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		// updateForm.jsp 에서 보내준 데이터 받기
		BoardDTO dto = new BoardDTO();

		dto.setNum(Integer.parseInt(multi.getParameter("num")));
		dto.setWriter(multi.getParameter("writer"));
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		dto.setPw(multi.getParameter("pw"));
		dto.setFileupload(multi.getParameter("fileupload"));

		Enumeration files = multi.getFileNames();
		String file = (String) files.nextElement();
		String filename = multi.getFilesystemName(file);
		dto.setFileupload(filename);

		BoardDAO dao = BoardDAO.getInstance();
		int checkparam = dao.updateBoard(dto);


		request.setAttribute("checkparam", checkparam);
		request.setAttribute("pageNum", pageNum);

		return "/board/updatePro.jsp";
	}

}

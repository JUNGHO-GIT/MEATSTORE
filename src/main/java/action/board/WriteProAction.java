package action.board;

import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import command.CommandAction;
import board.*;

public class WriteProAction implements CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
	throws Throwable {

		// 멀티파트 리퀘스트 객체 생성
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("/upload");
		int sizeLimit = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		// writeForm.jsp 에서 보내준 데이터 받기
		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(multi.getParameter("num")));
		dto.setWriter(multi.getParameter("writer"));
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		dto.setPw(multi.getParameter("pw"));
		dto.setRef(Integer.parseInt(multi.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(multi.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(multi.getParameter("re_level")));
		dto.setIp(request.getRemoteAddr());
		dto.setFileupload(multi.getParameter("fileupload"));

		Enumeration files = multi.getFileNames();
		String file = (String) files.nextElement();

		// 파일 이름
		String filename = multi.getFilesystemName(file);
		dto.setFileupload(filename);

		BoardDAO dao = BoardDAO.getInstance();
		dao.insertBoard(dto);

		return "/board/writePro.jsp";
	}
}

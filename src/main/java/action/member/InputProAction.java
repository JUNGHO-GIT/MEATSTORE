package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.*;//DTO,DAO

public class InputProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");// 무조건 첫번째 줄에
		MemberDTO dto=new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));

		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));

		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddr(request.getParameter("addr"));
		dto.setAddr2(request.getParameter("addr2"));


		MemberDAO dao=MemberDAO.getInstance();//dao객체 얻기
		dao.insertMember(dto);//dao메서드 호풀

		//String id=request.getParameter("id");
		//request.setAttribute("id", id);

		//inputForm.jsp넘겨준 자료를 dto담고, dto를 dao메서드로 넘겨준다


		return "/member/inputPro.jsp";//뷰리턴
	}

}

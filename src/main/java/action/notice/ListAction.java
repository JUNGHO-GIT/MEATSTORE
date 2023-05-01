package action.notice;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notice.*;//DAO,DTO
import command.CommandAction;

public class ListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String pageNum = request.getParameter("pageNum");
		//pageNum #페이지 번호
		if(pageNum == null) {
			pageNum="1";
			//받아온 pageNum 이 없다면*글이 없다면* 첫번째 pageNum은 1번이다.
		}

		int currentPage=Integer.parseInt(pageNum);
		//currentPage #현재 페이지
		int pageSize=10;
		//pageSize #한 페이지 안에 들어갈 수 있는 글의 개수.


		int startRow=(currentPage-1)*pageSize+1;
		//startRow #한 페이지의 첫번째 글 번호
		int endRow=currentPage*pageSize;
		Row #한 페이지의 마지막 글 번호


		int count=0;
		//총 글 개수를 넣을 변수
		int number=0;
		//글 번호 처리
		int pageBlock=10;
		//한 블럭당 페이지가 10개 들어간다.

		List list = null; //DAO가 넘겨준 데이터를 받을 변수

		 NoticeDAO dao = NoticeDAO.getInstance();
		 count = dao.getCount();
		 //총 글의 개수

		 if(count>0) {
			 //글이 존재하면
			 list = dao.getList(startRow, pageSize);
			 //list에 dao.getList(int start,int cnt)를 이용해
			 //리스트를 생성한다.
		 }else {
			 //글이 없다면
			 list=Collections.EMPTY_LIST;
		 }

		 number=count-(currentPage-1)*pageSize;
		 //보여줄 글 번호

		 //글번호number에 총 글 개수 - (현재 페이지-1) * 페이지크기(10) 을 한 값을 대입한다.
		 int pageCount=count/pageSize + (count%pageSize==0?0:1);
		 //pageCount #페이지 개수는 총 글 개수 / 페이지크기(10)
		 //+ (총 글 개수를 페이지 크기(10)으로 나눈 나머지가 0인가? 참이라면 0을 리턴, 거짓이라면 1을 리턴)

		int startPage=(int)(currentPage/pageBlock)*10+1;
		//*********8

		pageBlock=10;
		if(currentPage%pageBlock==0 && currentPage>=pageBlock) {
			startPage=currentPage-9;
		}

		int endPage = startPage + pageBlock-1;
					//1 + 10 -1 - > 10
					//11 + 10 -1 - > 20

		//--------

		request.setAttribute("startPage", new Integer(startPage));
		request.setAttribute("endPage", new Integer(endPage));
		request.setAttribute("currentPage", currentPage);

		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);

		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("pageCount", pageCount);

		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);

		request.setAttribute("list", list);

		return "/notice/list.jsp";
	}

}

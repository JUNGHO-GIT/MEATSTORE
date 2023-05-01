package action.shop;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopdb.ProductDAO;
import shopdb.ProductDTO;
import command.CommandAction;

public class ProductListAction implements CommandAction  {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		List<ProductDTO> list=new ArrayList<ProductDTO>();
		
		ProductDAO dao=ProductDAO.getInstance();
		list=dao.getGoodList();
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		int pageSize=5;
		
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		
		int count=0;
		int pro_no=0;
		int pageBlock=10;
		
		List list2=null;
		count=dao.getCount();
		
		if(count>0){//상품 목록이 존재하면
			list2=dao.getProductList(startRow, pageSize);
		}else{
			list2=Collections.EMPTY_LIST;
		}
		pro_no=count-(currentPage-1)*pageSize;//출력할 글번호
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		int startPage=(int)(currentPage/pageBlock)*10+1;
		
		if(currentPage%pageBlock==0 && currentPage>=pageBlock){
			startPage=currentPage-9;
		}
		int endPage=startPage+pageBlock-1;
		
		
		//JSP에서 사용할 속성
		request.setAttribute("list", list);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("pageCount", pageCount);
		
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pro_no", pro_no);
		
		request.setAttribute("list2", list2);
		return "/shop/productList.jsp";
	}

}

package action.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.*;//cos.jar
import com.oreilly.servlet.multipart.*;//cos.jar
import command.CommandAction;

public class ProductInsertFormAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		return "/admin/productInsertForm.jsp";
	}

}

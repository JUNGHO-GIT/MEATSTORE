package command;
import javax.servlet.http.*;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public interface CommandAction {
	//�޼��� ����
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
	

}

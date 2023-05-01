package command;
import javax.servlet.http.*;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public interface CommandAction {
	//메서드 선언
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
	

}

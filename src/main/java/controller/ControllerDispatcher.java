package controller;
import javax.servlet.*;
import javax.servlet.http.*;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import java.io.*;
import java.util.*;

import command.CommandAction;

//��Ʈ�ѷ�(����+java����)
public class ControllerDispatcher extends HttpServlet{
	private Map map=new HashMap();
	//init():�ʱ�ȭ �۾�
	public void init(ServletConfig config) throws ServletException{
		String path=config.getServletContext().getRealPath("");//���� ��� ���

		//WEB_INF/command.properties
		String pros=path+config.getInitParameter("proFile");
		Properties pp=new Properties();
		FileInputStream ff=null;

		try{
			ff=new FileInputStream(pros);
			pp.load(ff);
		}catch(Exception ex){
			System.out.println("���� �б� ����:"+ex);
		}

		Iterator keyIter=pp.keySet().iterator();
		while(keyIter.hasNext()){
			String key=(String)keyIter.next();
			String className=pp.getProperty(key);

			//	    (key)					(vlaue)=className
			// /board/wirteForm.do=action.board.WriteFormAction

			try{
				Class commandClass=Class.forName(className);//Ŭ������ �����
				Object commandObject=commandClass.newInstance();//Ŭ���� ��ü ����
				map.put(key, commandObject);

			}catch(Exception ex){
				System.out.println("properties���� ������ Ŭ������ ����� �� ���ܹ߻�"+ex);
			}
		}
	}
	//�� ������ ��û��. get,post
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		reqPro(request,response);//�޼��� ȣ��
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		reqPro(request,response);//�޼��� ȣ��
	}

	//����� ���� �޼���
	private void reqPro(HttpServletRequest request,HttpServletResponse response)
			throws IOException,ServletException{
		String view="";
		CommandAction commandAction=null;//���� Ŭ���� ������ ���� ��ü ó��

		try{
			String uri=request.getRequestURI();//   /context�н�=������Ʈ �̸�
			//��ûURI:/02_jsp/ch04_innerObject/03_request.jsp
			//ContextPath:/02_jsp

			if(uri.indexOf(request.getContextPath())==0){
				uri=uri.substring(request.getContextPath().length());
			}

			//commandAction=(CommandAction)map.get(key);
			commandAction=(CommandAction)map.get(uri);
			view=commandAction.requestPro(request, response);// /board/list.jsp

		}catch(Throwable ex){
			throw new ServletException(ex);
		}
		request.setAttribute("CONTENT", view);

		RequestDispatcher rd=request.getRequestDispatcher("/template/template.jsp");
		rd.forward(request, response);//JSP�� ������
	}
}

package controller;

import command.CommandAction;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.*;
import javax.servlet.http.*;

public class ControllerDispatcher extends HttpServlet {

  private Map map = new HashMap<>();

  public void init(ServletConfig config) throws ServletException {
    String path = config.getServletContext().getRealPath("");

    String pros = path + config.getInitParameter("proFile");
    Properties pp = new Properties();
    FileInputStream ff = null;

    try {
      ff = new FileInputStream(pros);
      pp.load(ff);
    }
    catch (Exception ex) {}

    Iterator keyIter = pp.keySet().iterator();
    while (keyIter.hasNext()) {
      String key = (String) keyIter.next();
      String className = pp.getProperty(key);

      try {
        Class commandClass = Class.forName(className);
        Object commandObject = commandClass.newInstance();
        map.put(key, commandObject);
      }
      catch (Exception ex) {

      }
    }
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
    reqPro(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
    reqPro(request, response);
  }

  private void reqPro(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
    String view = "";
    CommandAction commandAction = null;

    try {
      String uri = request.getRequestURI();

      if (uri.indexOf(request.getContextPath()) == 0) {
        uri = uri.substring(request.getContextPath().length());
      }

      commandAction = (CommandAction) map.get(uri);
      view = commandAction.requestPro(request, response);
    }
    catch (Throwable ex) {
      throw new ServletException(ex);
    }
    request.setAttribute("CONTENT", view);

    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home/template.jsp");
    requestDispatcher.forward(request, response);
  }

}

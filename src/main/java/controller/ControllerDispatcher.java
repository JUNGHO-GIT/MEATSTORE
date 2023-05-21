package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import command.CommandAction;

// ------------------------------------------------------------------------------------------------>
public class ControllerDispatcher extends HttpServlet {

  private static final Logger LOGGER = LoggerFactory.getLogger(ControllerDispatcher.class);

  // ---------------------------------------------------------------------------------------------->
  private final Map<String, CommandAction> map = new HashMap<>();

  // ---------------------------------------------------------------------------------------------->
  @Override
  public void init(ServletConfig config) throws ServletException {
    String path = config.getServletContext().getRealPath("/");
    String pros = path + config.getInitParameter("proFile");
    Properties pp = new Properties();
    FileInputStream ff = null;
    try {
      ff = new FileInputStream(pros);
      pp.load(ff);
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }

    Iterator<?> keyIter = pp.keySet().iterator();
    while (keyIter.hasNext()) {
      String key = (String) keyIter.next();
      String className = pp.getProperty(key);
      try {
        Class<?> commandClass = Class.forName(className);
        Object commandObject = commandClass.getDeclaredConstructor().newInstance();
        map.put(key, (CommandAction) commandObject);

      }
      catch (Exception ex) {
        LOGGER.error("EXCEPTION", ex);
      }
    }
  }

  // ---------------------------------------------------------------------------------------------->
  @Override
  public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    reqPro(request, response);
  }

  // ---------------------------------------------------------------------------------------------->
  @Override
  public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    reqPro(request, response);
  }

  // ---------------------------------------------------------------------------------------------->
  private void reqPro (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String view = "";
    CommandAction commandAction = null;
    try {
      String uri = request.getRequestURI();
      if (uri.indexOf(request.getContextPath()) == 0) {
        uri = uri.substring(request.getContextPath().length());
      }

      commandAction = map.get(uri);
      view = commandAction.requestPro(request, response);
    }
    catch (Throwable ex) {
      throw new ServletException(ex);
    }
    request.setAttribute("CONTENT", view);
    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
    rd.forward(request, response);
  }
}

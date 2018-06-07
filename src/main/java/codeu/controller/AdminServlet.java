package codeu.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;

public class AdminServlet extends HttpServlet {

/** Directs user to admin page.*/
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException{
    request.getRequestDispatcher("/WEB-INF/view/admin.jsp").forward(request,response);
  }
}

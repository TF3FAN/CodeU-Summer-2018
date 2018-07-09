package codeu.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MentionsServlet extends HttpServlet{

  /*
    This function fires when the user requests the /mentions URL.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
          throws IOException, ServletException{
    request.getRequestDispatcher("/WEB-INF/view/mentions.jsp").forward(request,response);
  }
}

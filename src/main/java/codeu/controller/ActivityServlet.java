package codeu.controller;

import codeu.model.data.Event;
import codeu.model.store.basic.EventStore;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;

public class ActivityServlet extends HttpServlet {

  private EventStore eventStore;

  public void init() throws ServletException{
    super.init();
    setEventStore(EventStore.getInstance());
  }

  /**
   * Sets the EventStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  void setEventStore(EventStore eventStore) {
    this.eventStore = eventStore;
  }

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
          throws IOException, ServletException{
    List<Event> events = eventStore.getAllEvents();
    request.setAttribute("events", events);
    request.getRequestDispatcher("/WEB-INF/view/activity.jsp").forward(request,response);
  }
}

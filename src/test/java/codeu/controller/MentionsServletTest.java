package codeu.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class MentionsServletTest {

  private MentionsServlet mentionsServlet;
  private HttpServletResponse mockResponse;
  private HttpServletRequest mockRequest;
  private RequestDispatcher mockDispatcher;

  @Before
  public void setup() {
    mentionsServlet = new MentionsServlet();
    mockRequest = Mockito.mock(HttpServletRequest.class);
    mockResponse = Mockito.mock(HttpServletResponse.class);
    mockDispatcher = Mockito.mock(RequestDispatcher.class);
    Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/mentions.jsp"))
            .thenReturn(mockDispatcher);
  }

  @Test
  public void testDoGet() throws IOException, ServletException {
    mentionsServlet.doGet(mockRequest, mockResponse);

    Mockito.verify(mockDispatcher).forward(mockRequest, mockResponse);
  }
}

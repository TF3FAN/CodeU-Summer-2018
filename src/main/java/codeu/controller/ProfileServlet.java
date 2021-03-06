// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;

import codeu.model.data.Conversation;
import codeu.model.data.Message;
import codeu.model.data.User;
import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import java.time.Instant;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

/** Servlet class responsible for the profile page. */
public class ProfileServlet extends HttpServlet {

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /**
   * Set up state for handling profile-related requests. This method is only called when running in a
   * server, not when running in a test.
   */
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
    //setAboutStore(AboutStore.getInstance());
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }

  //void setAboutStore(AboutStore aboutStore) {
    //this.aboutStore = aboutStore;
  //}


  /**This class represents a User */
  /**public class User {
    private final UUID id;
    private String about;

  public User(UUID id, String about) {
      this.id = id;
      this.about = about;
    }

  public void setAbout(String about) {
    this.about = about;
  }

  public String getAbout() {
    return about;
  }*/

//}

  /**
   * This function is used when someone wants to go to the /profile URL. It lets profile.jsp do it's job by
   * displaying the page.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    String requestUrl = request.getRequestURI();
    String username = requestUrl.substring("/profile/".length());
    //String about;

    User user = userStore.getUser(username);
    if (user == null) {
      // user is not logged in redirect to login page
      response.sendRedirect("/login");
      return;
    }

    //if ((user != null) && (user.getAbout() != null)) {
      //about = user.getAbout();
    //}

    //String requestUrl = request.getRequestURI();
    request.setAttribute("user", user);
    //request.setAttribute("username",username);
    request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
  }


  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    String about = request.getParameter("about");
    String username = (String)request.getSession().getAttribute("user");
    if (username == null) {
      // user is not logged in redirect to login page
      response.sendRedirect("/login");
      return;
    }

    User user = UserStore.getInstance().getUser(username);
    if (user == null) {
      // user was not found redirect to login page
      response.sendRedirect("/login");
      return;
    }

    String name = request.getParameter("username");
    String requestUrl = request.getRequestURI();
    //request.getSession().setAttribute("user", about);
    //String conversationTitle = requestUrl.substring("/profile/".length());

    //Message about =
        //new Message(UUID.randomUUID(), user.getId(), about , Instant.now());

    //request.getSession().setAttribute("user", username);
    //request.getSession().setAttribute("about", about);
    //userStore.addAbout(about);
    request.setAttribute("about",about);
    response.sendRedirect("/profile/" + name);

}
}

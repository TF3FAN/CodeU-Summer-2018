<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ page import="codeu.model.store.basic.UserStore" %>

<!DOCTYPE html>
<html>
<head>
  <title>CodeU Chat App</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>
  <%String name = (String) request.getSession().getAttribute("user");%>
  <nav>
    <a id="navTitle" href="/">Team Vogue Chats</a>
    <% if(name != null){ %>
      <a>Hello <%= name %>!</a>
      <a href="/profile/<%=name %>">My Profile</a>
      <a href="/mentions">Mentions</a>
      <a href="/activity">Activity</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a class="active" href="/about.jsp">About</a>
    <%boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
      if (admin){%>
    <a href="/admin">Admin</a>
      <%}%>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>About the CodeU Chat App</h1>
      <p>
        This is the Team Vogue chat App!
      </p>

      <ul>
        <li><strong>The Team:</strong> The team consists of Gauri Jain and
          Ernesto Rojas. Gauri's work on her guided project added the admin system
          and admin page. Ernesto's guided project work brought the activity feed.
          Our project advisor is Becky Qiu. </li>
        <li><strong>The App Features:</strong> We focused on brining meanigful
        functionality to the application. For example, the admin page displays the
        quantity of Conversations, Messages, and Users on the app to an admin. Our
        activity feed notifies Users about the creation of Conversations, Messages,
        and other Users. These notifications, which are chronologically listed, also
        provide a hyperlink to the Conversation, if applicable.</li>
        <li><strong>Open Ended Project:</strong> For our open ended project, we
          added the idea of tagging and mentions of our app. In messages, users can
          tag Users by typing '@' followed by a valid username. Mentions are messages
          that users are tagged in. All of any user's Mentions can be viewed on the
        dedicated Mentions page.</li>
      </ul>

    </div>
  </div>
</body>
</html>

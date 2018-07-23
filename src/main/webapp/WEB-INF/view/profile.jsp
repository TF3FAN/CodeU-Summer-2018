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

<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>

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
      <a>Hello <%=name%>!</a>
      <a href="/profile/<%=name %>">My Profile</a>
      <a href="/mentions">Mentions</a>
      <a href="/activity">Activity</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <%boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
    if(admin) {%>
      <a href="/admin">Admin</a>
      <% } %>
    <%--<a href="/profile/<%=name %>">My Profile</a>--%>
  </nav>

  <div id="container">

    <h1> <%=name%>'s Profile Page </h1>

    <label for="about"><b>About <%=name%></b></label>
    <br/>

    <% if(request.getSession().getAttribute("user") != null &&
          request.getSession().getAttribute("user").equals(request.getAttribute("user"))) { %>
      <form action="/profile" method="POST">
        <textarea rows="20" cols="60">
        </textarea>
        <input type="text" name="about" id="about">
        <br/>
        <button type="submit">Submit</button>
      </form>
    <%} %>
  </div>

</body>
</html>

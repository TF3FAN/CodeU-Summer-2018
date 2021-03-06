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
  <title>Login</title>
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
      <a class="active" href="/login">Login</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <%boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
      if (admin){%>
    <a href="/admin">Admin</a>
      <%}%>
  </nav>

  <div id="container">
    <h1>Login</h1>

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <form action="/login" method="POST">
      <label for="username">Username: </label>
      <br/>
      <input type="text" name="username" id="username">
      <br/>
      <label for="password">Password: </label>
      <br/>
      <input type="password" name="password" id="password">
      <br/><br/>
      <button type="submit">Login</button>
    </form>

    <p>New users can register <a href="/register">here</a>.</p>
  </div>
</body>
</html>

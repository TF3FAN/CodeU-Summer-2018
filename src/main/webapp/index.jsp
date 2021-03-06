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
    <a id="navTitle" class="active" href="/">Team Vogue Chats</a>
    <% if(name != null){ %>
      <a>Hello <%= name %>!</a>
      <a href="/profile/<%=name %>">My Profile</a>
      <a href="/mentions">Mentions</a>
      <a href="/activity">Activity</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <%boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
      if (admin){%>
    <a href="/admin">Admin</a>
      <%}%>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>CodeU Chat App</h1>
      <h2>Welcome!</h2>

      <ul>
        <li><a href="/login">Login</a> to get started.</li>
        <li>Go to the <a href="/conversations">conversations</a> page to
            create or join a conversation.</li>
        <li>View the <a href="/about.jsp">about</a> page to learn more about the
            project.</li>
      </ul>
    </div>
  </div>
</body>
</html>

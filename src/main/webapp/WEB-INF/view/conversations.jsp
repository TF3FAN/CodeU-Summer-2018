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
<%@ page import="codeu.model.store.basic.UserStore" %>

<!DOCTYPE html>
<html>
<head>
  <title>Conversations</title>
  <link rel="stylesheet" href="/css/main.css">
  <style>
    input[type=text] {
      width: 560px;
      margin: 8px 0;
      padding: 8px 15px 8px 15px;
    }
    .vertical-menu {
      width: 560px;
      height: 200px;
      border: 3px solid #ccc;
      border-radius: 4px;
      overflow-y: scroll;
    }
    .vertical-menu a {
      background-color: white;
      color: black;
      display: block;
      padding: 12px;
      text-decoration: none;
    }
    .vertical-menu a:hover {
      color: white;
      background-color: #176b72;
    }
    button {
      margin: 8px 8px;
    }
  </style>
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
    <a class="active" href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <%boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
      if (admin){%>
    <a href="/admin">Admin</a>
      <%}%>
  </nav>

  <div id="container">

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <% if(name != null){ %>
      <h1>New Conversation</h1>
      <form action="/conversations" method="POST">
          <div class="form-group">
          <input type="text" name="conversationTitle" placeholder="New Conversation Title...">
          <button type="submit">Create</button>
        </div>
      </form>

      <hr/>
    <% } %>

    <h1>Conversations</h1>

    <%
    List<Conversation> conversations =
      (List<Conversation>) request.getAttribute("conversations");
    if(conversations == null || conversations.isEmpty()){
    %>
      <p>Create a conversation to get started.</p>
    <%
    }
    else{
    %>
    <div class="vertical-menu">
    <%
      for(Conversation conversation : conversations){
    %>
      <a href="/chat/<%= conversation.getTitle() %>">
        <%= conversation.getTitle() %></a>
    <%
      }
    %>
    </div>
    <%
    }
    %>
    <hr/>
  </div>
</body>
</html>

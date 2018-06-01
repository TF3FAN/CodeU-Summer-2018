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

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a href="/profile/<%=request.getSession().getAttribute("user")%>">My Profile</a>
      <%--<a>My Profile <%= request.getSession().getAttribute("user") %>!</a>--%>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>

    <%--<a href="/profile/<%=request.getSession().getAttribute("user")%>">My Profile</a>--%>
  </nav>

  <div id="container">

    <h1> <%=request.getSession().getAttribute("user")%>'s Profile Page </h1>

      <form action="/profile" method="POST">
        <label for="about"><b>About <%=request.getSession().getAttribute("user")%></b></label>
        <br/>
      <%--<input type="textarea" name="about" id="about">--%>
        <textarea rows="20" cols="60">
        </textarea>
        <input type="text" name="about" id="about">
        <br/>
        <button type="submit">Submit</button>
      </form>

  </div>
  <%--<div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>This is your profile page</h1>

    </div>
  </div>--%>
</body>
</html>

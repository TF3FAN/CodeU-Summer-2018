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
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <div id="container">

    <h1> Name's Profile Page </h1>
    <form action="/profile" method="POST">
      <label for="about"><b>About name</b></label>
      <br/>
      <%--<input type="textarea" name="about" id="about">--%>
      <textarea rows="20" cols="60" name="about" id="about">
      </textarea>
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

<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>
<%@ page import="codeu.model.store.basic.UserStore" %>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Page</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>
  <%String name = (String) request.getSession().getAttribute("user");
    int numUsers = UserStore.getInstance().getSize();
    int numConvo = ConversationStore.getInstance().getSize();
    int numChats = MessageStore.getInstance().getSize();
    boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
    %>
  <nav>
    <a id="navTitle" href="/">Team Vogue Chats</a>
    <% if(name != null){%>
      <a>Hello <%= name %>!</a>
      <a href="/profile/<%=name %>">My Profile</a>
      <a href="/mentions">Mentions</a>
      <a href="/activity">Activity</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <%if (admin){%>
    <a class="active" href="/admin">Admin</a>
      <%}%>
  </nav>
  <div id="container">
    <div style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">
      <%
      if (admin){ %>
        <h1>This is the Admin Page. Welcome <%=name%>.</h1>
        <%}else{ %>
        <h1>Access Denied not an Admin.</h1>
        <%}%>
      </div>
  </div>
  <%if (admin){ %>
  <ul>
     <li>Users: <%=numUsers%></li>
     <li>Conversations: <%=numConvo%></li>
     <li>Messages: <%=numChats%></li>
  </ul>
  <%}%>
</body>
</html>

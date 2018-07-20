<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.data.Mention" %>


<!DOCTYPE html>
<html>
<head>
  <title>Mentions</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>
  <%String name = (String) request.getSession().getAttribute("user");%>
  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(name != null){%>
      <a>Hello <%=name%>!</a>
      <a href="/mentions">Mentions</a>
      <a href="/activity">Activity</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
    <% boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
      if(admin) {%>
      <a href="/admin">Admin</a>
      <% } %>
  </nav>
  <div id="container">
    <div style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">
      <h1>Your Mentions</h1>
      <p>You will show messages you were mentioned in here! <%
      if(name!= null){
        for (Mention x: UserStore.getInstance().getUser(name).getMentions()){
        %><%=x.getMessage()%> <%=x.getConversation()%>
        <%}
      }%>
      </p>
    </div>
  </div>
</body>
</html>

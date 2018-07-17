<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.EventStore" %>
<%@ page import="codeu.model.data.Event" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
  <title>Activity Feed</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>
  <%String name = (String) request.getSession().getAttribute("user");
    boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
    EventStore eventStore = EventStore.getInstance();
    %>
  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(name != null){%>
      <a>Hello <%= name %>!</a>
      <a href="/mentions">Mentions</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
    <% if(admin){%>
    <a href="/admin">Admin</a>
      <%}%>
  </nav>
  <div id="container">
    <div style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">
      <% if(name != null){%>
        <h1>Your Activity Feed</h1>
        <%
        List<Event> events = eventStore.getEvents();
        if (events == null || events.isEmpty()) {
        %>
          <p>There is no activity to display.</p>
        <%} else{ %>
          <ul class="mdl-list">
            <% for(Event event : events){ %>
              <li><%= event.display() %></li>
              <%}%>
          </ul>
          <%}%>
          
      <%} else{%>
        <h1>Activity Feed</h1>
        <p>Please log in.</p>
        <%}%>
      </div>
  </div>
</body>
</html>

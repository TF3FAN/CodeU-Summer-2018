<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.format.FormatStyle" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.EventStore" %>
<%@ page import="codeu.model.data.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.Instant" %>

<!DOCTYPE html>
<html>
<head>
  <title>Activity Feed</title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">

  <style>
    #activity {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
  </style>
  
  <script>
    function scrollActivity() {
      var activityDiv = document.getElementById('activity');
      activityDiv.scrollTop = activityDiv.scrollHeight;
    };
  </script>
</head>
<body>
  <%String name = (String) request.getSession().getAttribute("user");
    boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
    List<Event> events = (List<Event>) request.getAttribute("events");
    DateTimeFormatter formatter =
        DateTimeFormatter.ofLocalizedDateTime( FormatStyle.SHORT )
                     .withLocale( Locale.US )
                     .withZone( ZoneId.systemDefault() );
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

    <h1>Activity Feed</h1>

    <hr/>
    
    <div id="activity">

      <% if(name != null){%>
        <%
        if (events == null || events.isEmpty()) {
        %>
          <p>There is no activity to display.</p>
        <%} else{ %>
          <ul class="mdl-list">
            <% for(Event event : events){ %>
              <% Instant timeStamp = event.getCreationTime(); %>

              <li> <b><%=formatter.format(timeStamp)%></b>: 
                <%= event.getDescription() %>

              <% if (event.hasConversation()) {%>
                 
                   <a href="/chat/<%= event.getConversation()%>"> 
                    <%= event.getConversation() %></a>
                   <%}%>
              
              <% if (event.hasMessage()) {%>

                   "<%=event.getMessage()%>"
                   <%}%>
              </li>
              <%}%>
          </ul>
          <%}%>
          
      <%} else{%>
        <p>Please log in.</p>
        <%}%>
      </div>
  </div>
</body>
</html>

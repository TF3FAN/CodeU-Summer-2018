<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.data.Mention" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
  <title>Mentions</title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">

  <style>
      #mentions {
        background-color: white;
        height: 500px;
        overflow-y: scroll
      }
    </style>
    
    <script>
      function scrollMentions() {
        var mentionsDiv = document.getElementById('mentions');
        mentionsDiv.scrollTop = mentionsDiv.scrollHeight;
      };
    </script>
</head>
<body>
  <%String name = (String) request.getSession().getAttribute("user");%>
  <%List<Mention> userMentions = UserStore.getInstance().getUser(name).getMentions();%>
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

      <h1>Your Mentions</h1>

      <hr/>

      <div id="mentions">

          <% if(name != null){%>
            <%
            if (userMentions == null || userMentions.isEmpty()) {
            %>
              <p>You have not been mentioned yet.</p>
            <%} else{ %>
              <ul class="mdl-list">
                <% for(Mention mention : userMentions){ %>
                  <li> <a href="/chat/<%= mention.getConversation()%>"> 
                        <%= mention.getConversation() %></a> : 
                        <%= mention.getMessage() %>
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

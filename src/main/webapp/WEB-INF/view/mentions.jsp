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
        overflow-y: scroll;
        border: 3px solid #ccc;
        border-radius: 4px;
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
  <%List<Mention> userMentions;%>
  <nav>
    <a id="navTitle" href="/">Team Vogue Chats</a>
    <% if(name != null){%>
      <a>Hello <%=name%>!</a>
      <a href="/profile/<%=name %>">My Profile</a>
      <a class="active" href="/mentions">Mentions</a>
      <a href="/activity">Activity</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <% boolean admin = name != null && UserStore.getInstance().isAdminRegistered(name);
      if(admin) {%>
      <a href="/admin">Admin</a>
      <% } %>
  </nav>
  <div id="container">

      <h1>Your Mentions</h1>

      <% if(name != null){%>
        <%userMentions = UserStore.getInstance().getUser(name).getMentions();%>

        <p>This is everywhere you have been mentioned! 
        You have <%=userMentions.size()%> mention(s)!</p>

      <% } else{ %>
        <%userMentions = null;%>
        <p>You have no mentions. Please login.</p>
      <% } %>

      <hr/>

      <div id="mentions">
        <% if(name != null){ %>
          <% if(userMentions != null && userMentions.size() > 0) { %>
             <ul class="mdl-list">
              <% for(Mention mention : userMentions){ %>
                <li> Conversation <a href="/chat/<%= mention.getConversation()%>"> 
                  <%= mention.getConversation() %></a> 
                  in message "<%= mention.getMessage() %>"
                </li>
              <%}%>
            </ul>
          <% } else{ %>
            <p>  You have not been mentioned yet.</p>
          <% } %>          
              
        <%} else{%>
          <p>You can login <a href="/login">here</a>.</p>
        <%}%>
      
    </div>
  </div>
</body>
</html>

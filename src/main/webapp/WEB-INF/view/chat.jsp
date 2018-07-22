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
<%@ page import="codeu.model.data.User" %>

<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <title><%= conversation.getTitle() %></title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">

  <style>
    #chat {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>
</head>
<body onload="scrollChat()">
  <%String name = (String) request.getSession().getAttribute("user");%>
  <nav>
    <a id="navTitle" href="/">Team Vogue Chats</a>
    <% if (name != null) { %>
        <a>Hello <%= name %>!</a>
        <a href="/profile/<%=name %>">My Profile</a>
        <a href="/mentions">Mentions</a>
        <a href="/activity">Activity</a>
    <% } else { %>
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

    <h1><%= conversation.getTitle() %>
      <a href="" style="float: right">&#8635;</a></h1>

    <hr/>

    <div id="chat">
      <ul>
      <%
      /* Messages on page will be looped through, and for any appearance of the '@'
         character, the following name will be looked at, and if it is a valid user,
         the name will be bolded in purple*/
      for (Message message : messages) {
        String author = UserStore.getInstance()
          .getUser(message.getAuthorId()).getName();
      %>
        <li><strong><%= author %>: </strong><%
        String msgtxt = message.getContent();
        int startInd = msgtxt.indexOf('@');
        int help = 0;
        UserStore users = UserStore.getInstance();
        int endInd = msgtxt.length();
        while (startInd != -1 && startInd < msgtxt.length()-1){
        %><%= msgtxt.substring(help, startInd) %><%
          for (int i = startInd+1; i < msgtxt.length(); i++){
            if (!(msgtxt.charAt(i)>= 65 && msgtxt.charAt(i) <= 90)&&
            !(msgtxt.charAt(i)>= 97 && msgtxt.charAt(i) <= 122) && !(msgtxt.charAt(i)>= 48
            && msgtxt.charAt(i) <= 57)){
              endInd = i;
              break;
            }
          }
          if (users.isUserRegistered(msgtxt.substring(startInd + 1, endInd))){
          %><strong style="color:purple;"><%= msgtxt.substring(startInd+1, endInd) %></strong><%
            help = endInd;
          }
          else{
            help = startInd;
          }
          endInd = msgtxt.length();
          startInd = msgtxt.indexOf('@', startInd + 1);
        }
        %><%= msgtxt.substring(help, msgtxt.length())%>
      </li><% } %>
      </ul>
    </div>

    <hr/>

    <% if (name != null) { %>
    <form action="/chat/<%= conversation.getTitle() %>" method="POST">
        <input type="text" name="message">
        <br/>
        <button type="submit">Send</button>
    </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>

    <hr/>

  </div>

</body>
</html>

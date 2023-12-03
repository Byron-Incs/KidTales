<%-- 
    Document   : chat-usuario
    Created on : 3 dic. 2023, 09:51:15
    Author     : Evelyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../assets/js/websocket.js"></script>
    </head>
   <h1>Chat application</h1>
        <input id="username_input" placeholder="Your username">
        <div id="output"></div>
        <input id="message_input" type="text">
        <script src="../../assets/js/websocket.js"></script>
        <button onclick="send()">Send message</button> 
        <a href="../Soporte/chatsoporteprueba.jsp">ChatSoporte</a>
</html>

<%-- 
    Document   : chatsoporteprueba
    Created on : 3 dic. 2023, 10:22:57
    Author     : Evelyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
    </head>
    <body>
        <input id="username_input" placeholder="Your username">
        <div id="output"></div>
        <input id="message_input" type="text">
        <script src="../../assets/js/websocket.js"></script>
        <button type="submit"  name="accion" id="accion" value="guardar" onclick="send()">Send message</button> 
        
    </body>
    
</html>

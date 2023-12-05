<%-- 
    Document   : chat-usuario
    Created on : 3 dic. 2023, 09:51:15
    Author     : Evelyn
--%>

<%@page import="org.KidTales.ws.MessageModelService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../assets/js/websocket.js"></script>
    </head>
   <body>
       <h1>Chat application</h1>
        <input id="username_input" placeholder="Your username">
        <div id="output"></div>
        <input id="message_input" type="text">
        <script src="../../assets/js/websocket.js"></script>
        <button  type="submit" name="accion" id="accion" value="enviar" onclick="send()" >Send message</button> 
        <a href="../Soporte/chatsoporteprueba.jsp">ChatSoporte</a>
        
        <%
          String accion = request.getParameter("accion");
          if(accion.equals(accion))
          {
            MessageModelService mesagemodelS = new MessageModelService();
            mesagemodelS.agregaMensaje(Padreid, SoporteTecnicoID, contenido);
          }
        %>
    </body>
</html>

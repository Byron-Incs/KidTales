<%-- 
    Document   : tiempo
    Created on : 26 nov. 2023, 12:15:02
    Author     : hoid
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Chat Usuario</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Chat Usuario">

        <link rel="shortcut icon" href="../../../assets/images/index/logoc.jpg">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">

        <link rel="stylesheet" type="text/css" href="chat.css">
        
        <style>
            #message_input,
            #username_input {
                border: 1px solid #ccc; 
                border-radius: 5px; 
                padding: 8px; 
                margin-bottom: 10px; 
            }

            #message_input::placeholder {
                color: #aaa; 
            }
        </style>


    </head>
    <body>
                 <%
                     
                    
            // Recuperar userId de la sesión
            HttpSession sesion = request.getSession();
            String userId = (String) sesion.getAttribute("userId");
            String usernamesession =(String) sesion.getAttribute("usernamessesion"); 
            
            Connection conexion = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;

            String username = null;
            String usernameSoporte = null;
            String idSoporte =null;
            List<String> nicknames = new ArrayList<>();

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/KidTalesDB", "root", "1234");

                String selectUsernameQuery = "SELECT Nombre FROM Usuario WHERE UserID = ?";
                statement = conexion.prepareStatement(selectUsernameQuery);
                statement.setString(1, userId);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    username = resultSet.getString("Nombre");
                }

                String selectSoporte = "SELECT SoporteTecnicoID  from  Chat where PadreID = ?";
                statement = conexion.prepareStatement(selectSoporte);
                statement.setString(1, userId);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    idSoporte = resultSet.getString("SoporteTecnicoID");
                }

                
                String selectSoporteNombre = "SELECT Nombre FROM Usuario WHERE UserID = ?";
                statement = conexion.prepareStatement(selectUsernameQuery);
                statement.setString(1, idSoporte);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    usernameSoporte = resultSet.getString("Nombre");
                }
                
                
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
                    if (conexion != null) {
                        conexion.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <!-- Header START -->
        <header class="navbar-light header-sticky backheader">
            <!-- Logo Nav START -->
            <nav class="navbar navbar-expand-xl">
                <div class="container">
                    <!-- Logo START -->
                    <a class="navbar-brand" href="">
                        <img class="logo-grande " src="../../../assets/images/index/logog.png" alt="logo">

                    </a>
                    <!-- Logo END -->
                    <button class="navbar-toggler ms-sm-auto mx-3 me-md-0 p-0 p-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCategoryCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-animation">
                            <span></span>
                            <span></span>
                            <span></span>
                        </span>
                    </button>

                    <div class="navbar-collapse collapse" id="navbarCategoryCollapse">
                        <ul class="navbar-nav navbar-nav-scroll nav-pills-primary-soft text-center ms-auto p-2 p-xl-0">
                            <li class="avatar">
                                <img class="avatar-img" src="../../../assets/images/index/globitos2.png" alt="avatar">
                            </li>
                            <li class="nav-item"> 
                                <a class="nav-link" href="../../../Pages/inicio.jsp">Cerrar Sesión</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Logo Nav END -->
        </header>
        <!-- Header END -->

        <!-- **************** MAIN CONTENT START **************** -->
        <main>
            <br>
            <!-- =======================-->
            <section class="body-chat">
                <div class="seccion-titulo">
                    <h3>
                        <i class="fas fa-comments"></i>
                        Chat Usuario
                    </h3>
                </div>
                
                <div class="seccion-chat">
                    <div class="usuario-seleccionado">
                        <div class="avatar">
                            <img src="../../../assets/images/perfiles/usuario.svg" alt="img">
                        </div>
                        <div class="cuerpo">
                            <span><%=usernamesession%></span>
                        </div>

                    </div>
                    <div class="panel-chat">
                        
                    </div>
                    <div class="panel-escritura">
                        <div id="output"></div>
                            <input id="message_input"  placeholder="Escribir mensaje" type="text">
                            <input id="username_input"  type="text" value="<%=usernamesession%>" hidden>
                            
                            <button type="button" onclick="send()">
                                <i class="fas fa-paper-plane logocolor"></i>
                            </button>
                             <script src="../../../assets/js/websocket.js"></script> 
                    </div>
                </div>
            </section>
        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

       <!-- Bootstrap JS -->
        <script src="../../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="../../../assets/js/functions.js"></script>
        
    </body>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        var usuarios = document.querySelectorAll('.usuario');
    
        usuarios.forEach(function (usuario) {
            usuario.addEventListener('click', function () {
                // ObtÃ©n el nombre del usuario desde el atributo data-usuario
                var nombreUsuario = usuario.getAttribute('data-usuario');
                
                // Muestra el chat correspondiente al usuario
                mostrarChat(nombreUsuario);
            });
        });
    
        function mostrarChat(nombreUsuario) {
            // Oculta todos los chats
            var chats = document.querySelectorAll('.panel-chat .mensaje');
            chats.forEach(function (chat) {
                chat.style.display = 'none';
            });
    
            // Muestra el chat del usuario seleccionado
            var chatUsuario = document.querySelector('.panel-chat .mensaje[data-usuario="' + nombreUsuario + '"]');
            if (chatUsuario) {
                chatUsuario.style.display = 'block';
            }
    
            // Actualiza el usuario seleccionado en el panel de informaciÃ³n del chat
            var usuarioSeleccionado = document.querySelector('.usuario-seleccionado span');
            usuarioSeleccionado.textContent = nombreUsuario;
        }
    });
    </script>
</html>

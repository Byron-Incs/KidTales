<%-- 
    Document   : tiempo
    Created on : 26 nov. 2023, 12:15:02
    Author     : hoid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Chat Soporte</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Chat Soporte">

        <link rel="shortcut icon" href="../../assets/images/index/logoc.jpg">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <link rel="stylesheet" type="text/css" href="../../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="../../assets/css/style.css">

        <link rel="stylesheet" type="text/css" href="chat.css">


    </head>


    <body>
        <!-- Header START -->
        <header class="navbar-light header-sticky backheader">
            <!-- Logo Nav START -->
            <nav class="navbar navbar-expand-xl">
                <div class="container">
                    <!-- Logo START -->
                    <a class="navbar-brand" href="">
                        <img class="logo-grande " src="../../assets/images/index/logog.png" alt="logo">

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
                                <img class="avatar-img" src="../../assets/images/index/globitos2.png" alt="avatar">
                            </li>
                            <li class="nav-item"> 
                                <a class="nav-link" href="../../Pages/inicio.jsp">Cerrar Sesión</a>
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
                        Chat Soporte
                    </h3>
                </div>
                <div class="seccion-usuarios">
                    <div class="seccion-buscar">
                        <div class="input-buscar">
                            <input type="search" placeholder="Buscar usuario">
                            <i class="fas fa-search"></i>
                        </div>
                    </div>
                    <div class="seccion-lista-usuarios">
                        <div class="usuario" data-usuario="hoid">
                            <div class="avatar">
                                <img src="../../assets/images/perfiles/usuario.svg" alt="img">
                                <span class="estado-usuario enlinea"></span>
                            </div>
                            <div class="cuerpo">
                                <span> Hoid</span>
                                <span>"detalles de mensaje"</span>
                            </div>
                        </div>
                        <div class="usuario" data-usuario="armonia">
                            <div class="avatar">
                                <img src="../../assets/images/perfiles/usuario.svg" alt="img">
                                 <span class="estado-usuario enlinea"></span>
                            </div>
                            <div class="cuerpo">
                                <span> Armonia</span>
                                <span>"detalles de mensaje"</span>
                            </div>
                        </div>
                        <div class="usuario" data-usuario="henry">
                            <div class="avatar">
                                <img src="../../assets/images/perfiles/usuario.svg" alt="img">
                                 <span class="estado-usuario enlinea"></span>
                            </div>
                            <div class="cuerpo">
                                <span> Henry</span>
                                <span>"detalles de mensaje"</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="seccion-chat">
                    <div class="usuario-seleccionado">
                        <div class="avatar">
                            <img src="../../assets/images/perfiles/usuario.svg" alt="img">
                        </div>
                        <div class="cuerpo">
                            <span>Hoid</span>
                            
                        </div>

                    </div>
                    <div class="panel-chat">
                        <div class="mensaje">
                            <div class="avatar">
                                <img src="../../assets/images/perfiles/usuario.svg" alt="img">
                            </div>
                            <div class="cuerpo">
                                <div class="texto">
                                    Lorem ipsum dolor sit, amet consectetur adipisicing, elit. Dolor eligendi voluptatum dolore voluptas iure.
                                </div>
                            </div>
                        </div>
                        <!-- derecha -->
                        <div class="mensaje left">
                            <div class="cuerpo">
                                <!-- <img src="http://localhost/multimedia/png/user-foto-3.png" alt=""> -->
                                <div class="texto">
                                    Lorem ipsum dolor sit, amet consectetur adipisicing, elit. Dolor eligendi voluptatum dolore voluptas iure.
                                </div>
                            </div>
                            <div class="avatar">
                                <img src="../../assets/images/perfiles/soporte.svg" alt="img">
                            </div>
                        </div>
                    </div>
                    <div class="panel-escritura">
                        <form class="textarea">
                            <textarea placeholder="Escribir mensaje"></textarea>
                            <button type="button" class="enviar">
                                <i class="fas fa-paper-plane logocolor"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </section>

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

       <!-- Bootstrap JS -->
        <script src="../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="../../assets/js/functions.js"></script>
        
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

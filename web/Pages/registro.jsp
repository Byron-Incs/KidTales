<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="org.KidTales.dao.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>KidTales - Incio de Sesión</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Webestica.com">
        <meta name="description" content="KidTales">

        <link rel="shortcut icon" href="../assets/images/index/logoc.jpg">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <link rel="stylesheet" type="text/css" href="../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">

    </head>


    <body>
        <%
            String accion = request.getParameter("accion");

            String url = "jdbc:mysql://localhost:3306/KidTalesBD";
            String usuario = "root";
            String contrasena = "1234";

            String email = request.getParameter("email");
            String nombre = request.getParameter("nombre");
            String contra = request.getParameter("pasword");
            
            Usuario user = new Usuario();
            user.setPasword(contra);
            user.setCorreo(email);
            user.setUsername(nombre);

            if ("Guardar".equals(accion)) {

                if (email.isEmpty() && nombre.isEmpty() && contra.isEmpty()) {

        %>

        <script>

            alert("¡Llena todos los campos!");

        </script>

        <%        } else {

            if ("Guardar".equals(accion)) {

                Connection conexion = null;
                Statement sentencia = null;

                PreparedStatement statement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conexion = DriverManager.getConnection(url, usuario, contrasena);
                    sentencia = conexion.createStatement();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                System.out.println(email);
                System.out.println(nombre);
                System.out.println(contra);

                String consulta = "INSERT INTO usuario (correo, username, pasword) VALUES ('" + email + "', '" + nombre + "', '" + "', '" + contra + "')";

                try {
                    sentencia.executeUpdate(consulta);

                } catch (SQLException e) {
                    e.printStackTrace();
                }

                String selectQuery = "SELECT id_usuario FROM Usuario WHERE curp = ?";
                statement = conexion.prepareStatement(selectQuery);
                statement.setString(1, curp);
                resultSet = statement.executeQuery();

                int id = 0; // Inicializar la variable "id" antes de asignarle un valor

                if (resultSet.next()) {
                    id = resultSet.getInt("id_usuario");
                }

                String consulta1 = "INSERT INTO roles_usuario (id_usuario, id_rol) VALUES ('" + id + "', '" + "2" + "')";

                try {
                    sentencia.executeUpdate(consulta1);

                } catch (SQLException e) {
                    e.printStackTrace();
                }

                try {
                    if (sentencia != null) {
                        sentencia.close();
                    }
                    if (conexion != null) {
                        conexion.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                HttpSession sesion = request.getSession();
                session.setAttribute("user", user);

        %>

        <script>
            window.location.href = '/Usuario/soporteusuario.jsp';
        </script>



        <%            }
                }
            }


        %>

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Content START -->
            <section class="vh-xxl-100">
                <div class="container h-100 d-flex px-0 px-sm-4">
                    <div class="row justify-content-center align-items-center m-auto">
                        <div class="col-12">
                            <div class="bg-mode shadow rounded-3 overflow-hidden">
                                <div class="row g-0">
                                    <!-- Vector Image -->
                                    <div class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <img src="../assets/images/registro/img1.svg" alt="">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-6">
                                            <!-- Logo -->
                                            <a href="../index.html">
                                                <img class="h-50px mb-4" src="../assets/images/index/logoc.jpg" alt="logo">
                                            </a>
                                            <!-- Title -->
                                            <h1 class="mb-2 h3">Crear Cuenta</h1>
                                            <p class="mb-0">Ya tienes cuenta?<a href="inicio.jsp"> Ingresa</a></p>

                                            <!-- Form START -->
                                            <form class="mt-4 text-start">
                                                <!-- Email -->
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input type="email" class="form-control" name="email" id="email">
                                                </div>
                                                <!-- Nombre de usuario-->
                                                <div class="mb-3">
                                                    <label class="form-label">Nombre de Usuario</label>
                                                    <input type="text" class="form-control" name="nombre" id="nombre">
                                                </div>
                                                <!-- Password -->
                                                <div class="mb-3 position-relative">
                                                    <label class="form-label">Contraseña</label>
                                                    <input class="form-control fakepassword" type="password" name="pasword" id="pasword">
                                                    <span class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
                                                        <i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
                                                    </span>
                                                </div>
                                                <!-- Confirm Password -->
                                                <div class="mb-3">
                                                    <label class="form-label">Confirmar Contraseña</label>
                                                    <input type="password" class="form-control">
                                                </div>
                                                <!-- Remember me -->
                                                <div class="mb-3">
                                                    <input type="checkbox" class="form-check-input" id="rememberCheck">
                                                    <label class="form-check-label" for="rememberCheck">Mantener Sesión Activa</label>
                                                </div>
                                                <!-- Button -->
                                                <div><button type="submit" class="btn btn-primary w-100 mb-0">Registrar</button></div>

                                                <!-- Copyright -->
                                                <div class="text-primary-hover mt-3 text-center"> Copyrights © 2023 Byron Inc.</div>
                                            </form>
                                            <!-- Form END -->
                                        </div>		
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- =======================
            Main Content END -->

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Bootstrap JS -->
        <script src="../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="../assets/js/functions.js"></script>

    </body>
</html>
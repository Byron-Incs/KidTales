<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="org.KidTales.dao.Usuario"%>
<%@page import="org.KidTales.dao.bdConection"%>
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

            if (accion != null && accion.equals("Guardar")) {
                String email = request.getParameter("email");
                String contra = request.getParameter("pasword");
                String nom = request.getParameter("nombre");

                if (email.isEmpty() || contra.isEmpty() || nom.isEmpty()) {
        %>
        <script>
            alert("¡Llena todos los campos!");
        </script>
        <%
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
        %>
        <script>
            alert("El correo electrónico no tiene la estructura necesaria.");
        </script>
        <%
        } else if (contra.length() < 7) {
        %>
        <script>
            alert("La contraseña debe tener al menos 7 caracteres.");
        </script>
        <%
        } else {
            Connection conexion = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/KidTalesDB", "root", "1234");

                // Verificar si el correo ya existe en la base de datos
                String verificaCorreoSQL = "SELECT correo FROM usuario WHERE correo=?";
                statement = conexion.prepareStatement(verificaCorreoSQL);
                statement.setString(1, email);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
        %>
        <script>
            alert("El correo electrónico ya está registrado.");
        </script>
        <%
        } else {
            // El correo no existe, proceder con la inserción
            String insertSQL = "INSERT INTO usuario (username, correo, pasword) VALUES (?, ?, ?)";
            statement = conexion.prepareStatement(insertSQL);
            statement.setString(1, nom);
            statement.setString(2, email);
            statement.setString(3, contra);

            int filasAfectadas = statement.executeUpdate();
            if (filasAfectadas > 0) {
        %>
        <script>
            window.location.href = "../Pages/Usuario/indexusuario.html";
        </script>
        <%
                            }
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
                                                <div><button type="submit" class="btn btn-primary w-100 mb-0" name = "accion" id="accion" value ="Guardar">Registrar</button></div>

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
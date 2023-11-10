<%@page import="org.KidTales.dao.Usuario"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>KidTales - Incio de Sesión</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Webestica.com">
        <meta name="description" content="e-Services">

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
            String check = request.getParameter("check");

            String url = "jdbc:mysql://localhost:3306/KidTalesDB";
            String usuario = "root";
            String contrasena = "1234";

            if ("Guardar".equals(accion)) {
                String email = request.getParameter("email");
                String contra = request.getParameter("pasword");

                if (email.equals("") || contra.equals("")) {
        %>
        <script>
            alert("¡Llena todos los campos!");
        </script>
        <%
        } else {
            Connection conexion = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection(url, usuario, contrasena);

                String emailQuery = "SELECT COUNT(*) FROM usuario WHERE correo = ?";
                statement = conexion.prepareStatement(emailQuery);
                statement.setString(1, email);
                resultSet = statement.executeQuery();

                int emailCount = 0;

                if (resultSet.next()) {
                    emailCount = resultSet.getInt(1);
                }

                if (emailCount == 0) {
        %>
        <script>
            alert("El correo no está registrado");
        </script>
        <%
        } else {
            String selectQuery = "SELECT pasword FROM usuario WHERE correo = ?";
            statement = conexion.prepareStatement(selectQuery);
            statement.setString(1, email);
            resultSet = statement.executeQuery();

            String psw = null;

            if (resultSet.next()) {
                psw = resultSet.getString("pasword");
            }

            String selectQuery2 = "SELECT soporte FROM usuario WHERE correo = ?";
            statement = conexion.prepareStatement(selectQuery2);
            statement.setString(1, email);
            resultSet = statement.executeQuery();

            int soporte = 0;

            if (resultSet.next()) {
                soporte = resultSet.getInt("soporte");
            }

            if (psw != null && psw.equals(contra) && soporte == 1) {
        %>
        <script>
            window.location.href = "../Pages/Soporte/soporte.jsp";
        </script>
        <%
        }else if(psw != null && psw.equals(contra)){

         %>
        <script>
            window.location.href = "../Pages/Usuario/indexusuario.html";
        </script>
        <%

        } else {
        %>
        <script>
            alert("La contraseña es incorrecta");
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
                                    <div class="col-lg-6 d-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <img src="../assets/images/inicio/img1.svg" alt="">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-7">
                                            <!-- Logo -->
                                            <a href="../index.html">
                                                <img class="h-50px mb-4" src="../assets/images/index/logoc.jpg" alt="logo">
                                            </a>
                                            <!-- Title -->
                                            <h1 class="mb-2 h3">Bienvenido</h1>
                                            <p class="mb-0">Nuevo aquí?<a href="registro.jsp"> Crea una cuenta</a></p>

                                            <!-- Form START -->
                                            <form class="mt-4 text-start">
                                                <!-- Email -->
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input type="email" class="form-control" name="email" id="email">
                                                </div>
                                                <!-- Password -->
                                                <div class="mb-3 position-relative">
                                                    <label class="form-label">Contraseña</label>
                                                    <input class="form-control fakepassword" type="password" name="pasword" id="pasword">
                                                    <span class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
                                                        <i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
                                                    </span>
                                                </div>
                                                <!-- Remember me -->
                                                <div class="mb-3 d-sm-flex justify-content-between">
                                                    <div>
                                                        <input type="checkbox" class="form-check-input" id="rememberCheck">
                                                        <label class="form-check-label" for="rememberCheck">Recordar</label>
                                                    </div>
                                                    <a href="forgot-password.jsp">Olvidaste tu contraseña?</a>
                                                </div>
                                                <!-- Button -->
                                                <div><button type="submit" class="btn btn-primary w-100 mb-0" name = "accion" id="accion" value ="Guardar">Ingresar</button></div>


                                                <!-- Copyright -->
                                                <div class="text-primary-hover mt-3 text-center"> Copyrights © 2023 Byron Inc</div>
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
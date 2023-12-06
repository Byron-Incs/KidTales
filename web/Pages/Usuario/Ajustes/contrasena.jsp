<%-- 
    Document   : tiempo
    Created on : 26 nov. 2023, 12:15:02
    Author     : hoid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="org.KidTales.dao.Usuario"%>
<%@page import="org.KidTales.dao.bdConection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Ajustes-Contraseña</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Ajustes-Contraseña">

        <link rel="shortcut icon" href="../../../assets/images/index/logoc.jpg">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">

    </head>


    <body>
        
        
            <%
            Usuario sesionU = (Usuario) session.getAttribute("user");
            String accion = request.getParameter("accion");

            if (accion != null && accion.equals("Guardar")) {
                String newPsw = request.getParameter("paswordN");
                String psw = request.getParameter("pasword");

                // Validar que la contraseña anterior sea correcta antes de cambiarla
                if (psw.equals(sesionU.getPasword())) {
                    // Contraseña anterior es correcta, proceder a cambiarla
                    Connection conexion = null;
                    PreparedStatement statement = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/KidTalesDB", "root", "1234");

                        // Actualizar la contraseña en la base de datos
                        String sql = "UPDATE Usuario SET Contrasena = ? WHERE UserID = ?";
                        statement = conexion.prepareStatement(sql);
                        statement.setString(1, newPsw);
                        statement.setInt(2, sesionU.getId_up());
                        statement.executeUpdate();

                        // Actualizar la contraseña en el objeto Usuario almacenado en la sesión
                        sesionU.setPasword(newPsw);
                        session.setAttribute("user", sesionU);

                        out.println("<p class='text-success'>Contraseña cambiada exitosamente.</p>");
                    } catch (Exception e) {
                        out.println("<p class='text-danger'>Error al cambiar la contraseña: " + e.getMessage() + "</p>");
                    } finally {
                        // Cerrar recursos (statement y conexión)
                        try {
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
                } else {
                    out.println("<p class='text-danger'>La contraseña anterior es incorrecta.</p>");
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
                                            <img src="../../../assets/images/ajustes/contraseña2.svg" alt="">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-6">
                                            <!-- Logo -->
                                            <a href="../../../index.html">
                                                <img class="h-50px mb-4" src="../../../assets/images/index/logoc.jpg" alt="logo">
                                            </a>
                                            <!-- Title -->
                                            <h1 class="mb-2 h3">Cambiar contraseña</h1>

                                            <!-- Form START -->
                                            <form class="mt-4 text-start">
                                                <!-- Password -->
                                                <div class="mb-3 position-relative">
                                                    <label class="form-label">Nueva contraseña</label>
                                                    <input class="form-control fakepassword" type="password" name="paswordN" id="paswordN">
                                                    <span class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
                                                        <i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
                                                    </span>
                                                </div>
                                                <!-- Password -->
                                                <div class="mb-3 position-relative">
                                                    <label class="form-label">Contraseña anterior</label>
                                                    <input class="form-control fakepassword" type="password" name="pasword" id="pasword">
                                                    <span class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
                                                        <i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
                                                    </span>
                                                </div>
                                                <div><br></div>
                                                <div class="d-flex justify-content-center text-center">
                                                    <div class="mb-2 me-3">
                                                        <button type="submit" class="btn btn-primary w-100 mb-1" name="accion" id="accion" value="Guardar">Cambiar</button>
                                                    </div>

                                                    <div class="mb-6">
                                                        <button type="Button" class="btn btn-primary w-10 mb-1" name="regresar" id="regresar" value="Regresar" onclick="redirigirAPagina()">Regresar</button>
                                                    </div>
                                                </div>
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

            <script>
                function redirigirAPagina() {
                    window.location.href = "../ajustes.jsp";
                }
            </script>

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Bootstrap JS -->
        <script src="../../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="../../../assets/js/functions.js"></script>

    </body>
</html>

<%-- 
    Document   : tiempo
    Created on : 26 nov. 2023, 12:15:02
    Author     : hoid
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Ajustes-Tiempo Pantalla</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Ajustes-Tiempo en Pantalla">

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
            // Recuperar userId de la sesión
            HttpSession sesion = request.getSession();
            String userId = (String) session.getAttribute("userId");

            Connection conexion = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;

            String tiempoPantalla = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/KidTalesDB", "root", "1234");

                String selectUsernameQuery = "SELECT TiempoPantalla FROM ConfiguracionPadre WHERE UserID = ?";
                statement = conexion.prepareStatement(selectUsernameQuery);
                statement.setString(1, userId);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    tiempoPantalla = resultSet.getString("TiempoPantalla");
                }

                String tiempoSeleccionado = request.getParameter("tiempoSeleccionado");
                if (tiempoSeleccionado != null && !tiempoSeleccionado.isEmpty()) {
                    // Actualizar el valor en la base de datos
                    String updateQuery = "UPDATE ConfiguracionPadre SET TiempoPantalla = ? WHERE UserID = ?";
                    statement = conexion.prepareStatement(updateQuery);
                    statement.setString(1, tiempoSeleccionado);
                    statement.setString(2, userId);
                    statement.executeUpdate();
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

        <script>
            // Lógica para activar las casillas según el valor recuperado de la base de datos
            function activarCasillas(tiempoPantalla) {
                // Desactivar todas las casillas
                document.getElementById("rememberCheck").disabled = true;
                document.getElementById("rememberCheck2").disabled = true;

                // Activar casillas según el valor de tiempoPantalla
                if (tiempoPantalla == 1) {
                    document.getElementById("rememberCheck").disabled = false;
                } else if (tiempoPantalla == 2) {
                    document.getElementById("rememberCheck2").disabled = false;
                }
            }

            // Llamada a la función con el valor recuperado de la base de datos
            activarCasillas(<%= tiempoPantalla%>);

            // Función para guardar en la base de datos
            function guardarEnBaseDeDatos() {
                var casilla1 = document.getElementById("rememberCheck").checked;
                var casilla2 = document.getElementById("rememberCheck2").checked;

                // Si ambas casillas están seleccionadas, mostrar alerta
                if (casilla1 && casilla2) {
                    alert("No puedes seleccionar ambas casillas. Elige una opción.");
                    return; // Detener la ejecución
                }

                // Si solo se selecciona una casilla, establecer el valor en el campo oculto
                var tiempoSeleccionado = "";
                if (casilla1) {
                    tiempoSeleccionado = "1";
                } else if (casilla2) {
                    tiempoSeleccionado = "2";
                } else {
                    alert("Selecciona al menos una casilla.");
                    return; // Detener la ejecución si no se selecciona ninguna casilla
                }

                // Realizar la actualización en la base de datos mediante AJAX
                actualizarEnBaseDeDatos(tiempoSeleccionado);
            }

            // Función para realizar la actualización en la base de datos mediante AJAX
            function actualizarEnBaseDeDatos(tiempoSeleccionado) {
                // Realizar la solicitud AJAX
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Manejar la respuesta si es necesario
                        alert("Datos guardados en la base de datos");
                    }
                };

                // Configurar y enviar la solicitud AJAX
                xhttp.open("GET", "guardarTiempo.jsp?tiempoSeleccionado=" + tiempoSeleccionado, true);
                xhttp.send();
            }
        </script>

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Content START -->
            <section class="vh-xxl-100">
                <div class="container h-100 d-flex px-0 px-sm-0">
                    <div class="row justify-content-center align-items-center m-auto">
                        <div class="col-12">
                            <div class="bg-mode shadow rounded-3 overflow-hidden">
                                <div class="row g-0">
                                    <!-- Vector Image -->
                                    <div class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <img src="../../../assets/images/ajustes/tiempo2.svg" alt="">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-6">
                                            <!-- Logo -->
                                            <a href="">
                                                <img class="h-50px mb-4" src="../../../assets/images/index/logoc.jpg" alt="logo">
                                            </a>
                                            <!-- Title -->
                                            <h1 class="mb-2 h3">Tiempo en Pantalla</h1>
                                            <p class="mb-0">¿Cuántas horas quiere que su hijo pueda utilizar la app?</p>

                                            <!-- Form START -->
                                            <form class="mt-4 text-start">
                                                <!-- Email -->
                                                <div class="mb-3">
                                                    <input type="checkbox" class="form-check-input" id="rememberCheck">
                                                    <label class="form-check-label" for="rememberCheck">1 Hora</label>
                                                </div>
                                                <div class="mb-3">
                                                    <input type="checkbox" class="form-check-input" id="rememberCheck2">
                                                    <label class="form-check-label" for="rememberCheck">2 Horas</label>
                                                </div>
                                                <div>
                                                    <br>
                                                </div>

                                                <!-- Campo oculto para almacenar el valor seleccionado -->
                                                <input type="hidden" id="tiempoSeleccionado" name="tiempoSeleccionado" value="">

                                                <!-- Button -->
                                                <div class="d-flex justify-content-center text-center">
                                                    <div class="mb-2 me-3">
                                                        <button type="submit" class="btn btn-primary w-100 mb-1" name="accion" id="accion" value="Guardar">Cambiar</button>
                                                    </div>

                                                    <div class="mb-6">
                                                        <button type="button" class="btn btn-primary w-10 mb-1" name="accion" id="regresar" value="Regresar" onclick="redirigirAPagina()">Regresar</button>
                                                    </div>
                                                </div>                                             </div>
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

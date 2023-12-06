<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Perfiles</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="KidTales">

        <link rel="shortcut icon" href="../../assets/images/index/logoc.jpg">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <link rel="stylesheet" type="text/css" href="../../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="../../assets/css/style.css">

        <style>

            .logo-grande {
                width: 500px;
                height: auto;
            }
            
            .logo-header {
                width: 50px;
                height: auto;
            }
            body{
                margin: auto;
            }

        </style>

    </head>


    <body>
        <%
            // Recuperar userId de la sesión
            HttpSession sesion = request.getSession();
            String userId = (String) session.getAttribute("userId");

            Connection conexion = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;

            String username = null;
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

                String selectNicknamesQuery = "SELECT Nickname FROM Nino WHERE UserID = ?";
                try (PreparedStatement nicknamesStatement = conexion.prepareStatement(selectNicknamesQuery)) {
                    nicknamesStatement.setString(1, userId);
                    try (ResultSet nicknamesResultSet = nicknamesStatement.executeQuery()) {
                        while (nicknamesResultSet.next()) {
                            nicknames.add(nicknamesResultSet.getString("Nickname"));
                        }
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
        %>
        <!-- **************** MAIN CONTENT START **************** -->
         <!-- Header START -->
        <header class="navbar-light header-sticky backheader">
            <!-- Logo Nav START -->
            <nav class="navbar navbar-expand-xl">
                <div class="container">
                    <!-- Logo START -->
                    <a class="navbar-brand" href="">
                        <img class="logo-header " src="../../assets/images/index/logog.png" alt="logo">

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
        
        <main>

            <!-- =======================
            Main Content START -->

            <section class="vh-xxl-100">
                <div class="container h-100 d-flex px-0 px-sm-4">
                    <div class="row justify-content-center align-items-center m-auto">
                        <div class="col-12">
                            <div class="bg-mode shadow rounded-3 overflow-hidden">
                                <div class="row g-0">
                                    <div class="col-sm-12 text-center mx-auto">
                                        <!-- Title -->
                                        <img  class= "logo-grande" src="../../assets/images/perfiles/perfiles.svg" alt="logo">
                                        <hr class="opacity-1">   
                                    </div>
                                    <!-- Vector Image -->
                                    <div class="col-lg-4 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <a href="ajustes.jsp">
                                                <img src="../../assets/images/perfiles/usuario.svg" alt="">
                                                <p align="center" style="color: black ; font-size: 21px" class="active"><strong><%= username%></strong></p>
                                            </a>
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>
                                    <%
                                        for (int i = 0; i < nicknames.size(); i++) {
                                            String nickname = nicknames.get(i);
                                    %>
                                    <div class="col-lg-4 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <a href="Favoritos.jsp">
                                                <img src="../../assets/images/perfiles/subusuario1.svg" alt="">
                                                <p align="center" style="color: black ; font-size: 21px" class="active"><strong><%= nickname%></strong></p>
                                            </a>
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <!-- Information -->
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
        <script src="../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="../../assets/js/functions.js"></script>

    </body>
</html>
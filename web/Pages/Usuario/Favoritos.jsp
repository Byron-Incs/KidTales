<%-- 
    Document   : Favoritos
    Created on : 26 nov. 2023, 10:27:00
    Author     : hoid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Perfiles</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Webestica.com">
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


        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Content START -->

            <section class="vh-xxl-100">
                <div class="col-12 d-flex align-items-center justify-content-center">
                    <img src="../../assets/images/favoritos/favs.svg" class="logo-grande" alt="">
                </div>
                <div class="container h-100 d-flex px-0 px-sm-4">
                    <div class="row justify-content-center align-items-center m-auto">
                        <div class="col-12">
                            <div class="bg-mode shadow rounded-3 overflow-hidden">
                                <div class="row g-0">
                                    <div class="row mb-4">
                                    </div>

                                    <div class="row g-4">
                                        <div class="col-sm-6 col-lg-4">
                                            <div class="card card-element-hover bg-transparent">
                                                <div class="position-relative">
                                                    <img src="../../assets/images/index/bosque.svg" class="card-img" alt="">
                                                </div>

                                                <div class="card-body px-2 pb-0">
                                                    <h5 class="card-title" style="text-align: center"><a href="bosque.jsp">El bosque de los susurros</a></h5>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-lg-4">
                                            <div class="card card-element-hover bg-transparent">
                                                <div class="position-relative">
                                                    <img src="../../assets/images/index/espacio.svg" class="card-img" alt="">
                                                </div>

                                                <div class="card-body px-2 pb-0">
                                                    <h5 class="card-title" style="text-align: center"><a href="espacio.jsp">El viaje estelar

                                                        </a></h5>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-lg-4">
                                            <div class="card card-element-hover bg-transparent">
                                                <div class="position-relative">

                                                    <img src="../../assets/images/index/mar.svg" class="card-img" alt="">
                                                </div>

                                                <div class="card-body px-2 pb-0">
                                                    <h5 class="card-title" style="text-align: center"><a href="mar.jsp">En el mar zafiro</a></h5>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Information -->

                                    </div>
                                    <div class="row g-4">
                                        <div class="col-sm-6 col-lg-4">
                                            <div class="card card-element-hover bg-transparent">
                                                <div class="position-relative">
                                                    <img src="../../assets/images/favoritos/tesoro.svg" class="card-img" alt="">
                                                </div>

                                                <div class="card-body px-2 pb-0">
                                                    <h5 class="card-title" style="text-align: center"><a href="bosque.jsp">El tesoro de Hoid</a></h5>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-lg-4">
                                            <div class="card card-element-hover bg-transparent">
                                                <div class="position-relative">
                                                    <img src="../../assets/images/favoritos/casa.svg" class="card-img" alt="">
                                                </div>

                                                <div class="card-body px-2 pb-0">
                                                    <h5 class="card-title" style="text-align: center"><a href="espacio.jsp">La casa abandonada

                                                        </a></h5>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-lg-4">
                                            <div class="card card-element-hover bg-transparent">
                                                <div class="position-relative">

                                                    <img src="../../assets/images/favoritos/luna.svg" class="card-img" alt="">
                                                </div>

                                                <div class="card-body px-2 pb-0">
                                                    <h5 class="card-title" style="text-align: center"><a href="mar.jsp">La luna olvidada</a></h5>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Information -->

                                    </div>
                                    <div class="row mb-4">
                                    </div>
                                    <div class="row mb-4">
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

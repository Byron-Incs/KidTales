<%-- 
    Document   : soporteusuario
    Created on : 1 nov. 2023, 13:51:48
    Author     : Evelyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>KidTales</title>

        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Byron empresa">

        <!-- Favicon -->
        <link rel="shortcut icon" href="../../assets/images/Index/logoc.jpg">

        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <!-- Plugins CSS -->
        <link rel="stylesheet" type="text/css" href="../../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <!-- Theme CSS -->
        <link rel="stylesheet" type="text/css" href="../../assets/css/style.css">

    </head>





    <body>

        <!-- Header START -->
        <!-- Header START -->
        <header class="navbar-light header-sticky">
            <!-- Logo Nav START -->
            <nav class="navbar navbar-expand-xl">
                <div class="container">
                    <!-- Logo START -->
                    <a class="navbar-brand" href="indexusuario.html">
                        <img class="light-mode-item navbar-brand-item" src="../../assets/images/index/logoc.jpg" alt="logo">

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
                            <li class="nav-item"> <a class="nav-link" href="indexusuario.html">Inicio</a></li>
                            <li class="nav-item"> <a class="nav-link" href="conocenos.html">Conócenos</a></li>
                            <li class="nav-item"><a class="nav-link" href="soporteusuario.html">Soporte Técnico</a></li>
                            <li class="nav-item"><a id="logoutLink" class="nav-link" href="#">Cerrar Sesión</a></li>

                            <script>
                                document.getElementById("logoutLink").addEventListener("click", function () {
                                    var xhr = new XMLHttpRequest();
                                    xhr.onreadystatechange = function () {
                                        if (xhr.readyState === 4 && xhr.status === 200) {
                                            window.location.href = "../../index.html";
                                        }
                                    };
                                    xhr.open("GET", "logout.jsp", true);
                                    xhr.send();
                                });
                            </script>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Logo Nav END -->
        </header>
        <!-- Header END -->


        <!-- **************** MAIN CONTENT START **************** -->
        <main>
            <!-- Chat Section -->
            <div class="p-2 m-auto col-md-10">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center p-3" style="border-top: 4px solid #ffa900;">
                        <h5 class="mb-0">Chat messages</h5>
                        <div class="d-flex flex-row align-items-center">
                            <span class="badge bg-warning me-3">20</span>
                            <i class="fas fa-minus me-3 text-muted fa-xs"></i>
                            <i class="fas fa-comments me-3 text-muted fa-xs"></i>
                            <i class="fas fa-times text-muted fa-xs"></i>
                        </div>
                    </div>
                    <div class="card-body" data-mdb-perfect-scrollbar="true" style="position: relative; height: 400px">
                        <div class="d-flex justify-content-between">
                            <p class="small mb-1">Timona Siera</p>
                            <p class="small mb-1 text-muted">23 Jan 2:00 pm</p>
                        </div>
                        <div class="d-flex flex-row justify-content-start">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava5-bg.webp"
                                 alt="avatar 1" style="width: 45px; height: 100%;">
                            <div>
                                <p class="small p-2 ms-3 mb-3 rounded-3" style="background-color: #f5f6f7;">For what reason
                                    would it
                                    be advisable for me to think about business content?</p>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <p class="small mb-1 text-muted">23 Jan 2:05 pm</p>
                            <p class="small mb-1">Johny Bullock</p>
                        </div>
                        <div class="d-flex flex-row justify-content-end mb-4 pt-1">
                            <div>
                                <p class="small p-2 me-3 mb-3 text-white rounded-3 bg-warning">Thank you for your believe in
                                    our
                                    supports</p>
                            </div>
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp"
                                 alt="avatar 1" style="width: 45px; height: 100%;">
                        </div>

                        <div class="d-flex justify-content-between">
                            <p class="small mb-1">Timona Siera</p>
                            <p class="small mb-1 text-muted">23 Jan 5:37 pm</p>
                        </div>
                        <div class="d-flex flex-row justify-content-start">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava5-bg.webp"
                                 alt="avatar 1" style="width: 45px; height: 100%;">
                            <div>
                                <p class="small p-2 ms-3 mb-3 rounded-3" style="background-color: #f5f6f7;">Lorem ipsum dolor
                                    sit amet
                                    consectetur adipisicing elit similique quae consequatur</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-muted d-flex justify-content-start align-items-center p-3">
                        <div class="input-group mb-0">
                            <input type="text" class="form-control" placeholder="Type message"
                                   aria-label="Recipient's username" aria-describedby="button-addon2" />
                            <button class="btn btn-warning" type="button" id="button-addon2" style="padding-top: .55rem;">
                                Button
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- =======================
        Footer START -->
        <footer class="pt-5" style="background-color: #DA8C47;">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3">
                        <a href="indexusuario.html">
                            <img class="h-40px" src="../../assets/images/index/logoo.jpg" alt="logo">
                        </a>
                        <p style="color: white;">"Demostrando que la Ciencia y la Tecnología son una rama más del Arte"</p>
                        <p class="mb-2" style="color: white;"><a href="#" style="color: white;"><i class="bi bi-telephone me-2"></i> +52 1 55 5555 5555</a> </p>
                        <p class="mb-0" style="color: white;"><a href="#" style="color: white;"><i class="bi bi-envelope me-2"></i>byron.inc.jdb@gmail.com</a></p>
                    </div>
                    <div class="col-lg-8 ms-auto">
                        <div class="row g-4">
                            <div class="col-6 col-md-4">
                                <h5 class="text-white mb-2 mb-md-4">Páginas</h5>
                                <ul class="nav flex-column text-primary-hover">
                                    <li class="nav-item"><a style="color: white;" href="indexusuario.html">Inicio</a></li>
                                    <li class="nav-item"><a style="color: white;" href="conocenos.html">Conócenos</a></li>
                                    <li class="nav-item"><a style="color: white;" href="soporteusuario.html">Soporte Técnico</a></li>
                                </ul>
                            </div>
                            <div class="col-6 col-md-5">
                                <h5 class="text-white mb-2 mb-md-4">Nuestros Proyectos</h5>
                                <ul class="nav flex-column text-primary-hover">
                                    <li style="color: white;">eServices</li>
                                    <li style="color: white;">Kidtales</li>
                                </ul>
                            </div>

                            <div class="col-6 col-md-3">
                                <h5 class="text-white mb-2 mb-md-4">Siguenos en</h5>
                                <ul class="list-inline mb-0 mt-3">
                                    <li class="list-inline-item"> <a class="btn btn-sm px-2 bg-facebook mb-0" href="https://www.facebook.com/profile.php?id=100092532574820" target="_blank"><i class="fab fa-fw fa-facebook-f"></i></a> </li>
                                </ul>
                            </div>
                        </div>
                    </div>


                </div>

                <hr style="color: white;">

                <div class="row">
                    <div class="container">
                        <div class="d-lg-flex justify-content-between align-items-center py-3 text-center text-lg-start">
                            <div style="color: white;"> Copyrights ©2023 Byron Inc</div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- =======================
        Footer END -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Bootstrap JS -->
        <script src="../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="../../assets/js/functions.js"></script>

    </body>
</html>
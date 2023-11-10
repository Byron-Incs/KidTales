<%-- 
    Document   : soporte
    Created on : 1 nov. 2023, 13:40:41
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
        <link rel="stylesheet" href="stylechat.css">
        <link rel="stylesheet"  href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    </head>

    <body>
        <!-- Header START -->
        <header class="navbar-light header-sticky">
            <!-- Logo Nav START -->
            <nav class="navbar navbar-expand-xl">
                <div class="container">
                    <!-- Logo START -->
                    <a class="navbar-brand" href="#">
                        <img class="light-mode-item navbar-brand-item" src="../../assets/images/index/logoc.jpg" alt="logo">
                    </a>
                    <!-- Logo END -->

                    <div class="navbar-collapse collapse" id="navbarCategoryCollapse">
                        <ul class="navbar-nav navbar-nav-scroll nav-pills-primary-soft text-center ms-auto p-2 p-xl-0">

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
        </header>
        <!-- Header END -->
        <!-- ChatStard -->
        <div class="container py-5">
            <div class="row">
                <div class="col-md-6 col-lg-5 col-xl-4 mb-4 mb-md-0">
                    <div class="card">
                        <div class="card-body">
                            <ul class="list-unstyled mb-0">
                                <li class="p-2 border-bottom">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp" alt="avatar"
                                                 class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                                            <div class="pt-1">
                                                <p class="fw-bold mb-0">John Doe</p>
                                                <p class="small text-muted">Hello, Are you there?</p>
                                            </div>
                                        </div>
                                        <div class="pt-1">
                                            <p class="small text-muted mb-1">Just now</p>
                                            <span class="badge bg-danger float-end">1</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="p-2 border-bottom">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-1.webp" alt="avatar"
                                                 class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                                            <div class="pt-1">
                                                <p class="fw-bold mb-0">Danny Smith</p>
                                                <p class="small text-muted">Lorem ipsum dolor sit.</p>
                                            </div>
                                        </div>
                                        <div class="pt-1">
                                            <p class="small text-muted mb-1">5 mins ago</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="p-2 border-bottom">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-2.webp" alt="avatar"
                                                 class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                                            <div class="pt-1">
                                                <p class="fw-bold mb-0">Alex Steward</p>
                                                <p class="small text-muted">Lorem ipsum dolor sit.</p>
                                            </div>
                                        </div>
                                        <div class="pt-1">
                                            <p class="small text-muted mb-1">Yesterday</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="p-2 border-bottom">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-3.webp" alt="avatar"
                                                 class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                                            <div class="pt-1">
                                                <p class="fw-bold mb-0">Ashley Olsen</p>
                                                <p class="small text-muted">Lorem ipsum dolor sit.</p>
                                            </div>
                                        </div>
                                        <div class="pt-1">
                                            <p class="small text-muted mb-1">Yesterday</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="p-2 border-bottom">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-4.webp" alt="avatar"
                                                 class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                                            <div class="pt-1">
                                                <p class="fw-bold mb-0">Kate Moss</p>
                                                <p class="small text-muted">Lorem ipsum dolor sit.</p>
                                            </div>
                                        </div>
                                        <div class="pt-1">
                                            <p class="small text-muted mb-1">Yesterday</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="p-2 border-bottom">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-5.webp" alt="avatar"
                                                 class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                                            <div class="pt-1">
                                                <p class="fw-bold mb-0">Lara Croft</p>
                                                <p class="small text-muted">Lorem ipsum dolor sit.</p>
                                            </div>
                                        </div>
                                        <div class="pt-1">
                                            <p class="small text-muted mb-1">Yesterday</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="p-2">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp" alt="avatar"
                                                 class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                                            <div class="pt-1">
                                                <p class="fw-bold mb-0">Brad Pitt</p>
                                                <p class="small text-muted">Lorem ipsum dolor sit.</p>
                                            </div>
                                        </div>
                                        <div class="pt-1">
                                            <p class="small text-muted mb-1">5 mins ago</p>
                                            <span class="text-muted float-end"><i class="fas fa-check" aria-hidden="true"></i></span>
                                        </div>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-7 col-xl-8">

                    <ul class="list-unstyled">
                        <li class="d-flex justify-content-between mb-4">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp" alt="avatar"
                                 class="rounded-circle d-flex align-self-start me-3 shadow-1-strong" width="60">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between p-3">
                                    <p class="fw-bold mb-0">Brad Pitt</p>
                                    <p class="text-muted small mb-0"><i class="far fa-clock"></i> 12 mins ago</p>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                        labore et dolore magna aliqua.
                                    </p>
                                </div>
                            </div>
                        </li>
                        <li class="d-flex justify-content-between mb-4">
                            <div class="card w-100">
                                <div class="card-header d-flex justify-content-between p-3">
                                    <p class="fw-bold mb-0">Lara Croft</p>
                                    <p class="text-muted small mb-0"><i class="far fa-clock"></i> 13 mins ago</p>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0">
                                        Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                                        laudantium.
                                    </p>
                                </div>
                            </div>
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-5.webp" alt="avatar"
                                 class="rounded-circle d-flex align-self-start ms-3 shadow-1-strong" width="60">
                        </li>
                        <li class="d-flex justify-content-between mb-4">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp" alt="avatar"
                                 class="rounded-circle d-flex align-self-start me-3 shadow-1-strong" width="60">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between p-3">
                                    <p class="fw-bold mb-0">Brad Pitt</p>
                                    <p class="text-muted small mb-0"><i class="far fa-clock"></i> 10 mins ago</p>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                        labore et dolore magna aliqua.
                                    </p>
                                </div>
                            </div>
                        </li>


                    </ul>

                </div>

            </div>

        </div>
        <!-- ChatEnd -->



        <!-- Download app START -->
        <section class="bg-light">
            <div class="container">
                <div class="row g-4">
                    <h6 class="text-primary">Politicas</h6>
                    <!-- Help -->
                    <div class="col-md-6 col-xxl-4">
                        <div class="bg-body d-flex rounded-3 h-100 p-4">
                            <h3><i class="fa-solid fa-hand-holding-heart"></i></h3>
                            <div class="ms-3">
                                <h5>24x7 Help</h5>
                                <p class="mb-0">If we fall short of your expectation in any way, let us know</p>
                            </div>
                        </div>
                    </div>

                    <!-- Trust -->
                    <div class="col-md-6 col-xxl-4">
                        <div class="bg-body d-flex rounded-3 h-100 p-4">
                            <h3><i class="fa-solid fa-hand-holding-usd"></i></h3>
                            <div class="ms-3">
                                <h5>Payment Trust</h5>
                                <p class="mb-0">All refunds come with no questions asked guarantee</p>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>
        <!-- =======================
        Download app END -->



        <!-- =======================
        Footer START -->
        <footer class="pt-5" style="background-color: #DA8C47;">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3">
                        <a href="soporte.html">
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
                                    <li class="nav-item"><a style="color: white;" href="soporte.html">Soporte Técnico</a></li>
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
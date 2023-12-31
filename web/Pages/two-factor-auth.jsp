<%-- 
    Document   : two-factor-auth
    Created on : 25 nov. 2023, 22:16:32
    Author     : Hoid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Verificar Token</title>

        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Verificar Token">

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/images/index/logoc.jpg">

        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <!-- Plugins CSS -->
        <link rel="stylesheet" type="text/css" href="../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <!-- Theme CSS -->
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">

    </head>

    <body>

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Content START -->
            <section class="vh-xxl-100">
                <div class="container h-100 d-flex px-0 px-sm-4">
                    <div class="row justify-content-center align-items-center m-auto">
                        <div class="col-12">
                            <div class="shadow bg-mode rounded-3 overflow-hidden">
                                <div class="row g-0 align-items-center">
                                    <!-- Vector Image -->
                                    <div class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <img src="../assets/images/contraseña/img1.svg" alt="">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-7">
                                            <!-- Logo -->
                                            <a href="index.html">
                                                <img class="mb-4 h-50px" src="../assets/images/index/logoc.jpg" alt="logo">
                                            </a>
                                            <!-- Title -->
                                            <h1 class="mb-2 h3">Validar Token</h1>
                                            <p class="mb-sm-0">Hemos enviado el token a : <b>example@gmail.com</b></p>

                                            <!-- Form START -->
                                            <form class="mt-sm-4">
                                                <!-- Input box -->
                                                <p class="mb-1">Ingresa el código que enviamos:</p>
                                                <div class="autotab d-flex justify-content-between gap-1 gap-sm-3 mb-2">
                                                    <input type="text" maxlength="1" class="form-control text-center p-3">
                                                    <input type="text" maxlength="1" class="form-control text-center p-3">
                                                    <input type="text" maxlength="1" class="form-control text-center p-3">
                                                    <input type="text" maxlength="1" class="form-control text-center p-3">
                                                </div>

                                                <!-- Button link -->
                                                <div class="d-sm-flex justify-content-between small mb-4">
                                                    <span>¿No recibiste el código?</span>
                                                    <a href="#" class="btn btn-sm btn-link p-0 text-decoration-underline mb-0">Presiona para reenviar</a>
                                                </div>

                                                <!-- Button -->
                                                <div><button type="submit" class="btn btn-primary w-100 mb-0">Verificar</button></div>

                                                <!-- Copyright -->
                                                <div class="text-primary-hover mt-3 text-center"> Copyrights © 2023 Byron Inc. </div>
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
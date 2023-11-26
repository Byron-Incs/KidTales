<%-- 
    Document   : SeleccionPerfil
    Created on : 25 nov. 2023, 22:44:01
    Author     : Hoid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Gestion Sub-Usuario</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Ajustes- Gestionar SubUsuario">

        <link rel="shortcut icon" href="../../../assets/images/index/logoc.jpg">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">

        <style>

            .logo-grande {
                width: 1000px;
                height: auto;
            }
            .logo-chico {
                width: 150px;
                height: auto;
            }
            body{
                margin: auto;
            }

        </style>

    </head>


    <body>

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Content START -->

            <section class="vh-xxl-100">
                 <div class="col-sm-12 text-center mx-auto">
                    <!-- Title -->
                    <img  class= "logo-grande" src="../../../assets/images/perfiles/gestion.svg" alt="logo">
                </div>
                <div class="container h-100 d-flex px-0 px-sm-4">
                    <div class="row justify-content-center align-items-center m-auto">
                        <div class="col-12">
                            <div class="bg-mode shadow rounded-3 overflow-hidden">
                                <div class="row g-0">
                                    <!-- Vector Image -->
                                    
                                    <div class="col-lg-4 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <a href="">
                                                <img src="../../../assets/images/perfiles/subusuario1.svg" alt="">
                                                <p align="center" style="color: black ; font-size: 21px" class="active"><strong>Sub-Usuario       </strong><i class="bi bi-trash3-fill"></i></p>
                                            </a>
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>
                                    <div class="col-lg-4 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <a href="">
                                                <img src="../../../assets/images/perfiles/subusuario2.svg" alt="">
                                                <p align="center" style="color: black ; font-size: 21px" class="active"><strong>Sub-Usuario       </strong><i class="bi bi-trash3-fill"></i></p>
                                            </a>
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>
                                    <div class="col-lg-4 order-2 order-lg-1 d-flex align-items-center">
                                        <div class="p-3 p-lg-5">
                                            <a href="">
                                                <img src="../../../assets/images/perfiles/agregar.svg"  class="logo-chico" alt="">
                                            </a>
                                        </div>
                                        <!-- Divider -->
                                    </div>
                                </div>
                                 <div class="mb-6 d-flex justify-content-center">
                                    <button type="submit" class="btn btn-primary w-10 mb-1" name="accion" id="regresar" value="Regresar">Regresar</button>
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
        <script src="../../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="../../../assets/js/functions.js"></script>

    </body>
</html>
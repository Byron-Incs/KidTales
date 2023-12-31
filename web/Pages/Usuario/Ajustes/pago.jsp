<%-- 
    Document   : tiempo
    Created on : 26 nov. 2023, 12:15:02
    Author     : hoid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Ajustes-Forma de Pago</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="Byron" content="Webestica.com">
        <meta name="description" content="Ajustes-Forma de Pago">

        <link rel="shortcut icon" href="../../../assets/images/index/logoc.jpg">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/font-awesome/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="../../../assets/vendor/bootstrap-icons/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">
        
        <style>
            .des {
                float: left;
                width: 50%; /* Puedes ajustar el ancho según tus necesidades */
            }
        </style>

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
                            <div class="bg-mode shadow rounded-3 overflow-hidden">
                                <div class="row g-0">
                                    <!-- Vector Image -->
                                    <div class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <img src="../../../assets/images/ajustes/pago2.svg" alt="">
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
                                            <h1 class="mb-2 h3">Método de pago</h1>
                                            <div>
                                                <p class="mb-0 des"><strong>Forma de pago actual :</strong></p>
                                                <p class="mb-0 des"><strong>"Metodo"</strong></p>
                                            </div>
                                            <p class="mb-0">Seleccione un método de pago</p>

                                            <!-- Form START -->
                                            <form class="mt-4 text-start">
                                                <!-- Email -->
                                                <div class="row">
                                                    <div class="col-4 mb-3">
                                                        <input type="image" src="../../../assets/images/ajustes/PayPal.svg" name="PayPal" id="PayPal" alt="PayPal">
                                                    </div>
                                                    <div class="col-4 mb-3">
                                                        <input type="image" src="../../../assets/images/ajustes/visa.svg" name="Visa" id="Visa" alt="Visa">
                                                    </div>
                                                    <div class="col-4 mb-3">
                                                        <input type="image" src="../../../assets/images/ajustes/mastercard.svg" name="MasterCard" id="MasterCard" alt="MasterCard">
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-4 mb-3">
                                                        <input type="image" src="../../../assets/images/ajustes/applepay.svg" name="ApplePay" id="ApplePay" alt="ApplePay">
                                                    </div>
                                                    <div class="col-4 mb-3">
                                                        <input type="image" src="../../../assets/images/ajustes/googlepay.svg" name="GooglePay" id="GooglePay" alt="GooglePay">
                                                    </div>
                                                    <div class="col-4 mb-3">
                                                        <input type="image" src="../../../assets/images/ajustes/americanexpress.svg" name="AmericanExpress" id="AmericanExpress" alt="AmericanExpress">
                                                    </div>
                                                </div>
                                                <!-- Nombre de usuario-->
                                                <div class="d-flex justify-content-center text-center">
                                                    <div class="mb-6">
                                                        <button type="button" class="btn btn-primary w-10 mb-1" name="accion" id="regresar" value="Regresar" onclick="redirigirAPagina()">Regresar</button>
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

<%-- 
    Document   : admin
    Created on : 26-dic-2013, 16:08:09
    Author     : patricio alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> ERP | Inciar Sesión </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Use the correct meta names below for your web application
                 Ref: http://davidbcalhoun.com/2010/viewport-metatag 
                 
        <meta name="HandheldFriendly" content="True">
        <meta name="MobileOptimized" content="320">-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">	
        <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.css">	

        <!-- SmartAdmin RTL Support is under construction
                <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

    </head>
    <body id="login" class="animated fadeInDown">
        <!-- possible classes: minified, no-right-panel, fixed-ribbon, fixed-header, fixed-width-->
        <header id="header">
            <!--<span id="logo"></span>-->

            <div id="logo-group">
                <span id="logo"> <img src="img/logo.png" alt="SmartAdmin"> </span>

                <!-- END AJAX-DROPDOWN -->
            </div>

            <span id="login-header-space"> <span class="hidden-mobile">Necesita una cuenta?</span> <a href="register.html" class="btn btn-danger">Crear cuenta</a> </span>

        </header>

        <div id="main" role="main">

            <!-- MAIN CONTENT -->
            <div id="content" class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
                        <h1 class="txt-color-red login-header-big">SmartAdmin</h1>
                        <div class="hero">
                            <div class="pull-left login-desc-box-l">
                                <h4 class="paragraph-header">Esta bien ser Inteligente. Experimente la simplicidad de ERP Bisuite, donde quiera que vaya!</h4>
                                <div class="login-app-icons">
                                    <a href="javascript:void(0);" class="btn btn-danger btn-sm">Panel administrativo</a>
                                    <a href="javascript:void(0);" class="btn btn-danger btn-sm">Saber más</a>
                                </div>
                            </div>
                            <img src="img/demo/iphoneview.png" class="pull-right display-image" alt="" style="width:210px">
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <h5 class="about-heading">Acerca de ERP - Está usted al día?</h5>
                                <p>
                                    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa.
                                </p>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <h5 class="about-heading">Not just your average template!</h5>
                                <p>
                                    Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi voluptatem accusantium!
                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
                        <div class="well no-padding">
                            <form action="LoginServlet" method="POST" id="login-form" class="smart-form client-form">
                                <header>
                                    Iniciar Sesión
                                </header>

                                <fieldset>
                                    <section>
                                        <label class="label">Username</label>
                                        <label class="input"> <i class="icon-append fa fa-user"></i>
                                            <input type="text" name="username">
                                            <b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Por favor ingrese username o email</b>
                                        </label>
                                    </section>

                                    <section>
                                        <label class="label">Contraseña</label>
                                        <label class="input"> <i class="icon-append fa fa-lock"></i>
                                            <input type="password" name="password">
                                            <b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Por favor ingrese su contraseña</b> </label>
                                        <div class="note">
                                            <a href="forgotpassword.html">Olvidó contraseña?</a>
                                        </div>
                                    </section>
                                    
                                    <c:if test="${msgErrorLogin != null}" >
                                        <p><font color="red" ><c:out value="${msgErrorLogin}" /></font></p>
                                        </c:if>
                                </fieldset>
                                
                                <footer>
                                    <button type="submit" name="btnLogin" class="btn btn-primary">
                                        Log in
                                    </button>
                                </footer>
                            </form>
                        </div>

                        <h5 class="text-center"> - O ingresa usando -</h5>
                        <ul class="list-inline text-center">
                            <li>
                                <a href="javascript:void(0);" class="btn btn-primary btn-circle"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="btn btn-info btn-circle"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="btn btn-warning btn-circle"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>               
            </div>

        </div>

        <!--================================================== -->	

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script src="js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script> if (!window.jQuery) {
                document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
            }</script>

        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script> if (!window.jQuery.ui) {
                document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }</script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
        <script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

        <!-- BOOTSTRAP JS -->		
        <script src="js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="js/plugin/fastclick/fastclick.js"></script>

        <!--[if IE 7]>
                
                <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
                
        <![endif]-->

        <!-- MAIN APP JS FILE -->
        <script src="js/app.js"></script>

        <script type="text/javascript">
            runAllForms();

            $(function() {
                // Validation
                $("#login-form").validate({
                    // Rules for form validation
                    rules: {
                        username: {
                            required: true,                            
                        },
                        password: {
                            required: true,
                            minlength: 6,
                            maxlength: 20
                        }
                    },
                    // Messages for form validation
                    messages: {
                        username: {
                            required: 'Por favor, ingrese username',                            
                        },
                        password: {
                            required: 'Por favor, ingrese password'
                        }
                    },
                    // Do not change code below
                    errorPlacement: function(error, element) {
                        error.insertAfter(element.parent());
                    }
                });
            });
        </script>

    </body>
</html>
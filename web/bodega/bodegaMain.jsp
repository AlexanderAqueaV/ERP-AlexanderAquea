<%-- 
    Document   : bodegaMain
    Created on : 22-04-2014, 12:18:07 PM
    Author     : alexander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->       
        <title> ERP | Bodegas </title>
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

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <!-- <link rel="stylesheet" type="text/css" media="screen" href="css/demo.css"> -->

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- export excel -->
        <script src="js/export-excel.js"></script>
    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header id="header">
            <div id="logo-group">

                <!-- PLACE YOUR LOGO HERE -->
                <c:import var="logo" url="/logo.jsp" />
                <c:out value="${logo}" escapeXml="false" />
                <!-- END LOGO PLACEHOLDER -->

                <!-- Note: The activity badge color changes when clicked and resets the number to 0
                Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
                <span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 21 </b> </span>

                <!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
                <div class="ajax-dropdown">

                    <!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
                    <div class="btn-group btn-group-justified" data-toggle="buttons">
                        <label class="btn btn-default">
                            <input type="radio" name="activity" id="ajax/notify/mail.html">
                            Msgs (14) </label>
                        <label class="btn btn-default">
                            <input type="radio" name="activity" id="ajax/notify/notifications.html">
                            notify (3) </label>
                        <label class="btn btn-default">
                            <input type="radio" name="activity" id="ajax/notify/tasks.html">
                            Tasks (4) </label>
                    </div>

                    <!-- notification content -->
                    <div class="ajax-notifications custom-scroll">

                        <div class="alert alert-transparent">
                            <h4>Click a button to show messages here</h4>
                            This blank page message helps protect your privacy, or you can show the first message here automatically.
                        </div>

                        <i class="fa fa-lock fa-4x fa-border"></i>

                    </div>
                    <!-- end notification content -->

                    <!-- footer: refresh area -->
                    <span> Last updated on: 12/12/2013 9:43AM
                        <button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..." class="btn btn-xs btn-default pull-right">
                            <i class="fa fa-refresh"></i>
                        </button> </span>
                    <!-- end footer -->

                </div>
                <!-- END AJAX-DROPDOWN -->
            </div>

            <!-- projects dropdown -->
            <c:import var="projectsDropdown" url="/projectsDropdown.jsp" />
            <c:out value="${projectsDropdown}" escapeXml="false" />
            <!-- end projects dropdown -->

            <!-- pulled right: nav area -->
            <c:import var="pulledRight" url="/pulledRight.jsp" />
            <c:out value="${pulledRight}" escapeXml="false" />
            <!-- end pulled right: nav area -->

        </header>
        <!-- END HEADER -->

        <!-- Left panel : Navigation area -->
        <!-- Note: This width of the aside area can be adjusted through LESS variables -->
        <c:import var="leftMenu" url="/leftMenu.jsp" />
        <c:out value="${leftMenu}" escapeXml="false" />
        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->
        <div id="main" role="main">

            <!-- RIBBON -->
            <div id="ribbon">

                <span class="ribbon-button-alignment"> <span id="refresh" class="btn btn-ribbon" data-title="refresh" rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! Esto reiniciará la configuración de widgets." data-html="true"><i class="fa fa-refresh"></i></span> </span>

                <!-- breadcrumb -->
                <ol class="breadcrumb">
                    <li>                        
                        <a href="bodegaMain"><i class="text-primary fa fa-table"></i> DataTable Bodegas </a>
                    </li>                                 
                </ol>
                <!-- end breadcrumb -->

                <!-- You can also add more buttons to the
                ribbon for further usability

                Example below:

                <span class="ribbon-button-alignment pull-right">
                <span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
                <span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
                <span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
                </span> -->

            </div>
            <!-- END RIBBON -->

            <!-- MAIN CONTENT -->
            <div id="content">

                <div class="row">
                    <!-- TITULO MANTENEDOR -->
                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                        <h2 class="page-title txt-color-blueDark">
                            <i class="fa fa-table fa-fw"></i> 
                            Mantenedor 
                            <span>
                                <i class="fa fa-user fa-fw "></i> 
                                Bodegas
                            </span>
                        </h2>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
                        <ul id="sparks" class="">
                            <li class="sparks-info">
                                <h5> IPC <span class="txt-color-purple"><i class="fa fa-arrow-circle-up" data-rel="bootstrap-tooltip" title="Increased"></i>&nbsp;0,80%</span></h5>
                                <div class="sparkline txt-color-purple hidden-mobile hidden-md hidden-sm">
                                    110,150,300,130,400,240,220,310,220,300, 270, 210
                                </div>
                            </li>
                            <li class="sparks-info">
                                <h5> U.F. <span class="txt-color-blue"><i class="fa fa-usd" data-rel="bootstrap-tooltip"></i> 23.672,60</span></h5>
                                <div class="sparkline txt-color-blue hidden-mobile hidden-md hidden-sm">
                                    1300, 1877, 2500, 2577, 2000, 2100, 3000, 2700, 3631, 2471, 2700, 3631, 2471
                                </div>
                            </li>                            
                            <li class="sparks-info">
                                <h5> Dolar Obs. <span class="txt-color-greenDark"><i class="fa fa-arrow-circle-up" data-rel="bootstrap-tooltip" title="Increased"></i> <i class="fa fa-usd"></i> 548,31</span></h5>
                                <div class="sparkline txt-color-greenDark hidden-mobile hidden-md hidden-sm">
                                    513,501,530,525,510,520,540,545,547,545, 550, 555
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">                       

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">                              
                            <div class="btn-toolbar">                                    
                                <object align="right">
                                    <div class="btn-group">
                                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" rel="tooltip" data-placement="top" data-original-title="Guardar como archivo">
                                            <i class="glyphicon glyphicon-export"></i> <font size="1"><strong>EXPORTAR</strong></font> <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="javascript:generateExcel('datatable_col_reorder');"> Excel</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="btn-group">                                                      
                                        <button class="btn btn-default btn-sm" name="btnAdd" type="button" onclick="location.href = 'BodegaGetAddServlet';" rel="tooltip" data-placement="top" data-original-title="Nueva Bodega">
                                            <i class="glyphicon glyphicon-plus-sign"></i>
                                            <font size="1"><strong>AGREGAR</strong></font>
                                        </button>
                                    </div>
                                </object>                                   
                            </div>
                            </br>
                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-2" data-widget-togglebutton="false" data-widget-custombutton="false" data-widget-collapsed="false" data-widget-deletebutton="false" data-widget-editbutton="false" data-widget-colorbutton="false">

                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Data Table </h2>
                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">
                                        <div class="widget-body-toolbar">

                                        </div>
                                        <form action="UserDeleteServlet" method="post" name="form">
                                            <table id="datatable_col_reorder" class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th class="center">                                                                                               
                                                            <button class="btn btn-default btn-sm" type="submit" name="btnDelCol" data-title="refresh" rel="tooltip" data-placement="right" data-original-title="<i class='text-warning fa fa-warning'></i> Eliminar </br> elementos </br> seleccionados" data-html="true">                                                                
                                                                &nbsp;&nbsp;
                                                                <i class="glyphicon glyphicon-trash"> </i>
                                                                &nbsp;&nbsp;
                                                            </button>
                                                        </th>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>Volumen</th>
                                                        <th width=280><div align="center">Acciones</div></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="center">
                                                            <c:if test="${list.idUser != idUserX}" >                                                                
                                                                <input type="checkbox" name="chk" value="<c:out value="${list.idUser}"/>"/>
                                                            </c:if>
                                                            <c:if test="${list.idUser == idUserX}" >
                                                                <input type="checkbox" name="chk" disabled/>
                                                            </c:if>
                                                        </td>
                                                        <td>1</td>
                                                        <td>BodegaPrincipal</td>
                                                        <td>10.5m3</td>
                                                        <td width=280>
                                                            <div align="right">
                                                                <a href="BodegaGetServlet?id=<c:out value="${list.idUser}"/>">
                                                                    <button class="btn btn-labeled btn-primary" name="btnUpOne" type="button">
                                                                        <span class="btn-label"><i class="glyphicon glyphicon-edit"></i></span>
                                                                        <strong><font size="1">VER / ACTUALIZAR</font></strong>
                                                                    </button>
                                                                </a>
                                                                <c:if test="${list.idUser != idUserX}" >
                                                                    <button class="btn btn-labeled btn-danger" name="btnDelRow" id="btnDelRow<c:out value="${list.idUser}"/>">                                                
                                                                        <span class="btn-label"><i class="glyphicon glyphicon-trash"></i></span>
                                                                        <strong><font size="1">ELIMINAR</font></strong>
                                                                    </button>
                                                                    <input type="hidden" name="idUserDelRow<c:out value="${list.idUser}"/>" id="idUserDelRow<c:out value="${list.idUser}"/>" value="<c:out value="${list.idUser}"/>">
                                                                </c:if>
                                                                <c:if test="${list.idUser == idUserX}" >
                                                                    <button class="btn btn-labeled btn-danger" name="btnDelRow" disabled>
                                                                        <span class="btn-label"><i class="glyphicon glyphicon-trash"></i></span>
                                                                        <strong><font size="1">ELIMINAR</font></strong>
                                                                    </button>
                                                                </c:if>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </form>    
                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- WIDGET END -->

                    </div>

                    <!-- end row -->

                </section>
                <!-- end widget grid -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
        <!-- END MAIN PANEL -->

        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->
        <c:import var="shortcut" url="/shortcut.jsp" />
        <c:out value="${shortcut}" escapeXml="false" />
        <!-- END SHORTCUT AREA -->

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                                            if (!window.jQuery) {
                                                document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
                                            }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
                                            if (!window.jQuery.ui) {
                                                document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                            }
        </script>

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

        <!-- Demo purpose only -->
        <!-- <script src="js/demo.js"></script> -->

        <!-- MAIN APP JS FILE -->
        <script src="js/app.js"></script>

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="js/plugin/datatables/jquery.dataTables-cust.min.js"></script>
        <script src="js/plugin/datatables/ColReorder.min.js"></script>
        <script src="js/plugin/datatables/FixedColumns.min.js"></script>
        <script src="js/plugin/datatables/ColVis.min.js"></script>
        <script src="js/plugin/datatables/ZeroClipboard.js"></script>
        <script src="js/plugin/datatables/media/js/TableTools.min.js"></script>
        <script src="js/plugin/datatables/DT_bootstrap.js"></script>

        <script type="text/javascript">

                                            // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                            $(document).ready(function() {

                                                pageSetUp();
                                                // confirmar eliminar
            <c:forEach var="list" items="${list}">
                                                $("#btnDelRow<c:out value="${list.idUser}"/>").click(function(e) {

                                                    $.SmartMessageBox({
                                                        title: "<i class='fa fa-exclamation-triangle txt-color-orangeDark'></i> Desea eliminar el registro?",
                                                        content: "Si presiona 'Sí', se eliminará el registro permanentemente.",
                                                        buttons: '[No][Sí]'
                                                    }, function(ButtonPressed) {
                                                        if (ButtonPressed === "Sí") {

                                                            var url = 'UserDeleteServlet?btnDelRow&id=' + $('#idUserDelRow<c:out value="${list.idUser}"/>').attr("value");
                                                            $(location).attr('href', url);
                                                        }

                                                    });
                                                    e.preventDefault();
                                                });
            </c:forEach>

                    // Mensajes emergentes
            <c:if test="${msgDel != null}">
                    $("#eliminado").ready(function(e) {
                        $.smallBox({
                            title: "Eliminación realizada!",
                            content: "<i class='glyphicon glyphicon-warning-sign'></i> <i><c:out value="${msgDel}"/>...</i>",
                            color: "#c09853",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 5000
                        });
                        e.preventDefault();
                    });
            </c:if>

            <c:if test="${msgErrorConstraint !=null}">
                    $("#msgErrorConstraint").ready(function(e) {
                        $.smallBox({
                            title: "Error de restricción!",
                            content: "<i class='glyphicon glyphicon-minus-sign'></i> <i><c:out value="${msgErrorConstraint}"/></i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 5000
                        });
                        e.preventDefault();
                    });
            </c:if>
            <c:if test="${msgListErrorConstraint != null}">
                    $("#msgListErrorConstraint").ready(function(e) {
                        $.smallBox({
                            title: "Error de restricción!",
                            content: "<i class='glyphicon glyphicon-minus-sign'></i> <i><ul class='list-style'><c:forEach var="msgListErrorConstraint" items="${msgListErrorConstraint}"><li><c:out value="${msgListErrorConstraint.msg}" /></li></c:forEach></ul></i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 5000
                        });
                        e.preventDefault();
                    });
            </c:if>

                    /*
                     * BASIC
                     */
                    $('#dt_basic').dataTable({
                        "sPaginationType": "bootstrap_full"
                    });
                    /* END BASIC */

                    /* Add the events etc before DataTables hides a column */
                    $("#datatable_fixed_column thead input").keyup(function() {
                        oTable.fnFilter(this.value, oTable.oApi._fnVisibleToColumnIndex(oTable.fnSettings(), $("thead input").index(this)));
                    });
                    $("#datatable_fixed_column thead input").each(function(i) {
                        this.initVal = this.value;
                    });
                    $("#datatable_fixed_column thead input").focus(function() {
                        if (this.className == "search_init") {
                            this.className = "";
                            this.value = "";
                        }
                    });
                    $("#datatable_fixed_column thead input").blur(function(i) {
                        if (this.value == "") {
                            this.className = "search_init";
                            this.value = this.initVal;
                        }
                    });
                    var oTable = $('#datatable_fixed_column').dataTable({
                        "sDom": "<'dt-top-row'><'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
                        //"sDom" : "t<'row dt-wrapper'<'col-sm-6'i><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'>>",
                        "oLanguage": {
                            "sSearch": "Search all columns:"
                        },
                        "bSortCellsTop": true
                    });
                    /*
                     * COL ORDER
                     */
                    $('#datatable_col_reorder').dataTable({
                        "sPaginationType": "bootstrap_full",
                        "sDom": "R<'dt-top-row'Clf>r<'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
                        "fnInitComplete": function(oSettings, json) {
                            $('.ColVis_Button').addClass('btn btn-default btn-sm').html('Columnas <i class="icon-arrow-down"></i>');
                        }
                    });
                    /* END COL ORDER */

                    /* TABLE TOOLS */
                    $('#datatable_tabletools').dataTable({
                        "sDom": "<'dt-top-row'Tlf>r<'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
                        "oTableTools": {
                            "aButtons": ["copy", "print", {
                                    "sExtends": "collection",
                                    "sButtonText": 'Save <span class="caret" />',
                                    "aButtons": ["csv", "xls", "pdf"]
                                }],
                            "sSwfPath": "js/plugin/datatables/media/swf/copy_csv_xls_pdf.swf"
                        },
                        "fnInitComplete": function(oSettings, json) {
                            $(this).closest('#dt_table_tools_wrapper').find('.DTTT.btn-group').addClass('table_tools_group').children('a.btn').each(function() {
                                $(this).addClass('btn-sm btn-default');
                            });
                        }
                    });
                    /* END TABLE TOOLS */
                });
        </script>

        <!-- Your GOOGLE ANALYTICS CODE Below -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);
            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>

    </body>

</html>

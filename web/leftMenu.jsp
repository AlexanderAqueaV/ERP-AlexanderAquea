<%-- 
    Document   : leftMenu
    Created on : 09-04-2014, 02:47:51 PM
    Author     : patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="left-panel">

    <!-- User info -->
    <div class="login-info">
        <span> <!-- User image size is adjusted inside CSS, it should stay as it --> 

            <a href="javascript:void(0);" id="show-shortcut">
                <img src="img/avatars/sunny.png" alt="me" class="online" /> 
                <span>
                    <c:out value="${usernameX}"/>                    
                </span>
                <i class="fa fa-angle-down"></i>
            </a> 

        </span>
    </div>
    <!-- end user info -->

    <!-- NAVIGATION : This navigation is also responsive

    To make this navigation dynamic please make sure to link the node
    (the reference to the nav > ul) after page load. Or the navigation
    will not initialize.
    -->
    <nav>
        <!-- NOTE: Notice the gaps after each icon usage <i></i>..
        Please note that these links work a bit different than
        traditional hre="" links. See documentation for details.
        -->

        <ul>
            <li>
                <a href="index.html" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Dashboard (*)</span></a>
            </li>

            <li>
                <a href="inbox.html"><i class="fa fa-lg fa-fw fa-inbox"></i> <span class="menu-item-parent">Inbox (*)</span><span class="badge pull-right inbox-badge">14</span></a>
            </li>

            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">Estadísticas (*)</span></a>
                <ul>
                    <li><a href="flot.html">Flot Chart</a></li>
                    <li><a href="morris.html">Morris Charts</a></li>
                    <li><a href="inline-charts.html">Inline Charts</a></li>
                </ul>
            </li>

            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">Indicador Económico</span></a>                
            </li>

            <li <c:if test="${userActive != null}">class="active"</c:if>>
                <a href="UserMainServlet"><i class="fa fa-lg fa-fw fa-user"></i> <span class="menu-item-parent">Usuarios</span></a>
            </li>

            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-group"></i> <span class="menu-item-parent">Recursos Humanos</span></a>
                <ul>
                    <li><a href="#">Personal</a>
                        <ul>
                            <li><a href="#">Honorarios</a></li>
                            <li><a href="#">Contratados</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Registro de Asistencia</a></li>
                    <li><a href="#">Liquidación de Sueldos</a></li>
                </ul>
            </li>

            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-list-ol"></i> <span class="menu-item-parent">Inventario</span></a>
                <ul>
                    <li><a href="#">Asignaciones</a></li>
                    <li <c:if test="${userActive != null}">class="active"</c:if>>
                    <a href="BodegaMainServlet"><i class="fa fa-lg fa-fw fa-building"></i> <span class="menu-item-parent">Bodegas</span></a>
                    </li>
                    <li><a href="#">Productos en Bodega</a></li>
                    <li><a href="#">Ordenes de Bodega</a>
                        <ul>                            
                            <li><a href="#">Ingresos</a></li>                            
                            <li><a href="#">Egresos</a></li>
                        </ul>
                    </li>                    
                </ul>
            </li>
            
            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-shopping-cart"></i> <span class="menu-item-parent">Tienda</span></a>
                <ul>
                    <li><a href="#">Asignaciones</a></li>
                    <li><a href="#">Secciones</a></li>
                    <li><a href="#">Productos en sección</a></li>
                    <li><a href="#">Ordenes de sección</a>
                </ul>
            </li>
            
            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-gears"></i> <span class="menu-item-parent">Producción</span></a>
                <ul>
                    <li><a href="#">Asignaciones</a></li>
                    <li><a href="#">Proceso General</a></li>
                    <li><a href="#">Plantas</a></li>
                    <li><a href="#">Procesos en Plantas</a></li>
                    <li><a href="#">Productos en planta</a></li>
                    <li><a href="#">Ordenes de producción</a>
                </ul>
            </li>

            <li><a href="ParameterGetServlet"><i class="fa fa-lg fa-fw fa-gear"></i> <span class="menu-item-parent">Configuración (*)</span></a></li>
        </ul>
    </nav>
    <span class="minifyme"> <i class="fa fa-arrow-circle-left hit"></i> </span>

</aside>

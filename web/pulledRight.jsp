<%-- 
    Document   : mainMenu
    Created on : 16-ene-2014, 16:49:05
    Author     : patricio alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pull-right">

    <!-- collapse menu button -->
    <div id="hide-menu" class="btn-header pull-right">
        <span> <a href="javascript:void(0);" title="Minimizar Menú"><i class="fa fa-reorder"></i></a> </span>
    </div>
    <!-- end collapse menu -->

    <!-- logout button -->
    <div id="logout" class="btn-header transparent pull-right">
        <span> <a href="LogoutServlet" title="Cerrar Sesión"><i class="fa fa-sign-out"></i></a> </span>
    </div>
    <!-- end logout button -->

    <!-- search mobile button (this is hidden till mobile view port) -->
    <div id="search-mobile" class="btn-header transparent pull-right">
        <span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
    </div>
    <!-- end search mobile button -->

    <!-- input: search field -->
    <form action="#search.html" class="header-search pull-right">
        <input type="text" placeholder="Encuentre reportes y más" id="search-fld">
        <button type="submit">
            <i class="fa fa-search"></i>
        </button>
        <a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
    </form>
    <!-- end input: search field -->

    <!-- multiple lang dropdown : find all flags in the image folder -->
    <ul class="header-dropdown-list hidden-xs">
        <li>
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="img/flags/es.png"> <span> ES </span> <i class="fa fa-angle-down"></i> </a>            
        </li>
    </ul>
    <!-- end multiple lang -->

</div>
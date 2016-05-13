<%-- 
    Document   : home
    Created on : May 6, 2016, 5:40:18 PM
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.api.valueObjects.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home | Cliente Fidelidad</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="assets/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="assets/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        
  </head>
  <%
    HttpSession sesion = request.getSession(false);
    VOUser vo_user = (VOUser) sesion.getAttribute("vo_user");
  %>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a onclick="getWelcome()" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini">CF</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg">ClienteFidelidad</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button" id="tglBut">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
             <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="images/common/user.png" class="user-image" alt="User Image">
                  <span class="hidden-xs"><%= vo_user.getFirst_name()%> <%=vo_user.getLast_name()%></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="images/common/user.png" class="img-circle" alt="User Image">
                    <p>
                      <%= vo_user.getFirst_name()%> <%=vo_user.getLast_name()%> - Vendedor
                      <small><%=vo_user.getEmail()%></small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Mi Cuenta</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Productos</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Clientes</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">Cerrar Sesión</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>

      <!-- =============================================== -->

      <!-- Left side column. contains the sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="images/common/user.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><%= vo_user.getFirst_name()%> <%=vo_user.getLast_name()%></p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MENU PRINCIPAL</li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i> <span>Mi Tienda</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a onclick="getMisPublicaciones()"><i class="fa fa-circle-o"></i> Mis Publicaciones </a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-users" aria-hidden="true"></i>
                <span>Clientes</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Compradores Frecuentes</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Preguntas</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a onclick="getAdminPts()">
                <i class="fa fa-gift" aria-hidden="true"></i>
                <span>Administrador de Puntos</span> <small class="label pull-right bg-yellow">New</small>
              </a>
            </li>
            <li>
              <a onclick="getForum()">
                <i class="fa fa-rss-square" aria-hidden="true"></i> <span>Foro CF</span> <small class="label pull-right bg-red">Hot</small>
              </a>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- =============================================== -->

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Cliente Fidelidad
            <small>Todo comenzo con un click</small>
          </h1>
        </section>
        <section class="content" id="publiView"></section>
        <section class="content" id="dashboard"></section>
        <section class="content" id="forum"></section>
        <!-- Main content -->
        <section class="content" id="welcomeView">
          <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3><%=vo_user.getPoints()%></h3>
                  <p>Reputación en Puntos</p>
                </div>
                <div class="icon">
                  <i class="fa fa-shield" aria-hidden="true"></i>
                </div>
                  <a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3><%=vo_user.getTotal()%></h3>
                  <p>Ventas Totales</p>
                </div>
                <div class="icon">
                  <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                </div>
                <a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3><%=vo_user.getCompleted()%></h3>
                  <p>Ventas Completadas</p>
                </div>
                <div class="icon">
                  <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                </div>
                <a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3><%=vo_user.getCanceled()%></h3>
                  <p>Ventas Canceladas</p>
                </div>
                <div class="icon">
                  <i class="fa fa-times-circle-o" aria-hidden="true"></i>
                </div>
                <a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
          
          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Mis Datos</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-8">
                        <div class="col-md-4">Nombre: </div>
                        <div class="col-md-4"><%=vo_user.getFirst_name()%> <%=vo_user.getLast_name()%></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="col-md-4">Nickname: </div>
                        <div class="col-md-4"><%=vo_user.getNickname()%></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="col-md-4">Email: </div>
                        <div class="col-md-4"><%=vo_user.getEmail()%></div>
                    </div>
                </div>    
            </div><!-- /.box-body -->
          </div><!-- /.box -->
          
        </section><!-- /.content -->
      
      
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.3.0
        </div>
        <strong>Copyright &copy; 2015-2016 Ing. Andy Romero</strong> All rights reserved.
      </footer>

      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="assets/js/jquery/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="assets/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src="assets/plugins/fastclick/fastclick.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="assets/js/app.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    $(document).ready(function(){
        $("#publiView").hide();
        $("#dashboard").hide();
        $("#forum").hide();
        
    });
        
    
    
    function getMisPublicaciones(){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (xhttp.readyState == 4 && xhttp.status == 200) {
           document.getElementById("publiView").innerHTML = xhttp.responseText;
           $(function(){
               $("#welcomeView").hide();
               $("#publiView").show();
               $("#dashboard").hide();
               $("#forum").hide();
           });
          }
        };
        xhttp.open("GET", "items.jsp", true);
        xhttp.send();
    }
    
    function getAdminPts(){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (xhttp.readyState == 4 && xhttp.status == 200) {
           document.getElementById("dashboard").innerHTML = xhttp.responseText;
           $(function(){
               $("#welcomeView").hide();
               $("#publiView").hide();
               $("#dashboard").show();
               $("#forum").hide();
           });
          }
        };
        xhttp.open("GET", "dashboard.jsp", true);
        xhttp.send();
    }
    
    function getForum(){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (xhttp.readyState == 4 && xhttp.status == 200) {
           document.getElementById("forum").innerHTML = xhttp.responseText;
           $(function(){
               $("#welcomeView").hide();
               $("#publiView").hide();
               $("#dashboard").hide();
               $("#forum").show();
           });
          }
        };
        xhttp.open("GET", "forum.jsp", true);
        xhttp.send();
    }
    
    function getWelcome(){
        $(function(){
               $("#welcomeView").show();
               $("#publiView").hide();
               $("#dashboard").hide();
               $("#forum").hide();
           });
    }
    
    </script>
  </body>
</html>


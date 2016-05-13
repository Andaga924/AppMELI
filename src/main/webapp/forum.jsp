<%-- 
    Document   : forum
    Created on : May 12, 2016, 12:26:39 PM
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.api.valueObjects.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <%
    HttpSession sesion = request.getSession(false);
    ArrayList<VOQuestion> questions = (ArrayList<VOQuestion>) sesion.getAttribute("questions");
  %>
    <body class="hold-transition skin-blue sidebar-mini">
        <section class="content">
        <div class="row">
            <div class="col-md-9">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#vendedor" data-toggle="tab">Vendedor</a></li>
                  <li><a href="#producto" data-toggle="tab">Producto</a></li>
                  <li><a href="#preguntas" data-toggle="tab">Preguntas de MELI</a></li>
                </ul>
                <div class="tab-content">
                  <div class="active tab-pane" id="vendedor">
                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="images/common/user.png" alt="user image">
                        <span class='username'>
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>
                        </span>
                        <span class='description'>Compartido - 7:30 PM hoy</span>
                        <span class='description'>Categoria - Recomendación</span>
                      </div><!-- /.user-block -->
                      <p>
                        Lo recomiendo completamente me gusto la atención.
                      </p>
                      <ul class="list-inline">
                        <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Compartir</a></li>
                        <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Me gusta</a></li>
                        <li class="pull-right"><a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (5)</a></li>
                      </ul>

                      <input class="form-control input-sm" type="text" placeholder="Type a comment">
                    </div><!-- /.post -->

                    <!-- Post -->
                    <div class="post">
                      <div class='user-block'>
                        <img class='img-circle img-bordered-sm' src='images/common/user.png' alt='user image'>
                        <span class='username'>
                          <a href="#">Sarah Ross</a>
                          <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>
                        </span>
                        <span class='description'>Compartido - Hace 3 días</span>
                        <span class='description'>Categoria - Pregunta sobre el servicio</span>
                      </div><!-- /.user-block -->
                      <p>
                          ¿Tarda mucho el vendedor en enviar el producto?
                      </p>
                      <ul class="list-inline">
                        <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Compartir</a></li>
                        <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Me gusta</a></li>
                        <li class="pull-right"><a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (0)</a></li>
                      </ul>

                      <input class="form-control input-sm" type="text" placeholder="Type a comment">
                    </div><!-- /.post -->
                  </div><!-- /.tab-pane -->
                   
                  <div class="tab-pane" id="producto">
                    <!-- Post -->
                    <div class="post">
                      <div class='user-block'>
                        <img class='img-circle img-bordered-sm' src='images/common/user.png' alt='user image'>
                        <span class='username'>
                          <a href="#">Adam Jones</a>
                          <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>
                        </span>
                        <span class='description'>Posteo 5 fotos - Hace 5 días</span>
                        <span class='description'>Categoria - Review</span>
                      </div><!-- /.user-block -->
                      <p> Llego todo a tiempo, buena calidad y servicio <p>
                      <p>Presentacion: 8/10</p>
                      <p>Calidad: 9/10</p>
                      <p>Servicio: 10/10</p>
                      <div class='row margin-bottom'>
                        <div class='col-sm-6'>
                          <img class='img-responsive' src='images/forum/photo1.png' alt='Photo'>
                        </div><!-- /.col -->
                        <div class='col-sm-6'>
                          <div class='row'>
                            <div class='col-sm-6'>
                              <img class='img-responsive' src='images/forum/photo2.png' alt='Photo'>
                              <br>
                              <img class='img-responsive' src='images/forum/photo3.jpg' alt='Photo'>
                            </div><!-- /.col -->
                            <div class='col-sm-6'>
                              <img class='img-responsive' src='images/forum/photo4.jpg' alt='Photo'>
                              <br>
                              <img class='img-responsive' src='images/forum/photo1.png' alt='Photo'>
                            </div><!-- /.col -->
                          </div><!-- /.row -->
                        </div><!-- /.col -->
                      </div><!-- /.row -->

                      <ul class="list-inline">
                        <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Compartir</a></li>
                        <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Me gusta</a></li>
                        <li class="pull-right"><a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (0)</a></li>
                      </ul>

                      <input class="form-control input-sm" type="text" placeholder="Type a comment">
                    </div><!-- /.post -->
                    
                  </div><!-- /.tab-pane -->
                  <div class=" tab-pane" id="preguntas">
                    <%for(int qC = 0; qC <= questions.size()-1 ; qC++){
                        VOQuestion quest = questions.get(qC);
                        
                    %>
                      <!-- Post -->
                      <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="images/common/user.png" alt="user image">
                        <span class='username'>
                          <a href="#">User</a>
                          <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>
                        </span>
                        <span class='description'>Realizada - <%=quest.getDate_created()%>
                        Publicación: <a onclick="getMisPublicaciones()"><%=quest.getItem_id()%></a> <br/>
                        </span>
                      </div><!-- /.user-block -->
                      <p>
                          
                        <%=quest.getText()%>
                      </p>
                      <input class="form-control input-sm" type="text" placeholder="Contestar">
                    </div><!-- /.post -->
                     <% } %> 
                     
                  </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
              </div><!-- /.nav-tabs-custom -->
            </div><!-- /.col -->
        </div>
        </section>
        
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
    
    
    </body>
</html>

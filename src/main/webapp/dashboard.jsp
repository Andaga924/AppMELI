<%-- 
    Document   : dashboard
    Created on : May 12, 2016, 1:38:36 PM
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.api.valueObjects.*"%>

<!DOCTYPE html>
  <%
    HttpSession sesion = request.getSession(false);
    VOUser vo_user = (VOUser) sesion.getAttribute("vo_user");
    ArrayList<VOItem> items = (ArrayList<VOItem>) sesion.getAttribute("items");
  %>
          <div class="row">
            <div class="col-md-3">

              <!-- Profile Image -->
              <div class="box box-primary">
                <div class="box-body box-profile">
                  <img class="profile-user-img img-responsive img-circle" src="images/common/user.png" alt="User profile picture">
                  <h3 class="profile-username text-center"><%=vo_user.getFirst_name()%> <%=vo_user.getLast_name()%></h3>
                  <p class="text-muted text-center"><%=vo_user.getPower_seller_status()%></p>

                  <ul class="list-group list-group-unbordered">
                    <li class="list-group-item">
                      <b>Puntos Obtenidos</b> <a class="pull-right"><%=vo_user.getPoints()%></a>
                    </li>
                    <li class="list-group-item">
                      <b>Puntos Otorgados</b> <a class="pull-right">543</a>
                    </li>
                    <li class="list-group-item">
                      <b>Recompensas Disponibles</b> <a class="pull-right">3/5</a>
                    </li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              <!-- About Me Box -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Sobre Mi</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <strong><i class="fa fa-book margin-r-5"></i>  Miembro desde </strong>
                  <p class="text-muted">
                    <%=vo_user.getRegistration_date()%>
                  </p>

                  <hr>

                  <strong><i class="fa fa-map-marker margin-r-5"></i> Ubicación</strong>
                  <p class="text-muted"><%=vo_user.getCountry_id()%></p>

                  <hr>

                  <strong><i class="fa fa-pencil margin-r-5"></i> Recompensas Disponibles</strong>
                  <p>
                    <span class="label label-danger">Cupones de Descuentos</span>
                    <span class="label label-success">Cupones de Productos</span>
                    <span class="label label-info">Puntos por pesos</span>
                    <span class="label label-warning">Tarjeta CF</span>
                    <span class="label label-primary">Tarjeta CF Gold</span>
                  </p>

                  <hr>

                  <strong><i class="fa fa-file-text-o margin-r-5"></i> Notas</strong>
                  <p>Si tienes disponible la activación de tarjetas "Tarjeta CF"  y "Tarjeta CF Gold" toma en cuenta 
                      que las recompensas de esta son permanentes con la condición de 1 compra minima al mes.</p>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
            <div class="col-md-9">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#actividad" data-toggle="tab">Actividad en el Foro</a></li>
                  <li><a href="#compra" data-toggle="tab">Compra de productos</a></li>
                  <li><a href="#recompensas" data-toggle="tab">Recompensas Disponibles</a></li>
                </ul>
                <div class="tab-content">
                  <div class="active tab-pane" id="actividad">
                      <div class="row" style="padding-bottom: 10px;">
                          <div class="col-md-10">
                              <div class="col-md-6">Publicar "Preguntas de Vendedor"</div>
                              <div class="col-md-4"><input type="number" min="1" max="999" style="width: 50px;" value="0" /> </div>
                          </div>
                      </div>
                      <div class="row" style="padding-bottom: 10px;">
                          <div class="col-md-10">
                              <div class="col-md-6">Responder "Preguntas de Vendedor"</div>
                              <div class="col-md-4"><input type="number" min="1" max="999" style="width: 50px;" value="0"/> </div>
                          </div>
                      </div>
                      <div class="row" style="padding-bottom: 10px;">
                          <div class="col-md-10">
                              <div class="col-md-6">Publicar "Preguntas de Publicaciones"</div>
                              <div class="col-md-4"><input type="number" min="1" max="999" style="width: 50px;" value="0"/> </div>
                          </div>
                       </div>
                      <div class="row" style="padding-bottom: 10px;">
                          <div class="col-md-10">
                              <div class="col-md-6">Responder "Preguntas de Publicaciones"</div>
                              <div class="col-md-4"><input type="number" min="1" max="999" style="width: 50px;" value="0"/> </div>
                          </div>
                       </div>
                      <div class="row" style="padding-bottom: 10px;">
                          <div class="col-md-10">
                              <div class="col-md-6">Subir un Review</div>
                              <div class="col-md-4"><input type="number" min="1" max="999" style="width: 50px;" value="0"/> </div>
                          </div>
                      </div>
                      <button class="btn btn-block btn-success">Guardar</button>
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="compra">
                      <div class="row">
                          <div class="col-md-2">
                                Elige la compra:
                          </div>
                          <div class="col-md-6">
                          <select id="combobox" class="form-control" style="width: 350px;">
                                  <option value="">Seleccciona uno...</option>
                                  <%for(int i = 0; i <= items.size()-1 ; i++){
                                      VOItem vo_item = items.get(i);
                                  %>
                                  <option value="<%=vo_item.getId()%>"><%=vo_item.getTitle()%> - <%=vo_item.getId()%></option>
                                  <%}%>
                               </select>
                          </div>
                               <div class="col-md-2"><input type="number" min="1" max="999" style="width: 50px;float:left;" value="0"/></div>     
                      </div>
                     
                     <div class="row">
                         <table class="table table-bordered">
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Id</th>
                      <th>Titulo de publicación</th>
                      <th style="width: 40px">Puntos</th>
                    </tr>
                    <tr>
                      <td>1.</td>
                      <td>ML00</td>
                      <td>
                        item prueba
                      </td>
                      <td><span class="badge bg-red">55</span></td>
                    </tr>
                  </table>
                     </div>
                  </div><!-- /.tab-pane -->
                  <div class=" tab-pane" id="recompensas">
                    hola recompensas
                  </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
              </div><!-- /.nav-tabs-custom -->
            </div><!-- /.col -->
          </div><!-- /.row -->

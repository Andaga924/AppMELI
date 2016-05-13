<%-- 
    Document   : items
    Created on : May 11, 2016, 10:33:46 AM
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*"%>
<%@page import="com.api.valueObjects.*"%>

    <%
    HttpSession sesion = request.getSession(false);
    ArrayList<VOItem> items = (ArrayList<VOItem>) sesion.getAttribute("items");
    %>
        <div class="morePost row featuredPostContainer style2 globalPaddingTop ">
        <!-- this div is for demo || Please remove it when use this page -->

        <h3 class="section-title style2 text-center"><span>MIS PUBLICACIONES</span></h3>
        <div class="container">
            <div class="row xsResponse categoryProduct">
                <%for(int i = 0; i <= items.size()-1; i++){
                    VOItem vo_item = items.get(i);
                    
                %>
                <!--/.item-->
                <div class="item itemauto  col-lg-3 col-md-3 col-sm-6 col-xs-6">
                    <div class="product">
                        <a class="add-fav tooltipHere" data-toggle="tooltip" data-original-title="Agregar a favoritos"
                           data-placement="left">
                            <i class="glyphicon glyphicon-heart"></i>
                        </a>
                        <div class="imageHover">
                            <a href="#">
                                <%
                                String urlPic =  "";
                                ArrayList<VOPicture> pictures = vo_item.getPictures();
                                if(pictures.size()> 0){
                                    VOPicture vo_picture = pictures.get(0);
                                    urlPic = vo_picture.getUrl();
                                }
                                String url = "images/product/artsinfoto.gif";
                                if(!"".equals(urlPic)){
                                 url = urlPic;
                                }%>
                                <img src="<%=url%>" alt="img" class="img-responsive primaryImage">
                                <img src="<%=url%>" alt="img" class="img-responsive secondaryImage">
                            </a>
                        </div>
                        <div class="descriptionStyle">
                            <h4><a href="#"> <%=vo_item.getTitle()%> </a></h4>

                            <div class="grid-description">
                                <%
                                String subtitle = vo_item.getSubtitle();
                                if(subtitle == null || "null".equals(subtitle)){
                                    subtitle = "Sin subtitulo disponible"; 
                                }
                                %>
                                <p><%=subtitle%> </p>
                            </div>
                                <span class="size">Cant: <%=vo_item.getAvailable_quantity()%> </span>
                                <span class="size">Id: <%=vo_item.getId()%> </span></div>
                        <div class="price"><span>$<%=vo_item.getPrice()%></span></div>
                    </div>
                </div>
                <!--/.item-->
                <%}%>
            </div>
        </div>

    </div>
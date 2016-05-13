<%-- 
    Document   : home
    Created on : May 5, 2016, 10:12:21 AM
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.api.valueObjects.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
         <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" />
         <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
         <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,900"/>
         <script src="assets/js/jquery/jquery.min.js"></script>
         <link rel="stylesheet" href="assets/plugins/vegas/vegas.min.css" />
         <script src="assets/plugins/vegas/vegas.min.js"></script>
        
         <script type="text/javascript">
		$( document ).ready(function() {
			$("body").vegas({
		slides: [
			{ src: "images/home/1.jpg",color:"#FFFFFF" },
			{ src: "images/home/2.jpg",color:"#8d00fd" },
                        { src: "images/home/3.jpg",color:"#FFFFFF" }
		],
                transition:['fade', 'zoomOut', 'swirlLeft'],
                overlay: 'assets/plugins/vegas/overlays/06.png'
	});
		});
        </script>
        
        <style type="text/css">
            .a-ven{
                color: #8EB8DD;;
            }
            
            .a-ven:hover{
                color: #ff0 !important;
            }
            .a-com{
                color: #B3EC96;
            }
            
            .a-com:hover{
                color: #ff0 !important;
            }
            .a-home {
                display: inline-block;
                padding: 0px 10px;
                border-radius: 15px;
                border-bottom: 2px solid #EFAF41;
                text-decoration: none !important;
                font-family: "Raleway";
                font-size: 3em;
                letter-spacing: -5px;
                margin-bottom: 0.2em;
                text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.6), 1px 1px 1px rgba(0, 0, 0, 0.6), 0px 0px 10px #000;
            }
            .form-box {
                width: 600px;
                margin: 160px auto 0 auto;
              }
              .form-box .header {
                -webkit-border-top-left-radius: 4px;
                -webkit-border-top-right-radius: 4px;
                -webkit-border-bottom-right-radius: 0;
                -webkit-border-bottom-left-radius: 0;
                -moz-border-radius-topleft: 4px;
                -moz-border-radius-topright: 4px;
                -moz-border-radius-bottomright: 0;
                -moz-border-radius-bottomleft: 0;
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
                background: #EFAF41;
                box-shadow: inset 0px -3px 0px rgba(0, 0, 0, 0.2);
                padding: 20px 10px;
                text-align: center;
                font-size: 26px;
                font-weight: 300;
                color: #fff;
              }
              .form-box .body,
              .form-box .footer {
                padding: 10px 20px;
                background: #fff;
                color: #444;
                box-shadow: inset 0px -3px 0px rgba(0, 0, 0, 0.2);
              }
              .form-box .body > .form-group,
              .form-box .footer > .form-group {
                margin-top: 20px;
              }
              .form-box .body > .form-group > input,
              .form-box .footer > .form-group > input {
                border: #fff;
              }
              .form-box .body > .btn,
              .form-box .footer > .btn {
                margin-bottom: 10px;
              }
              .form-box .footer {
                -webkit-border-top-left-radius: 0;
                -webkit-border-top-right-radius: 0;
                -webkit-border-bottom-right-radius: 4px;
                -webkit-border-bottom-left-radius: 4px;
                -moz-border-radius-topleft: 0;
                -moz-border-radius-topright: 0;
                -moz-border-radius-bottomright: 4px;
                -moz-border-radius-bottomleft: 4px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
                border-bottom-right-radius: 4px;
                border-bottom-left-radius: 4px;
              }
              @media (max-width: 767px) {
                .form-box {
                  width: 90%;
                }
              }
         </style>
    </head>
    <%
    HttpSession sesion = request.getSession(false);
    VOUser vo_user = (VOUser) sesion.getAttribute("vo_user");
    %>
    <body>
            <div class="form-box">
                <div class="header">
                  Bienvenido <%=vo_user.getNickname()%>
                </div>
                <div class="body" style="height: 150px;opacity: 0.5;">
                    
                </div>
                <div class="row" style="position: relative;
                margin-top: -100px;margin-right: 0px;
                margin-left: 0px;" >
                        <div class="col-md-6">
                            <a href="ApiControlPerfil?rol=vendedor" class="a-home a-ven" style="float:left;">VENDEDOR</a>
                        </div>
                        <div class="col-md-6">
                            <a href="#" class="a-home a-com" style="float:right;">COMPRADOR</a>
                        </div>
               </div>
            </div>  
    </body>
</html>

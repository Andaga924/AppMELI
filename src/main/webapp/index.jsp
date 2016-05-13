<%-- 
    Document   : index
    Created on : May 6, 2016, 12:30:40 PM
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- Fav and touch icons -->
    <title>Cliente Fidelidad</title>    
    <!-- Bootstrap core CSS -->
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
			{ src: "images/intro/1.jpg",color:"#FFFFFF" },
			{ src: "images/intro/2.jpg",color:"#8d00fd" },
			{ src: "images/intro/3.jpg",color:"#fd8d00" },
			{ src: "images/intro/4.jpg",color:"#00fd8d" },
			{ src: "images/intro/5.jpg",color:"#fd0070" },
			{ src: "images/intro/6.jpg",color:"#18b000" },
			{ src: "images/intro/7.jpg",color:"#CBC2B9" },
			{ src: "images/intro/8.jpg",color:"#e3ff00" }
		],
                transition:['fade', 'zoomOut', 'swirlLeft'],
                overlay: 'assets/plugins/vegas/overlays/04.png'
	});
		});
    </script>
    <style type="text/css">
    body {
        color: #FFF;
        font: 1em/1.8 tahoma,arial,sans-serif;
    }
    html, body, div, span, applet, object, iframe,
    h1, h2, h3, h4, h5, h6, p, 
    blockquote, pre, a, abbr, acronym, address, 
    big, cite, code, del, dfn, em, img, ins, kbd, q, s, 
    samp, small, strike, strong, sub, sup, tt, var, b, u, i, 
    center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, 
    table, caption, tbody, tfoot, thead, tr, th, td, article, aside, 
    canvas, details, embed, figure, figcaption, footer, header, hgroup, 
    menu, nav, output, ruby, section, summary, time, mark, audio, video {
        margin: 0px;
        padding: 0px;
        border: 0px none;
        font: inherit;
        vertical-align: baseline;
    }
    ul {
    list-style: outside none none;
    }
    article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
        display: block;
    }
    h1, h2, h3, h4, h5, h6 {
        font-weight: 900;
        text-transform: uppercase;
        font-family: "Raleway";
    }
    .homepage-info {
        position: absolute;
        overflow: hidden;
        font-family: "Raleway";
        text-transform: uppercase;
        line-height: 2.2em;
        text-align: right;
        width: 100%;
        font-size: .60em;
        right: 1em;
        bottom: 1em;
    }    
   
   .homepage-info h1 {
        position: relative;
        text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.3), 1px 1px 1px rgba(0, 0, 0, 0.3), 0px 0px 10px #000;
        letter-spacing: -1px;
        padding-right: 4.7em;
        font-size: 1.9em;
        margin: 0.75em 0px;
        pointer-events: none;
    }    
    .homepage-info h1 span {
        display: block;
    }
    .homepage-info h1 .line1 {
        font-size: 3em;
        letter-spacing: -5px;
        margin-bottom: 0.2em;
    }
    .homepage-info h1 .line2 {
        position: absolute;
        bottom: 0.3em;
        right: 0px;
        text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.6), 1px 1px 1px rgba(0, 0, 0, 0.6), 0px 0px 10px #000;
        opacity: 0.6;
        font-size: 7.7em;
    }
    .homepage-info h1 .line3 {
        opacity: 0.6;
    }
    .homepage-menu {
        position: relative;
        font-weight: 900;
        margin: 0.75em 0px;
        font-size: 2em;
    }
    .homepage-menu .pushable {
        transition: all 0.5s cubic-bezier(0, 0.5, 0, 1) 0s;
        transform: translateX(0px) translateZ(0px);
    }
    .banner {
        display: inline-block;
        background: #000 none repeat scroll 0% 0%;
        padding: 0px 10px;
        font-size: 1em;
        font-family: "Raleway";
    }
    
       
    
   
    </style>
</head>
<body>

<div class="vegas-wrapper" style="overflow: visible;padding: 0px;">
    <div class="homepage-info">
        <h1><span class="line1">Cliente Fidelidad</span>
            <span class="line2">CF</span>
            <span class="line3">Tu lealtad es recompensada</span>
            <span class="line4">MercadoLibre API</span>
        </h1>
        <% if (session.getAttribute("accessToken") == null){%>
        <nav class="homepage-menu">
            <ul>
                <li class="pushable">
                    <form name="form1" action="ApiControlOAuth?detalle=login" method="post">
                        <span>
                            <input class="banner" type="submit" style="color: rgb(239, 175, 65);" value="Entrar"></input>
                        </span>
                    </form>
                    
                </li>
            </ul>
        </nav>
        <%}else{
            String redirectURL = "perfil.jsp";
            response.sendRedirect(redirectURL);
        }%>
</div>

    
</body>
</html>

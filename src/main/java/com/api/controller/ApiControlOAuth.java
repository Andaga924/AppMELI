/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.valueObjects.VOUser;
import com.google.gson.Gson;
import com.mercadolibre.sdk.AuthorizationFailure;
import com.mercadolibre.sdk.Meli;
import com.mercadolibre.sdk.MeliException;
import com.ning.http.client.FluentStringsMap;
import com.ning.http.client.Response;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Andy
 */
public class ApiControlOAuth extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, AuthorizationFailure, MeliException {
        
        final Long clientId = 851366489877757L;
        final String clientSecret = "pkDKQDjaBNJ5XRZXzO2unVmXfh3aHLMz";
        
        //Esta Linea es para autenticar mi APLICACIÓN
        Meli m = new Meli(clientId, clientSecret);
            
        String detalle = request.getParameter("detalle");
        String code = request.getParameter("code");
        HttpSession sesion = request.getSession(true);
        
        if("login".equals(detalle)){
            //Se pide el code
            //String authUrl = m.getAuthUrl("http://localhost:8080/AppMELI/ApiControlOAuth");
            String authUrl = m.getAuthUrl("https://187.188.56.204:8443/AppMELI/ApiControlOAuth");
            response.sendRedirect(authUrl);
            
        }else if(code != null){
            //Recibo el codigo generado por MELI 
            //String redirectUri = "http://localhost:8080/AppMELI/ApiControlOAuth";
            String redirectUri = "https://187.188.56.204:8443/AppMELI/ApiControlOAuth";
            m.authorize(code, redirectUri);
            
            String accessToken = m.getAccessToken();         
            
            FluentStringsMap params = new FluentStringsMap();
            params.add("access_token", m.getAccessToken());
            Response resp = m.get("/users/me", params);
            
            System.out.println(resp.getResponseBody());
            Gson gson = new Gson(); 
            VOUser vo_user = new VOUser();
            vo_user = gson.fromJson(resp.getResponseBody(), VOUser.class);
            
            //Agregamos objetos al user existente
            JSONObject json = new JSONObject(resp.getResponseBody());
            
            JSONObject jsonSeller =  (JSONObject) json.get("seller_reputation");
            JSONObject jsonTransaction =  (JSONObject) jsonSeller.get("transactions");
            
            vo_user.setLevel_id(jsonSeller.get("level_id")+"");
            vo_user.setPower_seller_status(jsonSeller.get("power_seller_status")+"");
            vo_user.setPeriod(jsonTransaction.get("period")+"");
            vo_user.setTotal(jsonTransaction.get("total")+"");
            vo_user.setCompleted(jsonTransaction.get("completed")+"");
            vo_user.setCanceled(jsonTransaction.get("canceled")+"");
            
            sesion.setAttribute("accessToken", accessToken);
            sesion.setAttribute("params", params);
            sesion.setAttribute("vo_user", vo_user);
                        
            response.sendRedirect("index.jsp");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (AuthorizationFailure ex) {
            Logger.getLogger(ApiControlOAuth.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MeliException ex) {
            Logger.getLogger(ApiControlOAuth.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (AuthorizationFailure ex) {
            Logger.getLogger(ApiControlOAuth.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MeliException ex) {
            Logger.getLogger(ApiControlOAuth.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

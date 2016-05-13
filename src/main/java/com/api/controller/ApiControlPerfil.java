/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.valueObjects.VOItem;
import com.api.valueObjects.VOPicture;
import com.api.valueObjects.VOQuestion;
import com.api.valueObjects.VOUser;
import com.google.gson.Gson;
import com.mercadolibre.sdk.Meli;
import com.mercadolibre.sdk.MeliException;
import com.ning.http.client.FluentStringsMap;
import com.ning.http.client.Response;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
public class ApiControlPerfil extends HttpServlet {

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
            throws ServletException, IOException, MeliException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            final Long clientId = 851366489877757L;
            final String clientSecret = "pkDKQDjaBNJ5XRZXzO2unVmXfh3aHLMz";
        
            //Esta Linea es para autenticar mi APLICACIÓN
            Meli m = new Meli(clientId, clientSecret);
        
            String detalle = request.getParameter("rol");
            HttpSession sesion = request.getSession(true);
            String accessToken = (String) sesion.getAttribute("accessToken");
            FluentStringsMap params = (FluentStringsMap) sesion.getAttribute("params");
            VOUser vo_user = (VOUser) sesion.getAttribute("vo_user");
            Gson gson = new Gson();
            
            if("vendedor".equals(detalle)){
                 String data = "/users/" + vo_user.getId() + "/items/search";
                 Response resp = m.get(data, params);
                 
                 String stringtoParse = resp.getResponseBody();
                 System.out.println(stringtoParse);
                 ArrayList<VOItem> items = new ArrayList<VOItem>();
                 
                 JSONObject json = new JSONObject(stringtoParse);
                 for(int i = 0; i <= json.getJSONArray("results").length()-1; i++){
                        String item_id = json.getJSONArray("results").getString(i);
                        data = "/items/" + item_id ;
                        resp = m.get(data,params);
                        VOItem vo_item = new VOItem();
                        vo_item = gson.fromJson(resp.getResponseBody(), VOItem.class);
                        items.add(vo_item);
                 }
                 
                 //Obtenemos las preguntas de MELI
                 data = "/my/received_questions/search";
                 resp = m.get(data,params);
                 stringtoParse = resp.getResponseBody();
                 json = new JSONObject(stringtoParse);
                 JSONArray jsonQuest = json.getJSONArray("questions");
                 ArrayList<VOQuestion> questions = new ArrayList<VOQuestion>();
                 
                 for(int q = 0 ; q <= jsonQuest.length()-1 ; q++){
                    VOQuestion vo_question = new VOQuestion();
                     System.out.println(jsonQuest.get(q));
                     String strQuest = jsonQuest.get(q).toString();
                     vo_question = gson.fromJson(strQuest, VOQuestion.class);
                    questions.add(vo_question);
                 }
                 
                 sesion.setAttribute("questions", questions);
                 sesion.setAttribute("items", items);
                 response.sendRedirect("home.jsp");
            }
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
        } catch (MeliException ex) {
            Logger.getLogger(ApiControlPerfil.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (MeliException ex) {
            Logger.getLogger(ApiControlPerfil.class.getName()).log(Level.SEVERE, null, ex);
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

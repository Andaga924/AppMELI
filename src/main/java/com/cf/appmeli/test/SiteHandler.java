/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cf.appmeli.test;

import com.google.gson.Gson;
import com.google.gson.internal.StringMap;
import com.mercadolibre.sdk.Meli;
import com.mercadolibre.sdk.MeliException;
import com.ning.http.client.Response;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Andy
 */
public class SiteHandler {
   //Nombre de los campos que vamos a obtener informacion
    private static final String ID_KEY = "id";
    private static final String NAME_KEY = "name";
    //Creamos una unica instancia de Meli.
    private final Meli meli;

    private static final SiteHandler instance = new SiteHandler();

    private SiteHandler() {
        //Aca creamos el objecto Meli con la información de su aplicación.
        meli = new Meli(851366489877757L, "pkDKQDjaBNJ5XRZXzO2unVmXfh3aHLMz");
    }

    public static SiteHandler getInstance() {
        return instance;
    }

    public List<Site> getAllMeliSite()  {
        //Todos los sites.
        final List<Site> newSites = new ArrayList<Site>();
        try {
            //Aqui realizamos la consulta de todos los sites.
            final Response response = meli.get("/sites/");
            //Objeto gson que sirve para "parsear" los resultados.
            final Gson gson = new Gson();
            //Convertimos desde JSON a Java creando una lista de StringMap
            final List<StringMap<String>> sites = gson.fromJson(response.getResponseBody(), List.class);
            //Convertimos los objectos StringMap a Site.
            for (final StringMap<String> entries : sites) {
                newSites.add(new Site(entries.get(ID_KEY), entries.get(NAME_KEY)));
            }
        } catch (MeliException ex) {
            //Logger error en la respuesta
            System.out.println("Error " + ex.getMessage());
        } catch (IOException e) {
            //Logger error en la transformacion usando de gson.
            System.out.println("Error " + e.getMessage());
        }
        return newSites;
    }
}

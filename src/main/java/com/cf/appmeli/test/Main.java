/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cf.appmeli.test;

import java.util.List;

/**
 *
 * @author Andy
 */
public class Main {

    public static void main(String[] args) throws Exception {
        final List<Site> sites = SiteHandler.getInstance().getAllMeliSite();

        for (final Site site: sites) {
            System.out.println(site);
        }
    }    
}

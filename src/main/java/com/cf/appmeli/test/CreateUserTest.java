/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cf.appmeli.test;
import static com.api.common.HttpHelper.post;
import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author Andy
 */
public class CreateUserTest {
    
   public static void main(String args[]){
       
       String siteJson = "{\"site_id\":\"MLA\"}";
       String accessToken  = "access_token=APP_USR-851366489877757-050713-8da4107bd9e0716b0f49482afedbe4a1__L_C__-213349078";
       
       String json = post("https://api.mercadolibre.com/users/test_user",siteJson,"application/json");
              json = post("https://api.mercadolibre.com/users/test_user",accessToken,"application/x-www-form-urlencoded");
       
       System.out.println(json);
   } 
    
}

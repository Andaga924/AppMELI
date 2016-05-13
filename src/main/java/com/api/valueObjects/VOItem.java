/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.api.valueObjects;

import java.util.ArrayList;

/**
 *
 * @author Andy
 */
public class VOItem {
  private String id = "";
  private String site_id = "";
  private String title = "";
  private String subtitle = "";
  private String seller_id  = "";
  private String category_id  = "";
  private String official_store_id  = "";
  private String price  = "";
  private String base_price  = "";
  private String original_price  = "";
  private String currency_id  = "";
  private String initial_quantity  = "";
  private String available_quantity  = "";
  private String sold_quantity  = "";
  private String thumbnail  = "";
  private ArrayList<VOPicture> pictures = null;
  
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSite_id() {
        return site_id;
    }

    public void setSite_id(String site_id) {
        this.site_id = site_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        if(subtitle == null || "null".equals(subtitle)){
            this.subtitle = "Sin subtitulo disponible";
        }else{
            this.subtitle = subtitle;
        }
    }

    public String getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getOfficial_store_id() {
        return official_store_id;
    }

    public void setOfficial_store_id(String official_store_id) {
        this.official_store_id = official_store_id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBase_price() {
        return base_price;
    }

    public void setBase_price(String base_price) {
        this.base_price = base_price;
    }

    public String getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(String original_price) {
        this.original_price = original_price;
    }

    public String getCurrency_id() {
        return currency_id;
    }

    public void setCurrency_id(String currency_id) {
        this.currency_id = currency_id;
    }

    public String getInitial_quantity() {
        return initial_quantity;
    }

    public void setInitial_quantity(String initial_quantity) {
        this.initial_quantity = initial_quantity;
    }

    public String getAvailable_quantity() {
        return available_quantity;
    }

    public void setAvailable_quantity(String available_quantity) {
        this.available_quantity = available_quantity;
    }

    public String getSold_quantity() {
        return sold_quantity;
    }

    public void setSold_quantity(String sold_quantity) {
        this.sold_quantity = sold_quantity;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public ArrayList<VOPicture> getPictures() {
        return pictures;
    }

    public void setPictures(ArrayList<VOPicture> pictures) {
        this.pictures = pictures;
    }

       
        
}

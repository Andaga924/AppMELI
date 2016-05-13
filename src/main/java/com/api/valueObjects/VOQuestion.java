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
public class VOQuestion {
    private String  date_created = "";
    private String  item_id = "";
    private String  seller_id = "";
    private String  status = "";
    private String  text = "";
    private String  id = "";
    private String  deleted_from_listing = "";
    private String  hold = "";
    private String  answer  = "";

    //private ArrayList<String>  from = null;
    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

    public String getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDeleted_from_listing() {
        return deleted_from_listing;
    }

    public void setDeleted_from_listing(String deleted_from_listing) {
        this.deleted_from_listing = deleted_from_listing;
    }

    public String getHold() {
        return hold;
    }

    public void setHold(String hold) {
        this.hold = hold;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}

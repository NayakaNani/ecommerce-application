package com.nendrasys.model;

import java.util.List;
//import javax.annotation.processing.Generated;
//
//import com.fasterxml.jackson.annotation.JsonInclude;
//import com.fasterxml.jackson.annotation.JsonProperty;
//import com.fasterxml.jackson.annotation.JsonPropertyOrder;
//
//@JsonInclude(JsonInclude.Include.NON_NULL)
//@JsonPropertyOrder({
//        "status",
//        "message",
//        "products"
//})
//@Generated("jsonschema2pojo")
public class ProductList {

//    @JsonProperty("status")
    private String status;
//    @JsonProperty("message")
    private String message;
//    @JsonProperty("products")
    private List<Product> products;

//    @JsonProperty("status")
    public String getStatus() {
        return status;
    }

//    @JsonProperty("status")
    public void setStatus(String status) {
        this.status = status;
    }

//    @JsonProperty("message")
    public String getMessage() {
        return message;
    }

//    @JsonProperty("message")
    public void setMessage(String message) {
        this.message = message;
    }

//    @JsonProperty("products")
    public List<Product> getProducts() {
        return products;
    }

//    @JsonProperty("products")
    public void setProducts(List<Product> products) {
        this.products = products;
    }

}
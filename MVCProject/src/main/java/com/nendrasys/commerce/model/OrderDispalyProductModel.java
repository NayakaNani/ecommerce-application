package com.nendrasys.commerce.model;

import java.sql.Timestamp;
import java.util.List;

public class OrderDispalyProductModel {
    
    private Timestamp orderDate;
    
    private Integer orderId;
    
    private List<Product> productList;

    public OrderDispalyProductModel() {
    }

    public OrderDispalyProductModel(Timestamp orderDate, Integer orderId, List<Product> productList) {
        this.orderDate = orderDate;
        this.orderId = orderId;
        this.productList = productList;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
}

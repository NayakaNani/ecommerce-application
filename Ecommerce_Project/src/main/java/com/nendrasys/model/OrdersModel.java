package com.nendrasys.model;

import java.sql.Timestamp;

public class OrdersModel {

    private Integer id;

    private Timestamp orderDate;

    private Integer productId;

    private Integer orderId;

    private Integer userId;

    public OrdersModel() {
    }

    public OrdersModel(Integer id, Timestamp orderDate, Integer productId, Integer orderId, Integer userId) {
        this.id = id;
        this.orderDate = orderDate;
        this.productId = productId;
        this.orderId = orderId;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}

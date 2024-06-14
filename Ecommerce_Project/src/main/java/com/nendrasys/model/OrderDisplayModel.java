package com.nendrasys.model;

import java.sql.Timestamp;
import java.util.List;

public class OrderDisplayModel {

    private Timestamp orderDate;

    private int orderID;

    private List<OrdersModel> ordersModels;

    public OrderDisplayModel() {
    }

    public OrderDisplayModel(Timestamp orderDate, int orderID, List<OrdersModel> ordersModels) {
        this.orderDate = orderDate;
        this.orderID = orderID;
        this.ordersModels = ordersModels;
    }

    public OrderDisplayModel(Timestamp orderDate, int orderID) {
        this.orderDate = orderDate;
        this.orderID = orderID;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public List<OrdersModel> getOrdersModels() {
        return ordersModels;
    }

    public void setOrdersModels(List<OrdersModel> ordersModels) {
        this.ordersModels = ordersModels;
    }
}

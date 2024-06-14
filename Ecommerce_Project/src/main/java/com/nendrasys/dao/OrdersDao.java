package com.nendrasys.dao;

import com.nendrasys.model.OrdersModel;

public interface OrdersDao {

    /*
    * this method is for place an order from the user
    * @param Array(Object) of type OrdersModel
    * @return boolean - indicates whether the order is added or not*/
    public Boolean addOrder(OrdersModel ordersModel);

    /*
    * this method is for place multiple orders from the user
    * @param OrdersModel[](object)
    * @return boolean - indicates whether the orders are added or not*/
    public Boolean addOrders(OrdersModel[] ordersModel);

    /*
    * this method is for retrieving all orders placed by the user
    * @param int - id of the user
    * @return Array(Object) of type OrdersModel*/
    public OrdersModel[] getOrders(int id);

    /*
    * this method is for deleting all orders placed by the user
    * @param int - id of the user
    * @return boolean - indicates whether the orders are deleted or not*/
    public Boolean deleteOrders(int id);
}

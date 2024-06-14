package com.nendrasys.service;

import com.nendrasys.dao.OrdersDao;
import com.nendrasys.model.OrdersModel;

public class OrdersServiceImpl implements OrdersService {

    private OrdersDao ordersDao;

    @Override
    public Boolean addOrder(OrdersModel ordersModel) {
        return ordersDao.addOrder(ordersModel);
    }

    @Override
    public Boolean addOrders(OrdersModel[] ordersModel) {
        return ordersDao.addOrders(ordersModel);
    }

    @Override
    public OrdersModel[] getOrders(int id) {
        return ordersDao.getOrders(id);
    }

    @Override
    public Boolean deleteOrders(int id) {
        return ordersDao.deleteOrders(id);
    }

    public void setOrdersDao(OrdersDao ordersDao) {
        this.ordersDao = ordersDao;
    }
}

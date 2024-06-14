package com.nendrasys.dao;

import com.nendrasys.model.OrdersModel;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdersImpl implements OrdersDao{

    private JdbcTemplate jdbcTemplate;

    @Override
    public Boolean addOrder(OrdersModel ordersModel) {
        int result = jdbcTemplate.update("INSERT INTO orders (orderDate,productId,orderId,userId) VALUES (?,?,?,?)",ordersModel.getOrderDate(),ordersModel.getProductId(),ordersModel.getOrderId(),ordersModel.getUserId());
        return result == 1;
    }

    @Override
    public Boolean addOrders(OrdersModel[] ordersModel) {
        int result = 0;
        for(OrdersModel order : ordersModel){
            result = jdbcTemplate.update("INSERT INTO orders (orderDate,productId,orderId,userId) VALUES (?,?,?,?)",order.getOrderDate(),order.getProductId(),order.getOrderId(),order.getUserId());
        }
        return result == 1;
    }

    @Override
    public OrdersModel[] getOrders(int id) {
        List<OrdersModel> list = new ArrayList<OrdersModel>();
        list = jdbcTemplate.query("SELECT * FROM orders WHERE userId ="+id,new RowMapper<OrdersModel>(){
            OrdersModel ordersModel;
            @Override
            public OrdersModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                ordersModel = new OrdersModel();
                ordersModel.setId(rs.getInt("id"));
                ordersModel.setOrderDate(rs.getTimestamp("orderDate"));
                ordersModel.setProductId(rs.getInt("productId"));
                ordersModel.setOrderId(rs.getInt("orderId"));
                ordersModel.setUserId(rs.getInt("userId"));
                return ordersModel;
            }
        });
        OrdersModel[] orders = list.toArray(new OrdersModel[list.size()]);
        return orders;
    }

    @Override
    public Boolean deleteOrders(int id) {
        int result = jdbcTemplate.update("DELETE FROM orders WHERE userId=?",id);
        return result == 1;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}

package com.nendrasys.dao;

import com.nendrasys.model.CartProduct;
import com.nendrasys.userapplication.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartProductImpl implements CartProductDao{

    private JdbcTemplate jdbcTemplate;

    @Override
    public Boolean addCartProduct(int productId,int userId) {
        int result = jdbcTemplate.update("INSERT INTO cart (productid,userid) VALUES (?,?)", productId, userId);
        return result == 1;
    }

    @Override
    public List<CartProduct> getCartProducts(int userId) {
        List<CartProduct> cartProducts = null;
        cartProducts = jdbcTemplate.query("SELECT * FROM cart WHERE userId = "+userId,new RowMapper<CartProduct>(){
            CartProduct cartProduct;
            @Override
            public CartProduct mapRow(ResultSet rs, int rowNum) throws SQLException {
                cartProduct = new CartProduct();
                cartProduct.setId(rs.getInt("id"));
                cartProduct.setProductId(rs.getInt("productId"));
                cartProduct.setUserId(rs.getInt("userId"));
                return cartProduct;
            }
        });
        return cartProducts;
    }

    @Override
    public Boolean deleteCartProduct(int productId, int userId) {
        int result = jdbcTemplate.update("DELETE FROM cart where productId = ? AND userId = ?",productId,userId);
        return result==1;
    }

    @Override
    public Boolean deleteUserCartProducts(int userId) {
        int result = jdbcTemplate.update("DELETE FROM cart where userId = ?",userId);
        return result==1;
    }


    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}

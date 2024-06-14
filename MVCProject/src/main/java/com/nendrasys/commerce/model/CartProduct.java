package com.nendrasys.commerce.model;

public class CartProduct {

    private Integer id;

    private Integer productId;

    private Integer userId;

    public CartProduct() {
    }

    public CartProduct(Integer id, Integer productId, Integer userId) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}

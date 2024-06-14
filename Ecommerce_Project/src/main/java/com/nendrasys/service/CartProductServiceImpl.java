package com.nendrasys.service;

import com.nendrasys.dao.CartProductDao;
import com.nendrasys.model.CartProduct;

import java.util.List;

public class CartProductServiceImpl implements CartProductService {

    private CartProductDao cartProductDao;

    @Override
    public Boolean addCartProduct(int productId,int userId) {
        return cartProductDao.addCartProduct(productId,userId);
    }

    @Override
    public List<CartProduct> getCartProducts(int userId) {
        return cartProductDao.getCartProducts(userId);
    }

    @Override
    public Boolean deleteCartProduct(int productId, int userId) {
        return cartProductDao.deleteCartProduct(productId, userId);
    }

    @Override
    public Boolean deleteUserCartProducts(int userId) {
        return cartProductDao.deleteUserCartProducts(userId);
    }

    public void setCartProductDao(CartProductDao cartProductDao) {
        this.cartProductDao = cartProductDao;
    }
}

package com.nendrasys.service;

import com.nendrasys.model.CartProduct;

import java.util.List;

public interface CartProductService {

    /*
    * this method is for adding a product to a user's cart
    * @param int - id of the product
    * @param int - id of the user
    * @return boolean - indicated whether the product is added to the user's cart*/
    public Boolean addCartProduct(int productId,int userId);

    /*
    * this method is for retrieving products from a user's cart
    * @param int - id of the user
    * @return List(Object) of type CartProduct*/
    public List<CartProduct> getCartProducts(int userId);

    /*
    * this method is for deleting a product form a user's cart
    * @param int - id of the product
    * @param int - id of the user
    * @return boolean - indicates whether the product is deleted or not*/
    public Boolean deleteCartProduct(int productId,int userId);

    /*
    * this method is for deleting all products in the user's cart
    * @param int - id of the user
    * @return boolean - indicated whether all products deleted or not*/
    public Boolean deleteUserCartProducts(int userId);
}

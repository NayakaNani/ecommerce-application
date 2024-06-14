package com.nendrasys.customApi;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nendrasys.model.CartProduct;
import com.nendrasys.model.Product;
import com.nendrasys.model.ProductList;
import com.nendrasys.model.RemodeldProduct;
import com.nendrasys.service.CartProductService;
import com.nendrasys.userapplication.model.User;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@RestController
public class CustomController {

    private RestTemplate restTemplate;

    private CartProductService cartProductService;

    @RequestMapping(value = "/getProducts",produces = "application/json")
    public List<RemodeldProduct> getProducts(){
        ResponseEntity<ProductList> productList = restTemplate.getForEntity("https://fakestoreapi.in/api/products?limit=1000", ProductList.class);
        List<Product> products = productList.getBody().getProducts();
        List<RemodeldProduct> list = new ArrayList<>();
        for (Product product : products) {
            list.add(new RemodeldProduct(product.getId(),titleFixer(product.getTitle()),product.getImage(),product.getPrice(),product.getDescription(),camilCase(product.getBrand()),product.getModel(),product.getCategory()));
        }
        return list;
    }

    @RequestMapping(value = "/getProductById",produces = "application/json")
    public RemodeldProduct getProductById(@RequestParam("id") int id) throws JsonProcessingException {
        RemodeldProduct remodeldProduct = null;
        for(RemodeldProduct rp : getProducts()){
            if(rp.getId() == id){
                remodeldProduct = rp;
            }
        }
        return remodeldProduct;
    }

    @RequestMapping(value = "/getCartProducts",method = RequestMethod.GET,produces = "application/json")
    public List<CartProduct> getCartProducts(@RequestParam("id") int id) throws JsonProcessingException {
        List<CartProduct> cartProducts = cartProductService.getCartProducts(id);
        return cartProducts;
    }

    @RequestMapping(value = "/addCartProduct",method = RequestMethod.GET)
    public Boolean addCartProduct(@RequestParam int productId,@RequestParam int userId){
        Boolean result = cartProductService.addCartProduct(productId,userId);
        return result;
    }

    @RequestMapping(value = "/deleteCartProduct",method = RequestMethod.GET)
    public Boolean deleteCartProduct(@RequestParam int productId,@RequestParam int userId){
        Boolean result = cartProductService.deleteCartProduct(productId,userId);
        return result;
    }

    @RequestMapping(value = "/deleteUserCartProducts",method = RequestMethod.GET)
    public Boolean deleteUserCartProducts(@RequestParam int userId){
        Boolean result = cartProductService.deleteUserCartProducts(userId);
        return result;
    }

    public void setRestTemplate(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public void setCartProductService(CartProductService cartProductService) {
        this.cartProductService = cartProductService;
    }

    private String titleFixer(String str){
        int a =0;
        int count=0;
        for(int i=0;i<str.length();i++){
            if(str.charAt(i)==' '){
                count++;
            }
            if(count==5){
                a=i;
            }
        }
        return str.substring(0,a);
    }

    private String camilCase(String str){
        char ch = str.charAt(0);
        if((ch>=97) && (ch<=122)){
            ch=(char)((int)ch-32);
            str = ch+str.substring(1,str.length());
        }
        return str;
    }
}

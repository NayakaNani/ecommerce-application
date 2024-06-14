package com.nendrasys.model;

//import javax.annotation.processing.Generated;
//
//import com.fasterxml.jackson.annotation.JsonInclude;
//import com.fasterxml.jackson.annotation.JsonProperty;
//import com.fasterxml.jackson.annotation.JsonPropertyOrder;
//
//@JsonInclude(JsonInclude.Include.NON_NULL)
//@JsonPropertyOrder({
//        "id",
//        "title",
//        "image",
//        "price",
//        "description",
//        "brand",
//        "model",
//        "category",
//        "discount",
//        "popular"
//})
//@Generated("jsonschema2pojo")
public class Product {

//    @JsonProperty("id")
    private Integer id;
//    @JsonProperty("title")
    private String title;
//    @JsonProperty("image")
    private String image;
//    @JsonProperty("price")
    private Integer price;
//    @JsonProperty("description")
    private String description;
//    @JsonProperty("brand")
    private String brand;
//    @JsonProperty("model")
    private String model;
//    @JsonProperty("category")
    private String category;
//    @JsonProperty("discount")
    private Integer discount;
//    @JsonProperty("popular")
    private Boolean popular;

    private String color;

    private Boolean onSale;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Boolean getOnSale() {
        return onSale;
    }

    public void setOnSale(Boolean onSale) {
        this.onSale = onSale;
    }

    //    @JsonProperty("id")
    public Integer getId() {
        return id;
    }

//    @JsonProperty("id")
    public void setId(Integer id) {
        this.id = id;
    }

//    @JsonProperty("title")
    public String getTitle() {
        return title;
    }

//    @JsonProperty("title")
    public void setTitle(String title) {
        this.title = title;
    }

//    @JsonProperty("image")
    public String getImage() {
        return image;
    }

//    @JsonProperty("image")
    public void setImage(String image) {
        this.image = image;
    }

//    @JsonProperty("price")
    public Integer getPrice() {
        return price;
    }

//    @JsonProperty("price")
    public void setPrice(Integer price) {
        this.price = price;
    }

//    @JsonProperty("description")
    public String getDescription() {
        return description;
    }

//    @JsonProperty("description")
    public void setDescription(String description) {
        this.description = description;
    }

//    @JsonProperty("brand")
    public String getBrand() {
        return brand;
    }

//    @JsonProperty("brand")
    public void setBrand(String brand) {
        this.brand = brand;
    }

//    @JsonProperty("model")
    public String getModel() {
        return model;
    }

//    @JsonProperty("model")
    public void setModel(String model) {
        this.model = model;
    }

//    @JsonProperty("category")
    public String getCategory() {
        return category;
    }

//    @JsonProperty("category")
    public void setCategory(String category) {
        this.category = category;
    }

//    @JsonProperty("discount")
    public Integer getDiscount() {
        return discount;
    }

//    @JsonProperty("discount")
    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

//    @JsonProperty("popular")
    public Boolean getPopular() {
        return popular;
    }

//    @JsonProperty("popular")
    public void setPopular(Boolean popular) {
        this.popular = popular;
    }

}
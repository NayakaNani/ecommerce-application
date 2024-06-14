package com.nendrasys.commerce.model;

public class Product {

    private Integer id;
    private String title;
    private String image;
    private Integer price;
    private String description;
    private String brand;
    private String model;
    private String category;

    public Product() {}

    public Product(Integer id, String title, String image, Integer price, String description, String brand, String model, String category) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.price = price;
        this.description = description;
        this.brand = brand;
        this.model = model;
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}

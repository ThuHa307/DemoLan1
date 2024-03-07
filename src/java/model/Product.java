/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author PC
 */
//Product(ProductID, ProductName, Description, Price, OriginalPrice, Type, Color, Size, Quantity, Image, CategoryID)
public class Product {
    private int id;
    private String name;
    private String description;
    private int price;
    private int oriPrice;
    private String type;
    private String color;
    private String size;
    private int quantity;
    private String image;
    private int categoryId;
    private String colorImage;

    public Product() {
    }    

    public Product(String name, String description, int price, String type, String color, String image) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.type = type;
        this.color = color;
        this.image = image;
    }   

    public Product(String name, String description, int price, int oriPrice, String type, String color, String size, int quantity, String image, int categoryId, String colorImage) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.oriPrice = oriPrice;
        this.type = type;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.image = image;
        this.categoryId = categoryId;
        this.colorImage = colorImage;
    }
    
    
    
    public Product(int id, String name, String description, int price, int oriPrice, String type, String color, String size, int quantity, String iamge, int categoryId, String colorImage) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.oriPrice = oriPrice;
        this.type = type;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.image = iamge;
        this.categoryId = categoryId;
        this.colorImage = colorImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getOriPrice() {
        return oriPrice;
    }

    public void setOriPrice(int oriPrice) {
        this.oriPrice = oriPrice;
    }

    public String getType() {
        return type;
    }

    public String getColorImage() {
        return colorImage;
    }

    public void setColorImage(String colorImage) {
        this.colorImage = colorImage;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", oriPrice=" + oriPrice + ", type=" + type + ", color=" + color + ", size=" + size + ", quantity=" + quantity + ", image=" + image + ", categoryId=" + categoryId + ", colorImage=" + colorImage + '}';
    }
    public static String formatCurrency(int number) {
        DecimalFormat formatter = new DecimalFormat("###,###,###,###.##");
        return formatter.format(number) + "đ";
    }
    
    public static List<Product> removeDuplicateProducts(ArrayList<Product> products) {
        Map<String, Product> productMap = new HashMap<>();

        for (Product product : products) {
            String key = product.getName() + product.getColor();
            if (!productMap.containsKey(key)) {
                productMap.put(key, product);
            }
        }

        return new ArrayList<>(productMap.values());
    }
    
    public static ArrayList<String> getSizes(List<Product> products) {
        ArrayList<String> sizes = new ArrayList<>();

        for (Product product : products) {
            sizes.add(product.getSize());
        }

        return sizes;
    }
}

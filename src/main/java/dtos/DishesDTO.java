package dtos;

import javax.persistence.*;

public class DishesDTO {
    private int dishId;
    private int homeCookId;
    private String dishName;
    private double price;
    private boolean isAvailable;
    private String description;
    private String imageUrl;

    public DishesDTO() {
    }

    public DishesDTO(int dishId, int homeCookId, String dishName, double price, boolean isAvailable, String description, String imageUrl) {
        this.dishId = dishId;
        this.homeCookId = homeCookId;
        this.dishName = dishName;
        this.price = price;
        this.isAvailable = isAvailable;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    public int getHomeCookId() {
        return homeCookId;
    }

    public void setHomeCookId(int homeCookId) {
        this.homeCookId = homeCookId;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}

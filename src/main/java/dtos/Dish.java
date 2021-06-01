package dtos;

public class Dish {
    int DishId;
    String DishName;
    double Price;
    boolean IsAvailable;
    String Description, ImageURL;

    public Dish(int dishId, String dishName, double price, boolean isAvailable, String description, String imageURL) {
        DishId = dishId;
        DishName = dishName;
        Price = price;
        IsAvailable = isAvailable;
        Description = description;
        ImageURL = imageURL;
    }

    public Dish() {
    }

    public int getDishId() {
        return DishId;
    }

    public void setDishId(int dishId) {
        DishId = dishId;
    }

    public String getDishName() {
        return DishName;
    }

    public void setDishName(String dishName) {
        DishName = dishName;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public boolean isAvailable() {
        return IsAvailable;
    }

    public void setAvailable(boolean available) {
        IsAvailable = available;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String imageURL) {
        ImageURL = imageURL;
    }

    @Override
    public String toString() {
        return "Dish{" +
                "DishId=" + DishId +
                ", DishName='" + DishName + '\'' +
                ", Price=" + Price +
                ", IsAvailable=" + IsAvailable +
                ", Description='" + Description + '\'' +
                ", ImageURL='" + ImageURL + '\'' +
                '}';
    }
}

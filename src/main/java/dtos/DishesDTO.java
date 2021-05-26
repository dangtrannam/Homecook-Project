package dtos;

import javax.persistence.*;

@Entity
@Table(name = "Dishes", schema = "dbo", catalog = "homecook")
public class DishesDTO {
    private int dishId;
    private int homeCookId;
    private String dishName;
    private double price;
    private boolean isAvailable;
    private String description;
    private String imageUrl;

    @Id
    @Column(name = "DishID", nullable = false)
    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    @Basic
    @Column(name = "HomeCookID", nullable = false)
    public int getHomeCookId() {
        return homeCookId;
    }

    public void setHomeCookId(int homeCookId) {
        this.homeCookId = homeCookId;
    }

    @Basic
    @Column(name = "DishName", nullable = false, length = 100)
    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    @Basic
    @Column(name = "Price", nullable = false, precision = 0)
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "IsAvailable", nullable = false)
    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    @Basic
    @Column(name = "Description", nullable = true, length = 300)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "ImageURL", nullable = false, length = 100)
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DishesDTO dishesDTO = (DishesDTO) o;

        if (dishId != dishesDTO.dishId) return false;
        if (homeCookId != dishesDTO.homeCookId) return false;
        if (Double.compare(dishesDTO.price, price) != 0) return false;
        if (dishName != null ? !dishName.equals(dishesDTO.dishName) : dishesDTO.dishName != null) return false;
        if (description != null ? !description.equals(dishesDTO.description) : dishesDTO.description != null)
            return false;
        if (imageUrl != null ? !imageUrl.equals(dishesDTO.imageUrl) : dishesDTO.imageUrl != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = dishId;
        result = 31 * result + homeCookId;
        result = 31 * result + (dishName != null ? dishName.hashCode() : 0);
        temp = Double.doubleToLongBits(price);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (imageUrl != null ? imageUrl.hashCode() : 0);
        return result;
    }
}

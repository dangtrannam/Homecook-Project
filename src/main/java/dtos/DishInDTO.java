package dtos;

import javax.persistence.*;

public class DishInDTO {
    private int menuId;
    private int dishId;
    public DishInDTO() {
    }

    public DishInDTO(int menuId, int dishId) {
        this.menuId = menuId;
        this.dishId = dishId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }
}

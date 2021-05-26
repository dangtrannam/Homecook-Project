package dtos;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class DishInDTOPK implements Serializable {
    private int menuId;
    private int dishId;

    @Column(name = "MenuID", nullable = false)
    @Id
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    @Column(name = "DishID", nullable = false)
    @Id
    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DishInDTOPK that = (DishInDTOPK) o;

        if (menuId != that.menuId) return false;
        if (dishId != that.dishId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = menuId;
        result = 31 * result + dishId;
        return result;
    }
}

package dtos;

import javax.persistence.*;

@Entity
@Table(name = "DishIn", schema = "dbo", catalog = "homecook")
@IdClass(DishInDTOPK.class)
public class DishInDTO {
    private int menuId;
    private int dishId;
    private DishesDTO dishesByDishId;

    @Id
    @Column(name = "MenuID", nullable = false)
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    @Id
    @Column(name = "DishID", nullable = false)
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

        DishInDTO dishInDTO = (DishInDTO) o;

        if (menuId != dishInDTO.menuId) return false;
        if (dishId != dishInDTO.dishId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = menuId;
        result = 31 * result + dishId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "DishID", referencedColumnName = "DishID", nullable = false)
    public DishesDTO getDishesByDishId() {
        return dishesByDishId;
    }

    public void setDishesByDishId(DishesDTO dishesByDishId) {
        this.dishesByDishId = dishesByDishId;
    }
}

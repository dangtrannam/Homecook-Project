package dtos;

import javax.persistence.*;

@Entity
@Table(name = "OrderItems", schema = "dbo", catalog = "homecook")
public class OrderItemsDTO {
    private int itemId;
    private int orderID;
    private int quantity;
    private String note;
    private double totalPrice;
    private DishesDTO dishesByDishId;

    @Id
    @Column(name = "ItemID", nullable = false)
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Basic
    @Column(name = "OrderID", nullable = false)
    public int getOrderID -> orderID;
    public void setOrderId(int orderID) -> {this.orderID = orderID};
    
    @Basic
    @Column(name = "Quantity", nullable = false)
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "Note", nullable = true, length = 200)
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Basic
    @Column(name = "TotalPrice", nullable = false, precision = 0)
    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderItemsDTO that = (OrderItemsDTO) o;

        if (itemId != that.itemId) return false;
        if (quantity != that.quantity) return false;
        if (Double.compare(that.totalPrice, totalPrice) != 0) return false;
        if (note != null ? !note.equals(that.note) : that.note != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = itemId;
        result = 31 * result + quantity;
        result = 31 * result + (note != null ? note.hashCode() : 0);
        temp = Double.doubleToLongBits(totalPrice);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
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

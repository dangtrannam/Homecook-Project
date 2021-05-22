package DTO;

public class OrderItem {
    int ItemID, OrderID, DishID, Quantity;
    String Note;
    double TotalPrice;

    public OrderItem(int itemID, int orderID, int dishID, int quantity, String note, double totalPrice) {
        ItemID = itemID;
        OrderID = orderID;
        DishID = dishID;
        Quantity = quantity;
        Note = note;
        TotalPrice = totalPrice;
    }

    public OrderItem() {
    }

    public int getItemID() {
        return ItemID;
    }

    public void setItemID(int itemID) {
        ItemID = itemID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int orderID) {
        OrderID = orderID;
    }

    public int getDishID() {
        return DishID;
    }

    public void setDishID(int dishID) {
        DishID = dishID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String note) {
        this.Note = note;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        TotalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "ItemID=" + ItemID +
                ", OrderID=" + OrderID +
                ", DishID=" + DishID +
                ", Quantity=" + Quantity +
                ", Note='" + Note + '\'' +
                ", TotalPrice=" + TotalPrice +
                '}';
    }
}

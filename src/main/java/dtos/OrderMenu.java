package dtos;

public class OrderMenu {
    String ItemID, OrderID;
    int Quantity;
    String Note;
    Menu Menu;

    double TotalPrice;

    public OrderMenu(String itemID, String orderID, Menu menuItem, int quantity, String note, double totalPrice) {
        ItemID = itemID;
        OrderID = orderID;
        Menu = menuItem;
        Quantity = quantity;
        Note = note;
        TotalPrice = totalPrice;
    }
    public OrderMenu( Menu menuItem, int quantity, String note, double totalPrice) {
        Menu= menuItem;
        Quantity= quantity;
        Note= note;
        TotalPrice= totalPrice;
    }

    public OrderMenu() {
        this.ItemID="";
        this.OrderID="";
        this.Menu= null;
        this.Quantity=0;
        this.Note= "";
        this.TotalPrice=0;
    }

    public String getItemID() {
        return ItemID;
    }
    public void setItemID(String itemID) {
        ItemID = itemID;
    }


    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public dtos.Menu getMenu() {
        return Menu;
    }

    public void setMenu(dtos.Menu menu) {
        Menu = menu;
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
        return "\nOrderMenu{" +
                "ItemID='" + ItemID + '\'' +
                ", OrderID='" + OrderID + '\'' +
                ", Quantity=" + Quantity +
                ", Note='" + Note + '\'' +
                ", Menu=" + Menu+
                ", TotalPrice=" + TotalPrice +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        OrderMenu o = (OrderMenu) obj;
        return this.ItemID.equals(o.ItemID) && this.Note.equals(o.Note) && this.OrderID.equals(o.OrderID)
                && this.Quantity == o.Quantity && this.TotalPrice == this.TotalPrice
                && this.Menu.equals(o.Menu);
    }

}

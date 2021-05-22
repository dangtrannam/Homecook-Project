package DTO;

import java.util.ArrayList;
import java.util.Map;

public class Order {
    int OrderID, TimeStamp;
    String ReceiverPhone, ReceiverAddress, ReceiverName, Note;
    double Total;
    ArrayList<OrderItem> OrderItems;
    Map<Integer, String> Status;

    public Order(int orderID, int timeStamp, Map<Integer, String> status, String receiverPhone,
                 String receiverAddress,
                 String receiverName, double total, String note, ArrayList<OrderItem> orderItems) {
        OrderID = orderID;
        TimeStamp= timeStamp;
        Status= status;
        ReceiverPhone= receiverPhone;
        ReceiverAddress= receiverAddress;
        ReceiverName= receiverName;
        Total= total;
        Note= note;
        OrderItems= orderItems;
    }

    public Order() {
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int orderID) {
        OrderID = orderID;
    }

    public int getTimeStamp() {
        return TimeStamp;
    }

    public void setTimeStamp(int timeStamp) {
        TimeStamp = timeStamp;
    }

    public String getReceiverPhone() {
        return ReceiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        ReceiverPhone = receiverPhone;
    }

    public String getReceiverAddress() {
        return ReceiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        ReceiverAddress = receiverAddress;
    }

    public String getReceiverName() {
        return ReceiverName;
    }

    public void setReceiverName(String receiverName) {
        ReceiverName = receiverName;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String note) {
        Note = note;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double total) {
        Total = total;
    }

    public ArrayList<OrderItem> getOrderItems() {
        return OrderItems;
    }

    public void setOrderItems(ArrayList<OrderItem> orderItems) {
        OrderItems = orderItems;
    }

    public Map<Integer, String> getStatus() {
        return Status;
    }

    public void setStatus(Map<Integer, String> status) {
        Status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "OrderID=" + OrderID +
                ", TimeStamp=" + TimeStamp +
                ", ReceiverPhone='" + ReceiverPhone + '\'' +
                ", ReceiverAddress='" + ReceiverAddress + '\'' +
                ", ReceiverName='" + ReceiverName + '\'' +
                ", Note='" + Note + '\'' +
                ", Total=" + Total +
                ", OrderItems=" + OrderItems +
                ", Status=" + Status +
                '}';
    }
}

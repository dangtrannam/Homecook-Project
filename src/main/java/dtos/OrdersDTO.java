package dtos;

import javax.persistence.*;
import java.sql.Date;

enum statusCode {Pending, Approved, Rejected, Cancel, Delivered, Delivering};

@Entity
@Table(name = "Orders", schema = "dbo", catalog = "homecook")
public class OrdersDTO {
    private int orderId;
    private Date timeStamp;
    private String receiverPhone;
    private String receiverAddress;
    private String receiverName;
    private double total;
    private String note;
    private int statusID;
    private AccountsDTO accountsByHomeCookId;
    private AccountsDTO accountsByCustomerId;
    private statusCode status;

    @Id
    @Column(name = "OrderID", nullable = false)
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "TimeStamp", nullable = false)
    public Date getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(Date timeStamp) {
        this.timeStamp = timeStamp;
    }

    @Basic
    @Column(name = "ReceiverPhone", nullable = false, length = 12)
    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    @Basic
    @Column(name = "ReceiverAddress", nullable = false, length = 120)
    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    @Basic
    @Column(name = "ReceiverName", nullable = false, length = 50)
    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    @Basic
    @Column(name = "Total", nullable = false, precision = 0)
    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
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
    @Column(name = "StatusID", nullable= false)
    public int getStatusID(){
        return statusID;
    }
    public void setStatusID(int statusID){
        this.statusID = statusID;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrdersDTO ordersDTO = (OrdersDTO) o;

        if (orderId != ordersDTO.orderId) return false;
        if (Double.compare(ordersDTO.total, total) != 0) return false;
        if (timeStamp != null ? !timeStamp.equals(ordersDTO.timeStamp) : ordersDTO.timeStamp != null) return false;
        if (receiverPhone != null ? !receiverPhone.equals(ordersDTO.receiverPhone) : ordersDTO.receiverPhone != null)
            return false;
        if (receiverAddress != null ? !receiverAddress.equals(ordersDTO.receiverAddress) : ordersDTO.receiverAddress != null)
            return false;
        if (receiverName != null ? !receiverName.equals(ordersDTO.receiverName) : ordersDTO.receiverName != null)
            return false;
        if (note != null ? !note.equals(ordersDTO.note) : ordersDTO.note != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = orderId;
        result = 31 * result + (timeStamp != null ? timeStamp.hashCode() : 0);
        result = 31 * result + (receiverPhone != null ? receiverPhone.hashCode() : 0);
        result = 31 * result + (receiverAddress != null ? receiverAddress.hashCode() : 0);
        result = 31 * result + (receiverName != null ? receiverName.hashCode() : 0);
        temp = Double.doubleToLongBits(total);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (note != null ? note.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "HomeCookID", referencedColumnName = "UserID", nullable = false)
    public AccountsDTO getAccountsByHomeCookId() {
        return accountsByHomeCookId;
    }

    public void setAccountsByHomeCookId(AccountsDTO accountsByHomeCookId) {
        this.accountsByHomeCookId = accountsByHomeCookId;
    }

    @ManyToOne
    @JoinColumn(name = "CustomerID", referencedColumnName = "UserID", nullable = false)
    public AccountsDTO getAccountsByCustomerId() {
        return accountsByCustomerId;
    }

    public void setAccountsByCustomerId(AccountsDTO accountsByCustomerId) {
        this.accountsByCustomerId = accountsByCustomerId;
    }
}

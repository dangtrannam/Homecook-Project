package daos;

import Utils.DBContext;
import dtos.Order;
import dtos.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class OrderDAO {
    Connection conn= null;
    PreparedStatement ps= null;
    ResultSet rs= null;

    //Lay order cua customer (Customer View)
    public ArrayList<Order> getOrderByCustomerID(int customerID) throws SQLException {
        ArrayList<Order> list= new ArrayList<>();
        String query= "SELECT OrderID, TimeStamp, StatusID, Note, Total FROM Orders WHERE CustomerID=?";
        try {
            conn= new DBContext().makeConnection();
            ps= conn.prepareStatement(query);
            ps.setInt(1, customerID);
            rs= ps.executeQuery();
            while (rs.next()) {
                Order ord= new Order(0, null , null, 0, null);
                int orderID= rs.getInt("OrderID");
                //Doi tu sql Timestamp qua Date java
                java.sql.Timestamp tmpTime= new Timestamp(rs.getTimestamp("TimeStamp").getTime());
                java.util.Date timeStamp= new Date(tmpTime.getTime());
                //chuyen tu status id => name
                String status= ord.getStatusName(rs.getInt("StatusID"));
                double total= rs.getDouble("Total");
                String note= rs.getString("Note");

                ord.setOrderID(orderID);
                ord.setTimeStamp(timeStamp);
                ord.setStatus(status);
                ord.setTotal(total);
                ord.setNote(note);

                list.add(ord);
                return list;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }
    //lay order cua homecook (HomeCook View)
    public ArrayList<Order> getOrderByHomeCookID(int homecookID) throws SQLException {
        ArrayList<Order> list= new ArrayList<>();
        String query= "SELECT OrderID, TimeStamp, StatusID, Note, Total FROM Orders WHERE HomeCookID=?";
        try {
            conn= new DBContext().makeConnection();
            ps= conn.prepareStatement(query);
            ps.setInt(1, homecookID);
            rs= ps.executeQuery();
            while (rs.next()) {
                Order ord= new Order(0, null , null, 0, null);
                int orderID= rs.getInt("OrderID");
                //Doi tu sql Timestamp qua Date java
                java.sql.Timestamp tmpTime= new Timestamp(rs.getTimestamp("TimeStamp").getTime());
                java.util.Date timeStamp= new Date(tmpTime.getTime());
                //chuyen tu status id => name
                String status= ord.getStatusName(rs.getInt("StatusID"));
                double total= rs.getDouble("Total");
                String note= rs.getString("Note");

                ord.setOrderID(orderID);
                ord.setTimeStamp(timeStamp);
                ord.setStatus(status);
                ord.setTotal(total);
                ord.setNote(note);

                list.add(ord);
                return list;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }
    //Admin lay all order
    public ArrayList<Order> getAllHomeCookOrder(int adminID) {
        ArrayList<Order> list= new ArrayList<>();
        String query= "SELECT * FROM Orders";
        try {
            conn= new DBContext().makeConnection();
            ps= conn.prepareStatement(query);
            rs= ps.executeQuery();

            while (rs.next()) {
                Order ord= new Order();

                int ordID= rs.getInt("OrderID");
                int homecookID= rs.getInt("HomeCookID");
                int customerID=rs.getInt("CustomerID");
                // //Doi tu sql Timestamp qua Date java
                java.sql.Timestamp tmpTime= new Timestamp(rs.getTimestamp("TimeStamp").getTime());
                java.util.Date timeStamp= new Date(tmpTime.getTime());
                //chuyen tu status id => name
                String status= ord.getStatusName(rs.getInt("StatusID"));
                String cusPhone= rs.getString("ReceiverPhone");
                String cusAdd= rs.getString("ReceiverAddress");
                String cusName= rs.getString("ReceiverName");
                double total= rs.getDouble("Total");
                String note= rs.getString("Note");

                ord.setOrderID(ordID);
                //Dung o day mai viet tiep
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    //Khi lay date tu object ve thi phai convert sang string de goi ham nay
    public ArrayList<Order> getOrderByTime (String fromDate, String toDate) {
        ArrayList<Order> list= new ArrayList<>();
        String query= "SELECT OrderID, TimeStamp, StatusID, Total, Note FROM Orders WHERE TimeStamp BETWEEN ? AND ?";

        try {
            conn= new DBContext().makeConnection();
            if (conn != null) {
                ps= conn.prepareStatement(query);
                ps.setString(1, fromDate);
                ps.setString(2, toDate);
                rs= ps.executeQuery();
                while (rs.next()) {
                    Order ord= new Order(0, null , null, 0, null);
                    int orderID= rs.getInt("OrderID");
                    //Doi tu sql Timestamp qua Date java
                    java.sql.Timestamp tmpTime= new Timestamp(rs.getTimestamp("TimeStamp").getTime());
                    java.util.Date timeStamp= new Date(tmpTime.getTime());
                    //chuyen tu status id => name
                    String status= ord.getStatusName(rs.getInt("StatusID"));
                    double total= rs.getDouble("Total");
                    String note= rs.getString("Note");

                    ord.setOrderID(orderID);
                    ord.setTimeStamp(timeStamp);
                    ord.setStatus(status);
                    ord.setTotal(total);
                    ord.setNote(note);

                    list.add(ord);
                    return list;
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return null;
    }

    //Doi status
    public boolean changeOrderStatus(int orderID,  String statusName) throws SQLException {
        Order ord= new Order();
        int statusID= ord.getStatusID(statusName);
        String query= "UPDATE Orders SET StatusID=? WHERE OrderID=?";
        try {
            conn= new DBContext().makeConnection();
            if (conn != null) {
                ps= conn.prepareStatement(query);
                ps.setInt(1, statusID);
                ps.setInt(2, orderID);
                int n= ps.executeUpdate();
                if (n>0) { return true; }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public boolean createOrderItem(Order ord) {
        String query="INSERT INTO OrderItems (OrderID, DishID, Quantity, Note, TotalPrice) VALUES (?,?,?,?,?)";
        try {
            conn= new DBContext().makeConnection();
            if (conn != null) {
                ps= conn.prepareStatement(query);
                //when we query, the db will commit automatically => ko dung addBatch duoc
                //Vay thi phai commit db manually
                conn.setAutoCommit(false);
                for (OrderItem item: ord.getOrderItems()) {
                    ps.setInt(1, ord.getOrderID());
                    ps.setInt(2, item.getDish().getDishId());
                    ps.setInt(3, item.getQuantity());
                    ps.setString(4, item.getNote());
                    ps.setDouble(5, item.getTotalPrice());
                    ps.addBatch();
                }
                int [] count= ps.executeBatch();
                conn.commit();
                if (count != null) { return true;}
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public boolean createNewOrder(Order ord) {
        int statusID= ord.getStatusID(ord.getStatus());
        java.util.Date objDate= new java.util.Date(ord.getTimeStamp().getTime());
        java.sql.Timestamp timeStamp= new java.sql.Timestamp(objDate.getTime());
        String query="INSERT INTO Orders (HomeCookID, CustomerID, TimeStamp, StatusID," +
                " ReceiverPhone, ReceiverAddress, ReceiverName, Total, Note) " +
                "VALUES (?,?,?,?,?,?,?,?,?) ";
        try {
            conn= new DBContext().makeConnection();
            if (conn != null) {
                ps= conn.prepareStatement(query);
                ps.setInt(1, ord.getHomeCookID());
                ps.setInt(2, ord.getCustomerID());
                ps.setTimestamp(3, timeStamp);
                ps.setInt(4, statusID);
                ps.setString(5, ord.getReceiverPhone());
                ps.setString(6, ord.getReceiverAddress());
                ps.setString(7, ord.getReceiverName());
                ps.setDouble(8, ord.getTotal());
                ps.setString(9, ord.getNote());

                int n= ps.executeUpdate();
                if (n>0) { return true; }

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        OrderDAO dao= new OrderDAO();
        System.out.println(dao.getOrderByHomeCookID(5));
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Customer;
import model.Item;
import model.Order;
import model.Product;

public class OderDAO {

    private static final String readAll = "select * from [order] where isActive = 1";

    //lấy tất cả order
    public static List<Order> getOrderListFromDatabase() {
        List<Order> orderList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stm = conn.prepareStatement(readAll);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                int customerID = rs.getInt("CustomerID");
                String address = rs.getString("Address");
                boolean isPaymentOnline = rs.getBoolean("isPaymentOnline");
                Date orderDate = rs.getDate("OrderDate");
                String status = rs.getString("Status");
                double totalPrice = rs.getDouble("totalPrice");
                String nameRe = rs.getString("NameReceiver");
                String phoneRe = rs.getString("PhoneReceiver");
                Order x = new Order(orderID, customerID, address, isPaymentOnline, orderDate, status, totalPrice, nameRe, phoneRe);
                orderList.add(x);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderList;
    }

    //lấy 1 order by orderID
    public static List<Order> getOneOrder(int customerID) {
        List<Order> orderL = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM [Order] WHERE CustomerID=?");
            stmt.setInt(1, customerID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next( )) {
                int orderID = rs.getInt("OrderID");
                String address = rs.getString("Address");
                boolean isPaymentOnline = rs.getBoolean("isPaymentOnline");
                Date orderDate = rs.getDate("OrderDate");
                String status = rs.getString("Status");
                double totalPrice = rs.getDouble("totalPrice");
                String nameRe = rs.getString("NameReceiver");
                String phoneRe = rs.getString("PhoneReceiver");
                Order x = new Order(orderID, customerID, address, isPaymentOnline, orderDate, status, totalPrice, nameRe, phoneRe);
                orderL.add(x);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderL;
    }

    //tạo order
    public static void addOrder(Customer u, Cart cart, String diachi, boolean isPaymentOnline, double totalPrice, String nameReceiver, String phone) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "INSERT INTO [Order] (CustomerID,OrderDate,Address,isPaymentOnline,totalPrice,NameReceiver, PhoneReceiver)output inserted.OrderID VALUES (?, ?, ?, ?, ?,?,?)";
            PreparedStatement st = DBConnection.getConnection().prepareStatement(sql);
            st.setInt(1, u.getCustomerID());
            st.setString(2, date);
            st.setString(3, diachi);
            st.setBoolean(4, isPaymentOnline);
            st.setDouble(5, totalPrice);//
            System.out.println("Hello: "+totalPrice);
            st.setString(6, nameReceiver);
            st.setString(7, phone);
            st.executeQuery();
            // lay ra  
            String sql1 = "SELECT TOP 1 OrderID FROM [Order] ORDER BY OrderID DESC";
            PreparedStatement st1 = DBConnection.getConnection().prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int OrderDetailsID = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    System.out.println(i.toString());
                    String sql2 = "INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)output inserted.OrderDetailsID VALUES (?, ?, ?, ?)";
                    PreparedStatement st2 = DBConnection.getConnection().prepareStatement(sql2);
                    st2.setInt(1, OrderDetailsID);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    System.out.println(i.getPrice());
                    st2.setDouble(4, i.getPrice());
                    st2.executeQuery();
                    String sql3 = "UPDATE Product\n"
                            + "SET Quantity = Quantity - ?\n"
                            + "WHERE ProductID = ?;";
                    PreparedStatement st3 = DBConnection.getConnection().prepareStatement(sql3);
                    st3.setInt(1, i.getQuantity());
                    st3.setInt(2, i.getProduct().getId());
                    st3.executeUpdate();
                }
            }
        } catch (Exception e) {
            System.out.println("loi");
            System.out.println(e);
        }
    }

    //update status
    public static boolean updateOrderStatus(int orderId, String newStatus) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement("UPDATE [Order] SET status = ? WHERE OrderID = ?");
            statement.setString(1, newStatus);
            statement.setInt(2, orderId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //deleteOrder
    public static void deleteOrder(int orderId) {
        try (Connection con = DBConnection.getConnection()) {
            // xóa trong bảng orderdetails
            String deleteOrderDetails = "UPDATE [OrderDetails] SET isActive = 0 WHERE OrderID = ?";
            PreparedStatement st1 = con.prepareStatement(deleteOrderDetails);
            st1.setInt(1, orderId);
            st1.executeUpdate();

            // xóa trong bảng order
            String deleteOrder = "UPDATE [Order] SET isActive = 0 WHERE OrderID = ?";
            PreparedStatement st2 = con.prepareStatement(deleteOrder);
            st2.setInt(1, orderId);
            st2.executeUpdate();
            System.out.println("Order with ID " + orderId + " deleted successfully.");
        } catch (SQLException e) {
            System.out.println("Error deleting order: " + e.getMessage());
        }
    }

    public List<Item> orderDetailFromOrder(int orderid) {
        List<Item> items = new ArrayList<>();
        String sql = "select * from OrderDetails where OrderID = ?";
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement st1 = con.prepareStatement(sql);
            st1.setInt(1, orderid);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String pdid = String.valueOf(ProductID);
                int Quantity = rs.getInt("Quantity");
                Double Price = rs.getDouble("Price");
                ProductDAO pd = new ProductDAO();
                Product product = pd.findById(pdid);
                Item it = new Item(product, Quantity, Price);
                items.add(it);
            }
        } catch (SQLException e) {
            System.out.println("Error deleting order: " + e.getMessage());
        }
        return items;
    }

    public Order getOrderByID(int id) {
        Order od = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "select * from [Order] where OrderID = ?";
            PreparedStatement st1 = con.prepareStatement(sql);
            st1.setInt(1, id);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("orderID");
                int customerID = rs.getInt("customerID");
                String address = rs.getString("customerID");
                boolean isPaymentOnline = rs.getBoolean("isPaymentOnline");
                Date orderDate = rs.getDate("OrderDate");
                double totalPrice = rs.getDouble("totalPrice");
                String nameReceive = rs.getString("NameReceiver");
                String phoneReceive = rs.getString("PhoneReceiver");
                String status = rs.getString("Status");
                od = new Order(orderID, customerID, address, isPaymentOnline, orderDate, status, totalPrice, nameReceive, phoneReceive);
            }
        } catch (SQLException e) {
            System.out.println("Error deleting order: " + e.getMessage());
        }

        return od;
    }


    public static void main(String[] args) {

        //     Customer x = new Customer(3, "Thao Huong", "2024-05-15", "Female", "john.hhhhh@example.com", true, "12345455", "Customer", "john_hhhh", "p123456", "2024-02-28", true);
//        Customer a = new Customer(2, "Thao Huong", "2024/05/15", "Female", "john.hhhhh@example.com", true, "0123456785", "Customer", "hhhhh", "p123", "2024/05/28", true);
//        // Create a sample Cart object with some Items
//        Cart cart = new Cart();
//        cart.addItem(new Item(new Product(3, "Áo khoác cardigan unisex c? V tay dài Varsity Big Logo", "Mang d?n s? k?t h?p hoàn h?o gi?a phong cách c? di?n và hi?n d?i, áo khoác cardigan Varsity Big Logo t? MLB là m?t l?a ch?n th?i trang không th? b? qua. N?i b?t v?i h?a ti?t logo ?n tu?ng mang d?n s? tr? trung, nang d?ng, Varsity Big Logo h?a h?n s? cùng b?n th? hi?n phong cách d?c dáo.", 40, 50, "Áo khoác cardigan", "white", "XS", 22, "https://product.hstatic.net/200000642007/product/50crd_3akcv0141_1_954b2d51e9e24ae39df65473ec3ce177_f8e516f9f90746d493fe48ee8696c7c7_master.jpg", 1,"https://product.hstatic.net/200000642007/product/icon_50crs_3atsq0141_04ea619fe60642378c35c8f732981e46_921bfc475d88436bb0895e8f64b89197.jpg"), 2, 50.0));
//
//        // Call the addOrder method with the sample Customer and Cart objects
//        addOrder(a, cart, "Quanggg", true, 123, "vânnh", "0123123123");
//        System.out.println("Add success.");
        //    deleteOrder(3);
//         updateOrderStatus(2, "onhold");
    OderDAO pd = new OderDAO();
    List<Order> od = pd.getOneOrder(1);
        for (Order order : od) {
            System.out.println(order.toString());
        }
    }

}

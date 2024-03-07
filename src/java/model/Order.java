/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import dao.OderDAO;

/**
 *
 * @author Admin
 */
public class Order {
    private int orderID;
    private int customerID;
    private String address;
    private boolean isPaymentOnline;
    private Date orderDate;
    private double totalPrice;
    private String nameReceive;
    private String phoneReceive;
    private String status;
    
    public Order() {
    }

    public Order(int orderID, int customerID, String address, boolean isPaymentOnline, Date orderDate, String status, double totalPrice, String nameReceive, String phoneReceive) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.address = address;
        this.isPaymentOnline = isPaymentOnline;
        this.orderDate = orderDate;
        this.status = status;
        this.nameReceive = nameReceive;
        this.phoneReceive = phoneReceive;
        this.totalPrice = totalPrice;
    
    }
    
    public Order(int orderID, int customerID, String address, boolean isPaymentOnline, String orderDate, String status, double totalPrice,String nameReceive, String phoneReceive) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.address = address;
        this.isPaymentOnline = isPaymentOnline;
        setOrderDate(orderDate);
        this.status = status;
        this.nameReceive = nameReceive;
        this.phoneReceive = phoneReceive;
        this.totalPrice = totalPrice;
    }
    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isIsPaymentOnline() {
        return this.isPaymentOnline;
    }

    public void setIsPaymentOnline(boolean isPaymentOnline) {
        this.isPaymentOnline = isPaymentOnline;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNameReceive() {
        return nameReceive;
    }

    public void setNameReceive(String nameReceive) {
        this.nameReceive = nameReceive;
    }

    public String getPhoneReceive() {
        return phoneReceive;
    }

    public void setPhoneReceive(String phoneReceive) {
        this.phoneReceive = phoneReceive;
    }
    
    
    
    public String convertDate() {
         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
         String formattedDate = sdf.format(orderDate);
         return formattedDate;
    }
    
    public void setOrderDate(String orderDate) {
        SimpleDateFormat sd= new SimpleDateFormat("dd/MM/yyyy");
        try {
            this.orderDate = new Date(sd.parse(orderDate).getTime());
        } catch (Exception ex) {
            throw new RuntimeException("Invalid DOB");
        }
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", customerID=" + customerID + ", address=" + address + ", isPaymentOnline=" + isPaymentOnline + ", orderDate=" + orderDate + ", totalPrice=" + totalPrice + ", nameReceive=" + nameReceive + ", phoneReceive=" + phoneReceive + ", status=" + status + '}';
    }
    
    
    
    
    public List<Order> readAll() {
        return OderDAO.getOrderListFromDatabase();
    }
    
//    public String addNew(){
//        return OderDAO.addOrder(u, cart);
//    }

}

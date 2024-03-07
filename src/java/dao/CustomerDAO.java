/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author Admin
 */
public class CustomerDAO {
    private static final String LOGIN = "SELECT CustomerID,FullName,DateOfBirth,Gender,Gmail,GmailConfirm,Phone,Role,UserName,LastLogin,IsActive from Customer where UserName=? and Password=?";
    public Customer checkLogin(String user, String pass) throws ParseException {
        Customer cus = null;
        PreparedStatement prStm = null;
        ResultSet rs = null;
        try ( Connection con = DBConnection.getConnection()) {
            if (con != null) {
                prStm = con.prepareStatement(LOGIN);
                prStm.setString(1, user);
                prStm.setString(2, pass);
                rs = prStm.executeQuery();
                if (rs.next()) {
                    boolean isActive=convertToBoolean(rs.getInt("IsActive"));
                    if(isActive==false){
                        return null;
                    }
                    int id = rs.getInt("CustomerID");
                    String fullName = rs.getString("FullName");
                    Date dob = rs.getDate("DateOfBirth");
                    String gender = rs.getString("Gender");
                    String gmail = rs.getString("Gmail");
                    boolean gmailConfirm=rs.getBoolean("GmailConfirm");
                    String phone = rs.getString("Phone");
                    String r = rs.getString("Role");
                    Date lastLogin = setNewLastLogin();
                    cus = new Customer(id, fullName, dob, gender, gmail, !gmailConfirm, phone, r, user, "", lastLogin, true);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
    }
    public static boolean convertToBoolean(int so){
        return so==1;
    }
    public static Date setNewLastLogin(){
        long millis = System.currentTimeMillis();
        java.sql.Date sqlDate = new java.sql.Date(millis);       
        return sqlDate;
    }
    public void newLastLogin(int id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Customer SET LastLogin=? WHERE CustomerID =?");
            stmt.setDate(1, setNewLastLogin());
            stmt.setInt(2, id);
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Deactivation successful!");
            } else {
                System.out.println("Deactivation failed!");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("fail!");
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static ArrayList<Customer> getCustomerFromDatabase() {
        ArrayList<Customer> customers = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "Select * from Customer where role='User'";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("CustomerID");
                String fullName = rs.getString("FullName");
                Date dob = rs.getDate("DateOfBirth");
                String gender = rs.getString("Gender");
                String gmail = rs.getString("Gmail");
                boolean gmailConfirm=rs.getBoolean("GmailConfirm");
                String phone = rs.getString("Phone");
                String r = rs.getString("Role");
                Date lastLogin = rs.getDate("LastLogin");
                boolean isActive = rs.getBoolean("IsActive");
                Customer cus = new Customer(id, fullName, dob, gender, gmail, gmailConfirm, phone, r, fullName, "", lastLogin, !isActive);
                customers.add(cus);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("fail!");
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }
    public static ArrayList<Customer> getAdminFromDatabase() {
        ArrayList<Customer> customers = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "Select * from Customer where role='Admin'";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("CustomerID");
                String fullName = rs.getString("FullName");
                Date dob = rs.getDate("DateOfBirth");
                String gender = rs.getString("Gender");
                String gmail = rs.getString("Gmail");
                boolean gmailConfirm=rs.getBoolean("GmailConfirm");
                String phone = rs.getString("Phone");
                String r = rs.getString("Role");
                Date lastLogin = rs.getDate("LastLogin");
                boolean isActive = rs.getBoolean("IsActive");
                Customer cus = new Customer(id, fullName, dob, gender, gmail, gmailConfirm, phone, r, fullName, "", lastLogin, !isActive);
                customers.add(cus);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("fail!");
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }
    public static int addCustomer(Customer c){
        int id=-1;
        try(Connection con=DBConnection.getConnection()) {
            PreparedStatement stmt=con.prepareStatement("INSERT INTO Customer (FullName, DateOfBirth, Gender, Gmail, GmailConfirm, Phone, Role, UserName, Password, LastLogin, IsActive) output inserted.CustomerID values(?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1, c.getFullName());
            stmt.setDate(2, c.getDateOfBirth());
            stmt.setString(3, c.getGender());
            stmt.setString(4, c.getGmail());
            stmt.setBoolean(5, c.isGmailConfirm());
            stmt.setString(6, c.getPhone());
            stmt.setString(7, c.getRole());
            stmt.setString(8, c.getUserName());
            stmt.setString(9, c.getPassword());
            stmt.setDate(10, c.getLastLogin());
            stmt.setBoolean(11, c.isIsActive());
            
            ResultSet rs=stmt.executeQuery();
            if(rs.next()){
                id=rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public static boolean isExist(String username) {
        boolean flag = false;
        System.out.println(username);
        try(Connection con=DBConnection.getConnection()) {
            PreparedStatement stmt=con.prepareStatement("Select * from customer where username = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public static boolean addCustomer(String name, boolean isVerify, String email){
        boolean flag = false;
        try(Connection con=DBConnection.getConnection()) {
            PreparedStatement stmt=con.prepareStatement("INSERT INTO Customer (FullName, DateOfBirth, Gender, Gmail, GmailConfirm, Phone, Role, UserName, Password, LastLogin, IsActive) values(?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1, name);
            stmt.setDate(2, null);
            stmt.setString(3, null);
            stmt.setString(4, email);
            stmt.setBoolean(5, isVerify);
            stmt.setString(6, null);
            stmt.setString(7, "User");
            stmt.setString(8, email);
            stmt.setString(9, email);
            stmt.setDate(10, setNewLastLogin());
            stmt.setBoolean(11, true);
            
            
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                flag = true;
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public static boolean checkUserName(String username){
        String nameCheck=null;
        try(Connection con=DBConnection.getConnection()) {
            PreparedStatement stmt=con.prepareStatement("Select * from Customer where Username=?");
            stmt.setString(1, username);
            ResultSet rs=stmt.executeQuery();
            if(rs.next()){
                nameCheck=rs.getString(9);
            }
            if(nameCheck!=null) return false;
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    public static boolean containsSpecialCharacters(String inputString) {
        String specialCharacterRegex = "[!@#$%^&*()_+{}\\[\\]:;<>,.?~\\\\|/]";
        return inputString.matches(".*" + specialCharacterRegex + ".*");
    }
    public static void updateCustomer(Customer c) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Customer SET FullName=?,DateOfBirth=?,Gender=?,Phone=?,Gmail=? WHERE CustomerID=?");
            stmt.setString(1, c.getFullName());
            stmt.setDate(2, c.getDateOfBirth());
            stmt.setString(3, c.getGender());
            stmt.setString(4, c.getPhone());
            stmt.setString(5, c.getGmail());
            stmt.setInt(6, c.getCustomerID());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Update successful!");
            } else {
                System.out.println("Update failed!");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("fail!");
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void deleteCustomer(int id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Customer SET IsActive=0 WHERE CustomerID =?");
            stmt.setInt(1, id);
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Deactivation successful!");
            } else {
                System.out.println("Deactivation failed!");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("fail!");
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static Customer searchUser(String username){
        Customer c =null;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("Select * from Customer where Username=? and Role='User'");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("CustomerID");
                String fullName = rs.getString("FullName");
                Date dob = rs.getDate("DateOfBirth");
                String gender = rs.getString("Gender");
                String gmail = rs.getString("Gmail");
                boolean gmailConfirm=rs.getBoolean("Gender");
                String phone = rs.getString("Phone");
                String r = rs.getString("Role");
                Date lastLogin = rs.getDate("LastLogin");
                boolean isActive = rs.getBoolean("IsActive");
                c = new Customer(id, fullName, dob, gender, gmail, gmailConfirm, phone, r, username, "", lastLogin, isActive);
                
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("fail!");
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
//    private static final String DATE_FORMAT = "dd/MM/yyyy";
//    private static final String DATE_FORMAT = "yyyy-MM-dd";
//    public static boolean isValidDateFormat(String input) {
//        if (input == null) {
//            return false;
//        }
//        SimpleDateFormat format = new SimpleDateFormat(DATE_FORMAT);
//        format.setLenient(false);
//        try {
//            Date date = (Date) format.parse(input);
//            return true;
//        } catch (ParseException e) {
//            return false;
//        }
//    }
    public static boolean isNumeric(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    public static void main(String[] args) {
        String input = "0000011012003";
//        Customer c = new Customer(11, "Tran Tan", "11/11/1111", "Nữ", "abc@gmail.com", false, "9999999999", "", "", "", "11/11/1111", true);
//        updateCustomer(c);
        Customer c =searchUser("DE170310");
        if (c!=null) {
            System.out.println(c.toString());
        } else {
            System.out.println("null");
        }
    }
}

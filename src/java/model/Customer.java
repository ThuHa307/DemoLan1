/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.CustomerDAO;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Customer {
    private int customerID;
    private String fullName;
    private Date dateOfBirth;
    private String gender;
    private String gmail;
    private boolean gmailConfirm;
    private String phone;
    private String role;
    private String userName;
    private String password;
    private Date lastLogin;
    private boolean isActive;

    public Customer() {
    }

    public Customer(int customerID, String fullName, Date dateOfBirth, String gender, String gmail, boolean gmailConfirm, String phone, String role, String userName, String password, Date lastLogin, boolean isActive) {
        this.customerID = customerID;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.gmail = gmail;
        this.gmailConfirm = gmailConfirm;
        this.phone = phone;
        this.role = role;
        this.userName = userName;
        this.password = password;
        this.lastLogin = lastLogin;
        this.isActive = isActive;
    }
    public Customer(int customerID, String fullName, String dateOfBirth, String gender, String gmail, boolean gmailConfirm, String phone, String role, String userName, String password, String lastLogin, boolean isActive) {
        this.customerID = customerID;
        this.fullName = fullName;
        setDOB(dateOfBirth);
        this.gender = gender;
        this.gmail = gmail;
        this.gmailConfirm = gmailConfirm;
        this.phone = phone;
        this.role = role;
        this.userName = userName;
        this.password = password;
        setLastLogin(lastLogin);
        this.isActive = isActive;
    }
    public Customer(String fullName, String dateOfBirth, String gender, String gmail, boolean gmailConfirm, String phone, String role, String userName, String password, String lastLogin, boolean isActive) {
        this.fullName = fullName;
        setDOB(dateOfBirth);
        this.gender = gender;
        this.gmail = gmail;
        this.gmailConfirm = gmailConfirm;
        this.phone = phone;
        this.role = role;
        this.userName = userName;
        this.password = password;
        setLastLogin(lastLogin);
        this.isActive = isActive;
    }
    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", fullName=" + fullName + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender + ", gmail=" + gmail + ", gmailConfirm=" + gmailConfirm + ", phone=" + phone + ", role=" + role + ", userName=" + userName + ", password=" + password + ", lastLogin=" + lastLogin + ", isActive=" + isActive + '}';
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public boolean isGmailConfirm() {
        return gmailConfirm;
    }

    public void setGmailConfirm(boolean gmailConfirm) {
        this.gmailConfirm = gmailConfirm;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String convertDOB() {
         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
         String formattedDate = sdf.format(dateOfBirth);
         return formattedDate;
    }
    public String convertLastLogin() {
         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
         String formattedDate = sdf.format(lastLogin);
         return formattedDate;
    }
    public void setDOB(String DOB) {
        SimpleDateFormat sd= new SimpleDateFormat("dd/MM/yyyy");
        try {
            this.dateOfBirth = new Date(sd.parse(DOB).getTime());
        } catch (Exception ex) {
            throw new RuntimeException("Invalid DOB");
        }
    }
    public void setLastLogin(String lastLogin) {
        SimpleDateFormat sd= new SimpleDateFormat("dd/MM/yyyy");
        try {
            this.lastLogin = new Date(sd.parse(lastLogin).getTime());
        } catch (Exception ex) {
            throw new RuntimeException("Invalid DOB");
        }
    }
    public int addNew(){
        return CustomerDAO.addCustomer(this);
    }
    public ArrayList<Customer> listCus(){
        return CustomerDAO.getCustomerFromDatabase();
    }
    public ArrayList<Customer> listAdmin(){
        return CustomerDAO.getAdminFromDatabase();
    }
    public void update(){
        CustomerDAO.updateCustomer(this);
    }
    public void delete(){
        CustomerDAO.deleteCustomer(customerID);
    } 
    public void search(){
        CustomerDAO.searchUser(userName);
    } 
}

<%-- 
    Document   : acc
    Created on : Feb 16, 2024, 10:23:28 PM
    Author     : tvanh
--%>

<%@page contentType="text/html" errorPage="error.jsp"  import="model.*" pageEncoding="utf-8" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<html>
    <head>
        <title>Info</title>
        
        <link href="//theme.hstatic.net/200000642007/1001190625/14/plugins-css.css?v=97" rel="stylesheet" type="text/css">
        <link href="//theme.hstatic.net/200000642007/1001190625/14/styles.scss.css?v=97" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div style="all: initial;">
            <%@ include file="header.jsp" %>
        </div>
        
        <div class="layout-main-account">
            <div class="wrapper-account ">



                <!--leftsite-->
                <div class="sidebar-account">
                    <div class="sidebar-inner">
                        <h2>
                            Tài khoản
                        </h2>
                        <div class="box-sidebar">
                            <h4>
                                Thông tin mua hàng                                 
                            </h4>
                            <ul>
                                <li><a href="" onclick="showSection('orders')">Thông tin đặt hàng</a></li>
                                <li><a href="" onclick="showSection('tracking')">Theo dõi đơn hàng</a></li>
                            </ul>
                        </div>
                        <div class="box-sidebar">
                            <h4>
                                Voucher
                            </h4>
                            <ul>
                                <li><a href="voucherInfo.jsp" onclick="showSection(event, 'voucher')">Danh sách Voucher</a></li>
                            </ul>
                        </div>
                        <div class="box-sidebar">
                            <h4>
                                Thông tin hoạt động
                            </h4>
                            <ul>
                                <li><a href="/account?view=wishlist">Danh sách yêu thích</a></li>
                                <li><a href="/account?view=recently">Đã xem gần đây</a></li>
                            </ul>
                        </div>
                        <div class="box-sidebar">
                            <h4>
                                Cài đặt tài khoản
                            </h4>
                            <ul>
                                <li><a href="/account/addresses">Địa chỉ giao hàng</a></li>
                                <li><a href="cusInfo.jsp" onclick="showSection(event, 'info')">Thông tin của tôi</a></li>
                                <li><a class="delete-account" href="delete.jsp?id=${sessionScope.userLogin.customerID}">Xóa tài khoản</a></li>
                                <li><a href="logout">Đăng xuất</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <!--cusInfo-->
                <div class="main-account">

                    <div class="info">
                            <div class="profile_page col">
                                <h1 class="text-center profile_page-title profile-page_main_title">
                                    <div class="content-asset content_asset-my_account_profile_page_title">
                                        Xác nhận xóa tài khoản
                                    </div> 
                                </h1>
                                <div class="profile-body profile-page_body">
                                    
                                        <%
                                        String id = request.getParameter("id");
                                        ArrayList<Customer> customers ;
                                        CustomerDAO cd = new CustomerDAO();
                                        customers = cd.getCustomerFromDatabase();
                                        Customer cusToDelete = null;
                                        if (customers != null) {
                                            for (Customer cus: customers) {
                                                if (cus.getCustomerID() == Integer.parseInt(id)) {
                                                   cusToDelete = cus;
                                                   break;
                                                   }
                                            }
                                        }
                                       %>
                                       <form class="was-validated" action="deleteCustomer" method="post" name="customer">
                                           <input type="hidden" name="cusId" value="<%= cusToDelete != null ? cusToDelete.getCustomerID() : "" %>">
                                           <LI>Customer ID: <%= cusToDelete != null ? cusToDelete.getCustomerID() : "" %></LI>
                                           <LI>Customer Name: <%= cusToDelete != null ? cusToDelete.getFullName() : "" %></LI>
                                           <LI>Customer Gender: <%= cusToDelete != null ? cusToDelete.getGender() : "" %></LI>
                                           <LI>Customer DOB: <%= cusToDelete != null ? cusToDelete.convertDOB() : "" %></LI>
                                           <LI>Customer Gmail: <%= cusToDelete != null ? cusToDelete.getGmail() : "" %></LI>
                                           <hr>
                                           Xác nhận xóa tài khoản?
                                           <input type="submit" value="Xóa" />
                                           
                                       </form>
                                </div>
                            </div>

                        </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>


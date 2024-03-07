<%-- 
    Document   : adminControlList
    Created on : Mar 5, 2024, 10:17:41 PM
    Author     : Admin
--%>
<%@page contentType="text/html" errorPage="error.jsp"  import="model.*" pageEncoding="utf-8" %>
<html>
    <head>
        <title>Info</title>
        
        <link href="//theme.hstatic.net/200000642007/1001190625/14/plugins-css.css?v=97" rel="stylesheet" type="text/css">
        <link href="//theme.hstatic.net/200000642007/1001190625/14/styles.scss.css?v=97" rel="stylesheet" type="text/css">
        <style>
            input[type="submit"] {
                border: none;
            }
/*            form {
                border: none;
                color: #ffffff;
            }*/
        </style>
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
                            Chức năng
                        </h2>
                        <div class="box-sidebar">
                            <h4>
                                Xem danh sách                                 
                            </h4>
                            <ul>
                                <li>
                                    <form action="listCustomer" method="get" >
                                        <input type="submit" value="1. Admin" name="listChoice"/>
                                    </form>
                                </li>
                                <li>
                                    <form action="listCustomer" method="get">
                                        <input type="submit" value="2. Khách hàng hoạt động" name="listChoice"/>
                                    </form>
                                </li>
                                <li>
                                    <form action="listCustomer" method="get">
                                        <input type="submit" value="3. Các tài khoản bị xóa" name="listChoice"/>
                                    </form>
                                </li>
                            </ul>
                        </div>
                        <div class="box-sidebar">
                            <h4>
                                Tìm kiếm
                            </h4>
                            <ul>
                                <li><a href="searchUser.jsp" onclick="showSection(event, 'voucher')">Tìm kiếm khách hàng</a></li>
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
                                <li><a href="#" onclick="showSection(event, 'info')">Thông tin của tôi</a></li>
                                <li><a class="delete-account" href="#">Xóa tài khoản</a></li>
                                <li><a href="logout">Đăng xuất</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <!--cusInfo-->
                
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>



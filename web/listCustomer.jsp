<%-- 
    Document   : listCustomer
    Created on : Mar 3, 2024, 10:58:54 PM
    Author     : Admin
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.Customer" %>
<%@ page import="dao.CustomerDAO" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" errorPage="error.jsp"  import="model.*" pageEncoding="utf-8" %>

<html>
    <head>
        <title>List</title>
        
        <link href="//theme.hstatic.net/200000642007/1001190625/14/plugins-css.css?v=97" rel="stylesheet" type="text/css">
        <link href="//theme.hstatic.net/200000642007/1001190625/14/styles.scss.css?v=97" rel="stylesheet" type="text/css">
        <style>
            tr {
              height: 50px;
            }
            th, td {
              height: 40px;
            }
            input[type="submit"] {
                border: none;
            }
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
                <div class="main-account">

                    <div class="info">
                            <div class="profile_page col">
                                <h1 class="text-center profile_page-title profile-page_main_title">
                                    <div class="content-asset content_asset-my_account_profile_page_title">
                                        Danh sách
                                    </div> 
                                </h1>
                                <div class="profile-body profile-page_body">
                                    
                                        <c:set var="choice" value="${sessionScope.choice}" />
                                        <c:if test="${choice==1}">
                                            <h1>List of Admin</h1>
                                        </c:if>
                                        <c:if test="${choice==2}">
                                            <h1>List of Customer Active</h1>
                                        </c:if>
                                        <c:if test="${choice==3}">
                                            <h1>List of Customer non-Active</h1>
                                        </c:if>
                                        <c:set var="customers" value="${sessionScope.data}" />
                                        <c:if test="${not empty customers}">
                                            <table border="1" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 50px;text-align: center;">ID</th>
                                                        <th style="width: 100px;">Name</th>
                                                        <th style="width: 100px;">DOB</th>
                                                        <th style="width: 50px;">Gender</th>
                                                        <th style="width: 100px;">Email</th>
                                                        <th style="width: 70px;">Xác nhận</th>
                                                        <th style="width: 100px;">Phone</th>
                                                        <th style="width: 100px;">Last Login</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="customer" items="${customers}">
                                                        <tr>
                                                            <td style="text-align: center;">${customer.customerID}</td>
                                                            <td>${customer.fullName}</td>
                                                            <td>${customer.dateOfBirth}</td>
                                                            <td>${customer.gender}</td>
                                                            <td>${customer.gmail}</td>
                                                            <td>${customer.gmailConfirm}</td>
                                                            <td>${customer.phone}</td>
                                                            <td>${customer.lastLogin}</td>
                                                        </tr>
                                                    
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div style="margin-top: 10px;">
                                                <ul style="list-style: none; padding: 0;">
                                                <c:forEach var="i" begin="1" end="${pageCount}">
                                                <c:choose>
                                                <c:when test="${i == currentPage}">
                                                    <li style="margin-right: 5px; padding: 5px; border: 2px solid darkmagenta; display: inline;">
                                                        <strong>${i}</strong>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li style="margin-right: 5px; padding: 5px; border: 2px solid darkmagenta; display: inline;">
                                                        <a href="listCustomer?page=${i}">${i}</a>
                                                    </li>
                                                </c:otherwise>
                                                </c:choose>
                                                </c:forEach>
                                                </ul>
                                            </div>
                                        </c:if>

                                        <c:if test="${empty customers}">
                                            <p>No result found.</p>
                                        </c:if>
                                </div>
                            </div>

                        </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>

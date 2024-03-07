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
            tr {
              height: 50px;
            }
            th, td {
              height: 40px;
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
                <!--search-->
                <div class="main-account">

                    <div class="info">
                            <div class="profile_page col">
                                <h1 class="text-center profile_page-title profile-page_main_title">
                                    <div class="content-asset content_asset-my_account_profile_page_title">
                                        Tìm kiếm khách hàng
                                    </div> 
                                </h1>
                                <div class="profile-body profile-page_body">
                                    
                                    <form action="searchCustomer" method="post" style="margin-bottom: 100px">
                                        <label>Nhập tài khoản tìm kiếm:</label>
                                        <input type="text" name="username" value="${requestScope.userSearchName}"/>
                                        <input style="border: black;" type="submit" value="Tìm kiếm"/>
                                    </form>
                                    <c:set var="result" value="${requestScope.userSearch}" />
                                    <c:if test="${not empty result}">
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
                                                    <th style="width: 100px;">isActive</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                    <tr>
                                                        <td style="text-align: center;">${result.customerID}</td>
                                                        <td>${result.fullName}</td>
                                                        <td>${result.dateOfBirth}</td>
                                                        <td>${result.gender}</td>
                                                        <td>${result.gmail}</td>
                                                        <td>${result.gmailConfirm}</td>
                                                        <td>${result.phone}</td>
                                                        <td>${result.lastLogin}</td>
                                                        <td>${result.isActive}</td>
                                                    </tr>

                                                
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${empty result}">
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



<%-- 
    Document   : acc
    Created on : Feb 16, 2024, 10:23:28 PM
    Author     : tvanh
--%>

<%@page contentType="text/html" errorPage="error.jsp"  import="model.*" pageEncoding="utf-8" %>
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
                                        Thông tin của tôi
                                    </div> 
                                </h1>
                                <div class="profile-body profile-page_body">
                                    
                                        <div class="">
                                            
                                            <div class="profile_page-details_fields">
                                                <div class="row">
                                                    <div class="col-md-12 col-12 mt-0">
                                                        <div class="form-group required active">
                                                            <label>Họ và tên</label>
                                                            <input type="text" class="form-control" name="fullname" value="${sessionScope.userLogin.fullName}" maxlength="40" readonly>
                                                        </div>
                                                    </div>

                                                    <!--ngày sinh-->
                                                    <div class="col-md-12 col-12 mt-0">
                                                        <div class="form-group required active">
                                                            <label>Ngày sinh</label>
                                                            <input type="text" class="form-control" name="dob" value="${sessionScope.userLogin.dateOfBirth}" maxlength="40" readonly>
                                                        </div>
                                                    </div>
                                                    
                                                    <!--giới tính-->
                                                    <div class="col-md-12 col-12 mt-0">
                                                        <div class="form-group required active">
                                                            <label>Giới tính</label>
                                                            <input type="text" class="form-control" name="dob" value="${sessionScope.userLogin.gender}" maxlength="40" readonly>
                                                        </div>
                                                    </div>
                                                    <!--sdt-->
                                                    <div class="col-md-12 col-12 mt-0">
                                                        <div class="form-group required active">
                                                            <label>Số điện thoại</label>
                                                            <input type="text" class="form-control" name="phone" value="${sessionScope.userLogin.phone}" maxlength="40" readonly>
                                                        </div>
                                                    </div>
                                                    
                                                    <!--email-->
                                                    <div class="col-md-12 col-12 mt-0">
                                                        <div class="form-group required active">
                                                            <label>Gmail</label>
                                                            <input type="text" class="form-control" name="gmail" value="${sessionScope.userLogin.gmail}" maxlength="40" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 col-12 mt-0">
                                                        <c:if test="${sessionScope.userLogin.gmailConfirm==false}">
                                                            <div class="form-group required active">
                                                                Chưa xác nhận gmail! Bấm vào 
                                                                <a><a href="#" target="target" style="color:blue">Đây</a>
                                                                 để xác nhận.   
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>                
                                            <div class="row">
                                                <div class="col-12 d-flex justify-content-center">
                                                    <div class="form-group">
                                                            <a href="update.jsp?id=${sessionScope.userLogin.customerID}"><button class="btn btn-save">Cập nhật thông tin</button></a>
                                                    </div>
                                                </div>
                                            </div>

                                            <style>
                                                .btn-save {
                                                    background-color: #000000; /* Black */
                                                    color: #ffffff; /* White text */
                                                }

                                                .btn-save:hover {
                                                    background-color: #333333; /* Dark gray when hovered */
                                                    color: #ffffff;
                                                }
                                            </style>
                                        </div>
                                </div>
                            </div>

                        </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>


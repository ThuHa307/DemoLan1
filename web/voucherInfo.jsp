<%-- 
    Document   : acc
    Created on : Feb 16, 2024, 10:23:28 PM
    Author     : tvanh
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="model.Voucher" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.TimeZone" %>
<%@page contentType="text/html" errorPage="error.jsp"  import="model.*" pageEncoding="utf-8" %>
<html>
    <head>
        <title>Voucher1</title>

        <link href="//theme.hstatic.net/200000642007/1001190625/14/plugins-css.css?v=97" rel="stylesheet" type="text/css">
        <link href="//theme.hstatic.net/200000642007/1001190625/14/styles.scss.css?v=97" rel="stylesheet" type="text/css">
        <style>
            .coupon_row{
                padding: 20px;
            }
            .coupon .kanan {
                border-left: 1px dashed #ddd;
                width: 40% !important;
                position:relative;
            }

            .coupon .kanan .info::after, .coupon .kanan .info::before {
                content: '';
                position: absolute;
                width: 20px;
                height: 20px;
                background: #dedede;
                border-radius: 100%;
            }
            .coupon .kanan .info::before {
                top: -10px;
                left: -10px;
            }

            .coupon .kanan .info::after {
                bottom: -10px;
                left: -10px;
            }
            .coupon .time {
                font-size: 1.6rem;
            }
        </style>
    </head>
    <body>
        <div style="all: initial;">
            <%@ include file="header.jsp" %>
        </div>



        <div class="layout-main-account">
            <div class="wrapper-account row ">



                <!--leftsite-->
                <div class="sidebar-account col-sm-3">
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
                                <li><a href="#" onclick="showSection(event, 'voucher')">Danh sách Voucher</a></li>
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
                <!--<div class="main-account">-->
                    <!--voucher-->
                    <!--<div class="voucher">-->
                        <form class="col-sm-9" id="voucherForm" action="VoucherInfo" method="get">
                            <button>aaaaaa</button>
                            <c:forEach var="voucher" items="${vouchers}">
                                <c:if test="${(voucher.getVoucherID()) % 2 != 0}">
                                    <div class="row">
                                    </c:if>
                                    <div class="col-sm-6 mt-5">
                                        <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                                            <div class="kiri p-3">
                                                <div class="icon-container ">
                                                    <div class="icon-container_box">
                                                        <img src="https://png.pngtree.com/png-clipart/20201128/ourlarge/pngtree-cartoon-gift-box-png-image_2435956.jpg" width="85" alt="totoprayogo.com"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tengah py-3 d-flex w-100 justify-content-start" >
                                                <div>
                                                    <span class="badge ${voucher.status eq 'Còn' ? 'bg-success' : 'bg-danger'}">${voucher.status}</span>
                                                    <h3 class="fs-5" id="${voucherID}">${voucher.voucherName}</h3>
                                                    <p class="text-muted mb-0">${voucher.description}</p>
                                                </div>
                                            </div>
                                            <div class="kanan" >
                                                <div class="info m-3 d-flex align-items-center">
                                                    <div class="w-100">
                                                        <div class="block">
                                                            <span class="time font-weight-light">
                                                                <h5 class="text-small">End Date ${voucher.endDate}</h5>
                                                            </span>
                                                        </div>
                                                        <a href="" onclick="copyToClipboard('${voucher.voucherName}')" class="btn btn-sm btn-outline-danger btn-block">
                                                            COPPY
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                      
                                    </div>
                                    <script>
                                        function copyToClipboard(text) {
                                            var input = document.createElement('input');
                                            input.setAttribute('value', text);
                                            document.body.appendChild(input);
                                            input.select();
                                            document.execCommand('copy');
                                            document.body.removeChild(input);
                                            alert(text + ' copied to clipboard');
                                        }
                                    </script>                                


                                </c:forEach>

                        </form>

                    <!--</div>-->

                <!--</div>-->
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>


<%-- 
    Document   : checkInfoToPay
    Created on : Mar 1, 2024, 3:02:18 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.Item" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <style>
            body {
                color: #5a5a5a;
            }
            .picture-container {
                max-height: 40px;
                overflow: hidden;
            }
            .picture-container img {
                object-fit: cover;
                width: 100%;
                height: 100%;
            }
            .carousel {
                margin-bottom: 4rem;
            }
            .icon{
                width:50px;
                height:50px;
                margin: 0;
                padding: 0;
            }
            .carousel-caption {
                bottom: 3rem;
                z-index: 10;
                color: white;
                text-shadow: 2px 2px 5px black;
            }
            .carousel-item {
                height: 42rem;
            }
            .carousel-item>img {
                position: absolute;
                top: 0;
                left: 0;
                min-width: 100%;
                height: 42rem;
            }
            .marketing .col-lg-4 {
                margin-bottom: 1.5rem;
                text-align: center;
            }
            .marketing h2 {
                font-weight: 400;
            }

            .marketing .col-lg-4 p {
                margin-right: .75rem;
                margin-left: .75rem;
            }
            .featurette-divider {
                margin: 5rem 0;
            }
            .featurette-heading {
                font-weight: 300;
                line-height: 1;
                letter-spacing: -.05rem;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <c:set var="total" value="${sessionScope.totalprice}"/>
        <main role="main">
            <div class="container mt-4">

                <input type="hidden" name="kh_tendangnhap">

                <div class="py-5 text-center">
                    <h1>Thanh toán</h1>
                    <p class="lead">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>
                </div>

                <div class="row">
                    <div class="col-md-4 order-md-2 mb-4">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Giỏ hàng</span>
                            <c:set var="a" value="${sessionScope.cart}"/>
                        </h4>
                        <ul class="list-group mb-3">
                            <c:forEach items="${a.items}" var="i">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <img class="picture-container" src="${i.product.image}" alt="Ảnh sản phẩm">
                                    </div>
                                    <div>
                                        <h6 class="my-0">${i.product.name}</h6>
                                        <small class="text-muted">${i.price} * ${i.quantity}</small>
                                    </div>
                                    <span class="text-muted">${i.price * i.quantity}</span>
                                </li>
                            </c:forEach>
                            <!--  Hết khúc test -->
                            <form  action="VoucherServlet" method="post">
                                <li class="input-group">
                                    <input type="text" class="form-control" name="VoucherName" placeholder="Mã khuyến mãi">
                                    <div class="input-group-append">
                                        <button id="submitBtn" type="submit" class="btn btn-secondary">Xác nhận</button>
                                    </div>
                                </li>
                            </form>
                            <li class="list-group-item d-flex justify-content-between">
                                <label for="num">Phí Ship:</label>
                                <input type="text" name="ship" value="30.000VND" readonly/>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">

                                <span>Tổng thành tiền</span>
                                <strong>${String.format("%.2f", total)}</strong>
                                <input type="hidden" name="tongtien" value="${String.format("%.2f", total)}"/>
                            </li>
                        </ul>
                    </div>
                    <form class="needs-validation col-md-8" name="frpostmthanhtoan" method="post"  action="CreateOrderServlet" >
                          <h4 class="mb-3">Thông tin khách hàng</h4>

                        <div class="row">
                            <div class="col-md-12">
                                <label for="kh_ten">Họ tên người nhận</label>
                                <input type="text" class="form-control" name="kh_ten" id="kh_ten" value="">
                            </div>
                            <!--                                <div class="col-md-12">
                                                                <label for="kh_gioitinh">Giới tính</label>
                                                                <input type="text" class="form-control" name="kh_gioitinh" id="kh_gioitinh" value="${sessionScope.account.gender}">
                                                            </div>-->
                            <div class="col-md-12">
                                <label for="kh_diachi">Địa chỉ</label>
                                <input type="text" class="form-control" name="kh_diachi" id="kh_diachi">
                            </div>
                            <div class="col-md-12">
                                <label for="kh_dienthoai">Điện thoại</label>
                                <input type="text" class="form-control" name="kh_dienthoai" id="kh_dienthoai" value="">
                            </div>
                            <!--                                <div class="col-md-12">
                                                                <label for="kh_email">Email</label>
                                                                <input type="text" class="form-control" name="kh_email" id="kh_email" value="">
                                                            </div>-->
                            <!--                                <div class="col-md-12">
                                                                <label for="kh_ngaysinh">Ngày sinh</label>
                                                                <input type="text" class="form-control" name="kh_ngaysinh" id="kh_ngaysinh" value="">
                                                            </div>-->
                        </div>

                        <h4 class="mb-3">Hình thức thanh toán</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input" required=""
                                       value="0">
                                <label class="custom-control-label" for="httt-1">Tiền mặt</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required=""
                                       value="1">
                                <label class="custom-control-label" for="httt-2">Chuyển khoản</label>
                            </div>
                        </div>
                        <hr class="mb-4">

                       
                        <input type="hidden" name="totalcost" value="${total}" />
                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnDatHang">Đặt hàng</button>
                    </form>
                    <!--<a href="CreateOrderServlet">Đặt Hàng</a>-->
                </div>
            </div>

        </div>
    </main>
    <%@ include file="footer.jsp" %>
</body>
</html>

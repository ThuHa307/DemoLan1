<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Your Page Title</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="styles.css">
        <style>
            a {
                color: black;
                text-decoration: none !important;
            }
            ul {
                padding: 0;
            }
            li {
                list-style: none;
            }
            body {
                line-height: 1.5;
                font-family: "Poppins", sans-serif;
                -webkit-font-smoothing: antialiased;
            }
            .top-header .container {
                padding-top: 35px;
                padding-bottom: 35px;
                border-bottom: 1px solid #dedede;
            }
            .row {
                align-items: baseline;
            }
            .search {
                padding-left: 15px;
                display: flex;
                align-items: center;
                margin : auto;
                width : 423px;
                height: 50px;
                background-color : white;
                border-radius: 25px;
                -webkit-box-shadow: 0px 10px 38px 0px rgba(0,0,0,0.1);
                -moz-box-shadow: 0px 10px 38px 0px rgba(0,0,0,0.1);
                box-shadow: 0px 2px 10px 0px rgba(0,0,0,0.1);
            }

            .select_area {
                display : flex;
                align-items: center;
                font-family: 'Roboto', sans-serif;
                line-height:24px;
                font-weight : medium ;
            }

            .text {
                padding-left:7px;
            }

            .line {
                margin-left: 10px;
                border-left: 1px solid #D8D8D8;
                height: 25px;
            }

            .search_text {
                width: 100%;
                border: none;
                margin-left : 7px;
                font-size : 14px;
                font-family: 'Roboto', sans-serif;
                line-height:24px;
            }

            ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
                color: #ADB1B8;
            }


            .text_and-icon {
                width: 236px;
                display: flex;
                align-items: center;
            }
            .search_icon {
                color : #adb1b8;
                transition: all .6s ease-in-out;
                -webkit-transition: all .6s ease-in-out; /** Chrome & Safari **/
                -moz-transition: all .6s ease-in-out; /** Firefox **/
                -o-transition: all .6s ease-in-out; /** Opera **/
            }

            .dropdown-menu.show.search-history {
                width: 100%;
            }

            .search_text:focus {
                outline: none !important;
            }

            .search_icon {
                cursor: pointer;
            }

            .search_text:focus + .search_icon{
                color: black;
                transform: translate(55px,0);
                -webkit-transform: translate(55px,0);
                -o-transform: translate(55px,0);
                -moz-transform: translate(55px);
            }
            .btn-auth {
                display: flex;
                justify-content: end;
            }
            .login, .signup {
                border: 1px solid;
                padding: 6px 30px;
                border-radius: 5px;
                margin: 0px 10px;
            }
            .signup {
                background-color: black;
            }
            .signup a {
                color: white;
            }

            .navigation {
                margin-bottom: 0;
                padding: 10px 0;
            }
            .menu-title {
                display: none;
                font-size: 16px;
            }

            .navigation .container {
                position: relative;
            }

            .dropdown {
                padding: 20px 15px;
            }
            .dropdown-menu {
                left: auto;
                right: auto;
                border: none;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                padding: 15px;
                width: max-content;
            }
            .dropdown-menu li > a {
                color: #222;
                font-size: 12px;
                border: 1px solid transparent;
                display: block;
                padding: 8px 16px;
                letter-spacing: 0.5px;
                text-transform: uppercase;
                transition: 0.3s all;
            }
            .dropdown-menu li > a:hover {
                background-color: black;
                color: white;
            }

            ul.navbar-nav.mr-auto {
                display: flex;
                margin: auto;
            }
            div#navbar {
                justify-content: center;
            }
            ul.nav.navbar-nav {
                display: flex;
            }
            .dropdown-menu .divider {
                height: 1px;
                margin: 9px 0;
                overflow: hidden;
                background-color: #e5e5e5;
            }
            .container.navigation {
                display: flex;
                justify-content: center;
            }
            .nav-option {
                margin: 0 15px;
            }

            .search-result {
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
                border-radius: 10px;
            }

            .result-item {
                display: flex;
                align-items: center;
                padding: 10px;
            }

            .result-item:hover {
                background-color: #f8f9fa;
                cursor: pointer;
            }

            .result-item p {
                margin: 0;
                padding-left: 20px;
            }

            .result-item img {
                width: 50px;
            }

            .see-all {
                text-align: center;
                background-color: black;
                padding: 10px;
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
            }

            .see-all a {
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="header-container">
            <section class="top-header">
                <div class="container ">
                    <div class="row">
                        <div class="col-md-4 col-xs-12 col-sm-4">
                            <!-- Search -->
                            <form id="search-form" class="search_box" action="search" method="post">
                                <div class="search">
                                    <div class= "select_area">
                                        <i class="fas fa-tshirt"></i>
                                        <div class="text">Product</div>
                                    </div>

                                    <div class="line"></div>

                                    <div class="text_and-icon" action="search" method="post">
                                        <input type="text" name="search" value="${searchValue}" class="search_text" id="search_text" oninput="onInput()" placeholder="Search by keyword...">
                                        <i class="fas fa-search search_icon" onclick="submitForm()"></i>
                                    </div>
                                </div> 
                                <c:if test="${not empty searchdata}">
                                    <div class="search-result">
                                        <c:forEach var="product" items="${searchdata}">
                                            <a class="result-item" href="viewdetail?productId=${product.id}">
                                                <img src="${product.image}">  
                                                <p>${product.name}</p>                                
                                            </a>
                                        </c:forEach>
                                        <div class="see-all">
                                            <a href="search">Xem tất cả</a>
                                        </div>
                                    </div>                                                                    
                                </c:if>

                            </form>
                        </div>
                        <div class="col-md-4 col-xs-12 col-sm-4">
                            <div class="logo text-center">
                                <a href="index.html">
                                    <!-- replace logo here -->
                                    <svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="40" font-family="AustinBold, Austin" font-weight="bold">
                                    <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                                    <text id="AVIATO">
                                    <tspan x="108.94" y="325">AVIATO</tspan>
                                    </text>
                                    </g>
                                    </g>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-4 col-xs-12 col-sm-4 btn-auth">
                            <c:if test="${sessionScope.userLogin == null}">
                                <div class="login">
                                    <a href="signUpAndIn.jsp">Đăng nhập/Đăng kí</a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.userLogin != null}">
                                <div class="dropdown-center nav-option">
                                    <a href="#!" class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${sessionScope.userLogin.role} - ${sessionScope.userLogin.userName}<span class="tf-ion-ios-arrow-down"></span></a>
                                    <div class="dropdown-menu">
                                        <div class="row">
                                            <div >
                                                <ul>
                                                    <li class="dropdown-header">Chức năng</li>
                                                    <li role="separator" class="divider"></li>
                                                        <c:if test="${sessionScope.userLogin.role eq 'User'}">
                                                        <li><a href="cusInfo.jsp">Hồ sơ User</a></li>
                                                        <li><a href="cart.jsp">Giỏ hàng</a></li>
                                                        <li><a href="CustometOrderServlet">Đơn Hàng</a></li>
                                                        </c:if>
                                                        <c:if test="${sessionScope.userLogin.role eq 'Admin'}">
                                                        <li><a href="adminControlList.jsp">Hồ sơ Admin</a></li>
                                                        <li><a href="ManageOrderServlet">Quản lí đơn hàng</a></li>
                                                        </c:if>
                                                    
                                                    
                                                    <li><a href="#">Đơn hàng</a></li>
                                                    <li><a href="#">Coming soon</a></li>
                                                    <li><a href="logout">Đăng xuất</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
            </section>

            <section class="menu">
                <div class="container navigation">
                    <div class="nav-option">
                        <a href="category">Trang chủ</a>
                    </div>

                    <c:if test="${not empty categories}">
                        <c:set var="mapType" value="${types}"/>
                        <c:forEach var="category" items="${categories}">
                            <c:set var="categoryId" value="${category.id}"/>
                            <div class="dropdown-center nav-option">
                                <a class="dropdown-toggle"  data-bs-toggle="dropdown" aria-expanded="false" href="type?categoryId=${category.id}" >
                                    ${category.name}
                                    <span class="tf-ion-ios-arrow-down"></span>
                                </a>

                                <c:if test="${not empty types}">
                                    <div class="dropdown-menu">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <ul>
                                                    <c:forEach var="type" items="${mapType.get(categoryId)}">
                                                        <li><a href="product?type=${type}">${type}</a></li>
                                                        </c:forEach>    
                                                </ul>
                                            </div>
                                        </div><!-- / .row -->
                                    </div><!-- / .dropdown-menu -->
                                </c:if>


                            </div>
                        </c:forEach>
                    </c:if>

                </div>

            </section>
        </div>       

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>
                                            var timer;
                                            var search = document.querySelector(".search");
                                            var searchResult = document.querySelector(".search-result");
                                            var isVisible = true;
                                            search.addEventListener("click", function () {
                                                if (isVisible) {
                                                    searchResult.style.display = "none";
                                                } else {
                                                    searchResult.style.display = "block";
                                                }
                                                isVisible = !isVisible;
                                            });

                                            function onInput() {
                                                clearTimeout(timer);
                                                timer = setTimeout(submitForm, 2000); // Gọi submitForm sau 5 giây
                                            }

                                            function submitForm() {
                                                document.getElementById("search-form").submit(); // Gửi dữ liệu form đến Servlet
                                            }
        </script>
    </body>
</html>

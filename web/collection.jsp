<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <style>
            p.name {
                min-height: 48px;
            }
            .collection {
                margin-top: 20px;
            }
            .title {
                text-align: center;
                font-weight: 600;
            }
            .actions {
                display: flex;
                justify-content: end;
                margin-right: 25px;
            }
            .sort-opt, .filter-collection {
                padding: 10px 12px 10px 16px;
                border: 1px solid #E8E8E8;
                border-radius: 4px;
                font-size: 14px;
                line-height: 20px;
                font-weight: 400;
                cursor: pointer;
                margin: 0 5px;
            }
            .sort-opt {
                width: 180px;
                background: url(https://file.hstatic.net/200000642007/file/vector_267_8abb48f….svg);
                height: 100%;
            }
            .filter-collection {
                width: 105px;
            }
            .products {
                margin: 20px 0;
            }
            .filter-option {
                margin: 20px 0;
            }
            .filter-title {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .filter-title p {
                font-size: 17px;
                font-weight: 500;
                margin: 0;
            }
            .filter-title.active .arrows-filter svg {
                transform: rotate(180deg);
            }
            .arrows-filter {
                width: 24px;
                height: 24px;
                border-radius: 100%;
                border: 1px solid #E8E8E8;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }
            .mausac ul{
                display: flex;
                flex-wrap: wrap;
            }
            .kichthuoc input,
            .mausac input {
                display: none;
            }
            .mausac input:checked ~ label {
                box-shadow: 0 0 0px 1.5px #000000;
            }
            .mausac li {
                width: calc(100% / 9);
                padding: 0 7.5px;
            }
            .mausac label {
                width: 100%;
                text-align: center;
                cursor: pointer;
                border-radius: 100%;
                /* box-shadow: 0 0 0px 1.5px #FFFFFF; */
                width: 32px;
                height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .mausac span {
                width: 28px;
                height: 28px;
                border-radius: 100%;
                font-size: 0;
                border: 1px solid #ccc4c4;
            }
            .input-filter.active ~ label {
                box-shadow: 0 0 0px 1.5px #000000;
            }
            li label span.den {
                background: #000000;
            }
            li label span.trang {
                background: #ffffff;
            }
            li label span.do {
                background: #ff0000;
            }
            li label span.xam {
                background: #cccaca;
            }
            li label span.xanh-duong {
                background: #5100ff;
            }
            li label span.hong {
                background: #db999b;
            }
            li label span.vang {
                background: #ffff05;
            }
            li label span.tim {
                background: #b5129a;
            }
            li label span.nau {
                background: #753a3a;
            }
            li label span.xanh-la {
                background: #3cfa08;
            }
            li label span.nude {
                background: #dcb49e;
            }
            li label span.cam {
                background: #f5b505;
            }
            .gia,
            .kichthuoc {
                padding: 0 10px;
            }
            .item-filter-size ul {
                display: flex;
                flex-wrap: wrap;
                gap: 5px;
            }
            .item-filter-size ul li input:checked ~ label {
                background: #000;
                border-color: #000;
                color: #FFF;
            }
            .item-filter-size ul li label {
                border: 1px solid #d9d9d9;
                width: 40px;
                height: 40px;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }
            .gia ul {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }
            .gia ul li {
                display: flex;
                align-items: center;
                gap: 8px;
                position: relative;
            }
            .gia ul li input {
                display: block;
            }
            .gia ul li input {
                cursor: pointer;
            }
            input[type="radio"]:before {
                -webkit-transition: -webkit-transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
                -moz-transition: -moz-transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
                transition: transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
                -webkit-transform: rotate(-45deg) scale(0, 0);
                -moz-transform: rotate(-45deg) scale(0, 0);
                -ms-transform: rotate(-45deg) scale(0, 0);
                -o-transform: rotate(-45deg) scale(0, 0);
                transform: rotate(-45deg) scale(0, 0);
                content: "";
                position: absolute;
                left: 1px;
                top: 9px;
                margin: auto;
                z-index: 1;
                width: 10px;
                height: 5px;
                border: 1px solid #fff;
                border-top-style: none;
                border-right-style: none;
            }
            input[type="checkbox"]:after, input[type="radio"]:after {
                content: "";
                position: absolute;
                left: -4px;
                top: 3px;
                margin: auto;
                width: 20px;
                height: 20px;
                background: #fff;
                border: 1px solid #BCBCBC;
                cursor: pointer;
                border-radius: 2px;
            }

            .price-filter.active > input[type="radio"]:after {
                background-color: #2E2E2E;
                border-color: transparent;
            }
            .price-filter.active > input[type="radio"]:before {
                -webkit-transform: rotate(-45deg) scale(1, 1);
                -moz-transform: rotate(-45deg) scale(1, 1);
                -ms-transform: rotate(-45deg) scale(1, 1);
                -o-transform: rotate(-45deg) scale(1, 1);
            }
            input[type="radio"]:checked:after {
                background-color: #2E2E2E;
                border-color: transparent;
            }
            input[type="checkbox"]:checked:before, input[type="radio"]:checked:before {
                -webkit-transform: rotate(-45deg) scale(1, 1);
                -moz-transform: rotate(-45deg) scale(1, 1);
                -ms-transform: rotate(-45deg) scale(1, 1);
                -o-transform: rotate(-45deg) scale(1, 1);
            }
            .pd-row {
                margin: 0 18px !important;
            }
            img {
                height: 388px;
                width: 100%;
            }
            .product {
                padding: 0 5px;
            }
            .product:hover {
                border: 1px solid black;
                cursor: pointer;

            }
            .detail {
                margin: 20px 0;
                text-align: center;
            }

            .size-filter.active ~ label {
                background: #000;
                border-color: #000;
                color: #FFF;
            }

            .page-item.active > a {
                background-color: black;
                border-color: black;
                color: white !important;
            }

            .page-link {
                color: black !important;
            }

            button.btn-view-details {
                width: 100%;
                background-color: black;
                color: white;
                padding: 7px 0;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <% String color = (String) request.getAttribute("color"); %>
        <% String size = (String) request.getAttribute("size"); %>
        <% String selectedValue = (String) request.getAttribute("selectedValue"); %>

        <%@ include file="header.jsp" %>
        <div class="collection">
            <h2 class="title">${type}</h2>
            <c:if test="${flag eq 'true'}">
                <div class="actions">
                    <div class="filter-collection" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                        <span>Bộ lọc</span> 
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12" fill="none"><path d="M1.33325 2.66699H8.83325" stroke="black" stroke-linecap="square"></path><path d="M12.1665 2.66699L14.6665 2.66699" stroke="black" stroke-linecap="square"></path><path d="M7.1665 9.33301L14.6665 9.33301" stroke="black" stroke-linecap="square"></path><path d="M1.33325 9.33301H3.83325" stroke="black" stroke-linecap="square"></path><ellipse cx="5.49992" cy="9.33366" rx="1.66667" ry="1.66667" stroke="black"></ellipse><ellipse cx="10.4999" cy="2.66667" rx="1.66667" ry="1.66667" stroke="black"></ellipse></svg>
                    </div>
                    <!--<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Toggle right offcanvas</button>-->
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasRightLabel">Bộ lọc</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <form action="product" method="post" id="filterForm">
                                <div class="colors filter-option">
                                    <div class="filter-title" data-bs-toggle="collapse" href="#collapseColor" role="button" onclick="handleRotate()">
                                        <p>Màu sắc</p>
                                        <div class="arrows-filter">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="6" viewBox="0 0 10 6" fill="none"><path d="M1 5L4.75 1.25L8.5 5" stroke="black" stroke-width="1.2" stroke-linecap="square"></path></svg>
                                        </div>
                                    </div>
                                    <li><hr class="dropdown-divider"></li>
                                    <div class="collapse content-item-filter mausac" id="collapseColor">
                                        <ul>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "black".equals(color) ? "active" : "" %>" name="filter2" value="black" data-name="Đen" id="filter2-den" ><label for="filter2-den"><span class="den">Đen</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "white".equals(color) ? "active" : "" %>" name="filter2" value="white" data-name="Trắng" id="filter2-trang" ><label for="filter2-trang"><span class="trang">Trắng</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "red".equals(color) ? "active" : "" %>" name="filter2" value="red" data-name="Đỏ" id="filter2-do" ><label for="filter2-do"><span class="do">Đỏ</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "gray".equals(color) ? "active" : "" %>" name="filter2" value="gray" data-name="Xám" id="filter2-xam"><label for="filter2-xam"><span class="xam">Xám</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "blue".equals(color) ? "active" : "" %>" name="filter2" value="blue" data-name="Xanh dương" id="filter2-xanh-duong"><label for="filter2-xanh-duong"><span class="xanh-duong">Xanh dương</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "pink".equals(color) ? "active" : "" %>" name="filter2" value="pink" data-name="Hồng" id="filter2-hong"><label for="filter2-hong"><span class="hong">Hồng</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "yellow".equals(color) ? "active" : "" %>" name="filter2" value="yellow" data-name="Vàng" id="filter2-vang"><label for="filter2-vang"><span class="vang">Vàng</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "purple".equals(color) ? "active" : "" %>" name="filter2" value="purple" data-name="Tím" id="filter2-tim"><label for="filter2-tim"><span class="tim">Tím</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "brown".equals(color) ? "active" : "" %>" name="filter2" value="brown" data-name="Nâu" id="filter2-nau"><label for="filter2-nau"><span class="nau">Nâu</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "green".equals(color) ? "active" : "" %>" name="filter2" value="green" data-name="Xanh lá" id="filter2-xanh-la"><label for="filter2-xanh-la"><span class="xanh-la">Xanh lá</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "nude".equals(color) ? "active" : "" %>" name="filter2" value="nude" data-name="Nude" id="filter2-nude"><label for="filter2-nude"><span class="nude">Nude</span></label></li>
                                            <li><input type="checkbox" onchange="submitIfChecked()" class="input-filter <%= "orange".equals(color) ? "active" : "" %>" name="filter2" value="orange" data-name="Cam" id="filter2-cam"><label for="filter2-cam"><span class="cam">Cam</span></label></li>

                                        </ul>
                                    </div>                    
                                </div>

                                <div class="size filter-option">
                                    <div class="filter-title" data-bs-toggle="collapse" href="#collapseSize" role="button" onclick="handleRotate()">
                                        <p>Kích thước</p>
                                        <div class="arrows-filter">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="6" viewBox="0 0 10 6" fill="none"><path d="M1 5L4.75 1.25L8.5 5" stroke="black" stroke-width="1.2" stroke-linecap="square"></path></svg>
                                        </div>
                                    </div>
                                    <li><hr class="dropdown-divider"></li>
                                    <div class="collapse content-item-filter kichthuoc" id="collapseSize">
                                        <div class="item-filter-size" data-size="1">
                                            <label>Quần áo</label>
                                            <ul>
                                                <li class="item-size-text">
                                                    <input type="checkbox" onchange="submitIfChecked()" class="size-filter <%= "S".equals(size) ? "active" : "" %>" name="filter4" value="S" id="filter4-S">
                                                    <label for="filter4-S"><span>S</span></label>
                                                </li>
                                                <li class="item-size-text">
                                                    <input type="checkbox" onchange="submitIfChecked()" class="size-filter <%= "M".equals(size) ? "active" : "" %>" name="filter4" value="M" id="filter4-M">
                                                    <label for="filter4-M"><span>M</span></label>
                                                </li>
                                                <li class="item-size-text">
                                                    <input type="checkbox" onchange="submitIfChecked()" class="size-filter <%= "L".equals(size) ? "active" : "" %>" name="filter4" value="L" id="filter4-L">
                                                    <label for="filter4-L"><span>L</span></label>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>                    
                                </div>

                                <div class="price filter-option">
                                    <div class="filter-title" data-bs-toggle="collapse" href="#collapsePrice" role="button" onclick="handleRotate()">
                                        <p>Giá</p>
                                        <div class="arrows-filter">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="6" viewBox="0 0 10 6" fill="none"><path d="M1 5L4.75 1.25L8.5 5" stroke="black" stroke-width="1.2" stroke-linecap="square"></path></svg>
                                        </div>
                                    </div>
                                    <li><hr class="dropdown-divider"></li>
                                    <div class="collapse content-item-filter gia" id="collapsePrice">
                                        <ul>
                                            <li class="price-filter <c:out value="${price == 'sm1000000' ? 'active' : ''}" />" >
                                                <input type="radio" onchange="submitIfChecked()" name="filter-price" value="sm1000000" data-price="1000000" id="price-filter-1">
                                                <label for="price-filter-1">Dưới 1,000,000đ</label>
                                            </li>
                                            <li class="price-filter <c:out value="${price == 'bt1000000-2000000' ? 'active' : ''}" />" >
                                                <input type="radio" onchange="submitIfChecked()" name="filter-price" value="bt1000000-2000000" data-price="1000000_2000000" id="price-filter-2">
                                                <label for="price-filter-2">1,000,000đ - 2,000,000đ</label>
                                            </li>
                                            <li class="price-filter <c:out value="${price == 'bt2000000-3000000' ? 'active' : ''}" />" >
                                                <input type="radio" onchange="submitIfChecked()" name="filter-price" value="bt2000000-3000000" data-price="2000000_3000000" id="price-filter-3">
                                                <label for="price-filter-3">2,000,000đ - 3,000,000đ</label>
                                            </li>
                                            <li class="price-filter <c:out value="${price == 'lg3000000' ? 'active' : ''}" />" >
                                                <input type="radio" onchange="submitIfChecked()" name="filter-price" value="lg3000000" data-price="3000000" id="price-filter-4">
                                                <label for="price-filter-4">Trên 3,000,000đ</label>
                                            </li>
                                        </ul>

                                    </div>                    
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="sort">
                        <form action="product" method="post" id="myForm">
                            <select name="price" id="price" class="sort-opt" onclick="hideDefaultOption()" onchange="submitForm()">
                                <option value="">Sắp xếp theo</option>
                                <option value="price-asc">Giá: Tăng dần</option>
                                <option value="price-desc">Giá: Giảm dần</option>
                                <option value="name-asc">Tên: A-Z</option>
                                <option value="name-desc">Tên: Z-A</option>
                                <option value="best-selling">Bán chạy nhất</option>
                                <!--<input class="sort-input" type="submit" value="Confirm"/>-->
                            </select>
                        </form>
                    </div>
                </div>
            </c:if>

            <div class="products">
                <div class="row pd-row">
                    <c:if test="${not empty data}">
                        <c:forEach var="product" items="${data}">
                            <form action="viewdetail" method="get" class="product col-md-3 " id="product-form">
                                <div class="img">
                                    <img src="${product.image}">                
                                </div>
                                <div class="detail">
                                    <p class="name">${product.name}</p>
                                    <div class="price">
                                        <span class="cost">${Product.formatCurrency(product.getPrice())}</span>
                                    </div>
                                </div>
                                <input type="hidden" name="productId" value="${product.id}"/>
                                <button type="submit" class="btn-view-details">Xem chi tiết</button>
                            </form> 
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:set var="isActive" value="active" />
                    <c:set var="isDisabled" value="disabled " />

                    <li class="page-item <c:out value="${page == 1 ? 'disabled' : ''}" />">
                        <a class="page-link" href="product?page=${page - 1}" tabindex="-1">Previous</a>
                    </li>
                    <c:forEach var="i" begin="1" end="${pageCount}">
                        <c:choose>
                            <c:when test="${i == page}">
                                <li class="page-item <c:out value="${isActive}" />">
                                    <a class="page-link " href="">${i}</a></li>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="product?page=${i}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <li class="page-item <c:out value="${page == pageCount ? 'disabled' : ''}" />">
                        <a class="page-link" href="product?page=${page + 1}">Next</a>
                    </li>


                </ul>
            </nav>


        </div>
        <%@ include file="footer.jsp" %>
        
        <script>
            function hideDefaultOption() {
                var selectElement = document.getElementById("price");
                var defaultOption = selectElement.options[0];
                defaultOption.style.display = "none";
            }

            function handleRotate() {
                var e = document.querySelector(".filter-title");
                if (e.classList.contains('active')) {
                    e.classList.remove('active');
                } else {
                    e.classList.add('active');
                }
            }

            function submitForm() {
                document.getElementById('myForm').submit();
            }

            var selectedValue = "<%= selectedValue %>";
            var mySelect = document.getElementById('price');
            var options = mySelect.options;
            for (var i = 0; i < options.length; i++) {
                if (options[i].value === selectedValue) {
                    options[i].selected = true;
                    break;
                }
            }

            function submitIfChecked() {
                var form = document.getElementById('filterForm');
                var checkboxes = form.querySelectorAll('input[type="checkbox"]');
                var radios = form.querySelectorAll('input[type="radio"]');

                // Kiểm tra xem có checkbox nào được chọn hay không
                var isChecked = false;
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        isChecked = true;
                        break;
                    }
                }

                // Kiểm tra xem có radio nào được chọn hay không
                var isRadioChecked = false;
                for (var i = 0; i < radios.length; i++) {
                    if (radios[i].checked) {
                        isRadioChecked = true;
                        break;
                    }
                }

                // Gửi form nếu có checkbox hoặc radio nào được chọn
                if (isChecked || isRadioChecked) {
                    form.submit();
                }
            }
        </script>

    </body>
</html>

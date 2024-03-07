<%-- 
    Document   : cart
    Created on : Feb 17, 2024, 10:34:37 PM
    Author     : tvanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="//theme.hstatic.net/200000642007/1001190625/14/plugins-css.css?v=97" rel="stylesheet">
        <link href="//theme.hstatic.net/200000642007/1001190625/14/styles.scss.css?v=97" rel="stylesheet">
        <style>
            .quantity-item {
                display: flex;
                justify-content: space-between;
                width: 200px;
            }

            .quantity-item button {
                border: none;
                color: black;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
            }

            .quantity-item span {
                align-self: center;
            }

            .modal {
                display: none; /* Ẩn đi mặc định */
                position: fixed; /* Giữ cố định */
                z-index: 1; /* Đặt lên trên cùng */
                left: 0;
                top: 0;
                width: 100%; /* Chiều rộng toàn màn hình */
                height: 100%; /* Chiều cao toàn màn hình */
                overflow: auto; /* Cho phép cuộn nếu cần */
                background-color: rgb(0,0,0); /* Màu nền */
                background-color: rgba(0,0,0,0.4); /* Màu nền có độ mờ */
            }
            /* Phong cách cho nội dung hộp thoại */

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* Cách trên 15% và căn giữa */
                padding: 20px;
                border: 1px solid #888;
                width: 30% !important; /* Giảm chiều rộng xuống còn 30% */
                text-align: right;
            }


            /* Nút đóng hộp thoại */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }



            /* Thiết lập container chứa các nút thành flexbox */
            .swatch-size {
                display: flex;
            }

            /* Thiết lập mỗi nút có kích thước bằng nhau và căn chỉnh chúng */
            .item-swatch {
                flex: 1; /* Mỗi nút sẽ chiếm 1 phần bằng nhau của không gian */
                text-align: center; /* Căn giữa nội dung của nút */
            }

            /* Style cho label */
            .item-swatch label {
                display: block; /* Hiển thị label dưới dạng block để chiếm toàn bộ chiều rộng của nút */
                padding: 5px 0; /* Thêm padding để tăng kích thước và cảm giác click */
                cursor: pointer; /* Hiển thị con trỏ như khi hover vào một liên kết */
                border: 1px solid #ddd; /* Thêm viền cho label */
                margin: 2px; /* Thêm khoảng cách giữa các label */
            }

            /* Ẩn các input radio */
            .item-swatch input[type="radio"] {
                display: none;
            }

            /* Khi input radio được chọn, thay đổi màu của label tương ứng */
            .item-swatch input[type="radio"]:checked + label {
                background-color: black; /* Màu của nút khi được chọn */
                color: #fff;
            }

            /*//---*/
            .swatch-color {
                display: flex;
                justify-content: space-around;
                margin: 10px 0;
            }

            .color-swatch {
                display: block;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                cursor: pointer;
                margin: 5px;
                position: relative; /* Đặt vị trí tương đối để thêm background phía sau */
            }


            .color-swatch label {
                display: block;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                position: relative; /* Đảm bảo label nằm trên cùng */
                z-index: 1; /* Đặt z-index cao hơn để label có thể click được */
                background-size: cover; /* Đảm bảo hình ảnh phủ kín toàn bộ label */
                background-position: center; /* Đảm bảo hình ảnh được căn giữa */
            }


            .color-swatch::before {
                content: '';
                position: absolute;
                top: -5px; /* Điều chỉnh vị trí của background phía sau */
                left: -5px;
                right: -5px;
                bottom: -5px;
                background-color: #fff; /* Màu trắng cho background */
                border-radius: 50%;
                z-index: 0; /* Đảm bảo background nằm dưới label */
            }

            .color-swatch input[type="radio"]:checked + label::after {
                content: '';
                position: absolute;
                top: -10px; /* Điều chỉnh vị trí của viền khi được chọn */
                left: -10px;
                right: -10px;
                bottom: -10px;
                border-radius: 50%;
                border: 2px solid #000; /* Viền màu đen cho nút được chọn */
                z-index: -1; /* Đảm bảo viền nằm dưới background */
            }
            /*---------------*/
            .action-update {
                display: flex;
                justify-content: center;
                padding: 10px;
            }

            .action-update button {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin: 0 5px;
            }

            /* Nút Hủy */
            .action-update button:first-child {
                background-color: #ffffff;
                color: #000000;
            }

            /* Nút Cập nhật */
            .action-update button:last-child {
                background-color: #000000;
                color: #ffffff;

            }

            /* Hiệu ứng khi hover qua nút */
            .action-update button:hover {
                opacity: 0.8;
            }

        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>


        <main>
            <div class="wrapper-cart">
                <div class="container-wrapper-cart">
                    <div class="main-cart">
                        <div class="body-cart">
                            <c:set var="o" value="${sessionScope.cart}" />
                            <c:set var="t" value="0"/>
                            <c:forEach items="${o.items}" var="i">
                                <c:set var="t" value="${t + i.price*i.quantity}" />
                                <div class="item-cart ">
                                    <div class="box-media-item-cart">
                                        <div class="box-media">

                                            <div>
                                                <a
                                                    href="">
                                                    <img src="${i.product.image}"
                                                         alt="${i.product.name}" />
                                                </a>
                                            </div>
                                        </div>
                                        <div class="box-info">
                                            <div class="box-info-inner">
                                                <div class="title-item"><a
                                                        href="">${i.product.name}</a>
                                                </div>
                                                <div class="variant-item">
                                                    ${i.product.color} / ${i.product.size}
                                                </div>
                                                <div class="quantity-item">
                                                    <span>Số lượng</span>
                                                    <button><a href="process?num=-1&id=${i.product.id}">-</a></button>
                                                    <span class="quantity">${i.quantity}</span>
                                                    <button><a href="process?num=1&id=${i.product.id}">+</a></button>
                                                </div>

                                                <div class="price-item">
                                                    <fmt:formatNumber pattern="#,###,###₫" value="${i.price}" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="box-action-item-cart">
                                        <div class="line-box-action">

                                            <a href="updatecart?id=${i.product.id}&idbase=${i.product.id}" class="change-option">Thay đổi</a>
                                            <a href="delecart?id=${i.product.id}" class="delete-option" ">Xóa</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="back-shopping">
                            <a href="home.jsp">Tiếp tục mua sắm</a>
                        </div>
                    </div>
                    <div class="sidebar-cart">
                        <div class="sidebar-cart-inner">
                            <h4>Thông tin Order</h4>
                            <ul>
                                <li>
                                    <label>Tổng tiền</label>
                                    <span class="subtotal-price"><fmt:formatNumber pattern="##,###,###₫" value="${t}"/></span>
                                </li>
                                <li>
                                    <label>Phí ship</label>
                                    <span>-</span>
                                </li>
                            </ul>
                            <div class="total-price-cart">
                                <label>Tổng</label>
                                <span class="total-price"><fmt:formatNumber pattern="##,###,###₫" value="${t}"/></span>
                            </div>
                        </div>
                        <div class="sidebar-cart-action">
                            <form action="ThanhToanServlet" method="post">
                            <button id="process-checkout">Thanh Toán</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Hộp thoại modal -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">×</span>
                    <!-- Nội dung của hộp thoại -->
                    <c:set var="product" value="${product}"></c:set>
                    <c:set var="products" value="${familiar}"></c:set>

                        <div class="info-update-item">
                            <div class="option-update">
                                <div class="swatch-color" data-index="option1">
                                <c:forEach var="p" items="${products}">
                                    <a class="color-swatch" id="color-swatch-link-${p.id}" href="updatecart?id=${p.id}&idbase=${productId}">
                                        <c:choose>
                                            <c:when test="${color == p.color}">
                                                <input type="radio" id="${p.color}" name="color" value="${p.color}" hidden checked onclick="document.getElementById('color-swatch-link-${p.id}').click();">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="radio" id="${p.color}" name="color" value="${p.color}" hidden onclick="document.getElementById('color-swatch-link-${p.id}').click();">
                                            </c:otherwise>
                                        </c:choose>
                                        <label for="${p.color}" style="background-image: url('${p.colorImage}');"></label>
                                    </a>
                                </c:forEach>


                            </div>
                            <div class="swatch-size" data-index="option2">
                                <c:if test="${not empty productSize}">
                                    <c:forEach var="size" items="${productSize}">
                                        <div class="item-swatch">
                                            <input type="radio" id="${size.size}" name="size" value="${size.id}">
                                            <label for="${size.size}">${size.size}</label>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>

                        <div class="action-update">
                            <input type="hidden" value="${productId}">
                            <button onclick="closeModal()">Hủy</button>
                            <button onclick="updateOptions()">Cập nhật</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script>
            // Lấy phần tử modal
            var modal = document.getElementById("myModal");

            // Hàm để mở modal
            function openModal() {
                modal.style.display = "block";
            }

            // Hàm để đóng modal
            function closeModal() {
                modal.style.display = "none";
            }

            // Khi người dùng nhấp vào bất kỳ đâu ngoài modal, đóng nó lại
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            // Gọi hàm openModal khi sự kiện xảy ra
            <% if (request.getAttribute("updatecart") != null) { %>
            openModal();
            <% } %>
        </script>
    </main>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <script>
        alert("<%= request.getAttribute("errorMessage") %>");
    </script>
    <% } %>
    <%@ include file="footer.jsp" %>
</body>
</html>
<script>
    function updateOptions() {
        var size = document.querySelector('input[name="size"]:checked').value;
        window.location.href = 'updatecart1?old=${productId}&new=' + size;
    }
</script>



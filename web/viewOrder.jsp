

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<html>
    <head>
        <title>Hóa đơn</title>
        <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            width: 90%;
            margin: 10px auto;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .row {
            padding: 0 60px;
            text-align: left;
        }
    </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <div class="row" style="padding:0 100px">
        <p>Tên người nhận: ${vorder.nameReceive}</p>
        <p>Số điện thoại: ${vorder.phoneReceive}</p>
        <p>Địa chỉ: ${vorder.address}</p>
        <p>Ngày đặt hàng: ${vorder.orderDate}</p>
        <p>Trạng thái: ${vorder.status}</p>
       <p>Phương thức thanh toán: ${vorder.isPaymentOnline == 'true' ? 'Online' : 'Cash'}</p>
        </div>
        <table>
            <tr>
                <th>Ảnh sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Size</th>
                <th>Màu</th>
                <th>Số lượng</th>
                <th>Giá</th>
            </tr>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>
                        <img src="${item.product.image}" width=20%" alt="alt"/>
                    </td>
                    <td>${item.product.name}</td>
                    <td>${item.product.size}</td>
                    <td>${item.product.color}</td>
                    <td>${item.quantity}</td>
                    <td><fmt:formatNumber value="${item.getPrice()}" type="currency" currencySymbol="VND" /></td>
                </tr>
            </c:forEach>
        </table>
<!--       <p style="padding: 0 60px">Tổng tiền hàng: <fmt:formatNumber value="${vorder.getTotalPrice()}" type="currency" currencySymbol="VND" /></p>-->
<!--        <p>Phí ship: 30.000VND</p>
        <p>Tổng tiền: </p>-->
        <%@ include file="footer.jsp" %>
    </body>
</html>

<%-- 
    Document   : CustomerOrder
    Created on : Mar 5, 2024, 9:53:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            table {
                width: 80%;
                 margin: 0 auto;
                border-collapse: collapse;
            }

            table, th, td {
                border: 1px solid black;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
         <%@ include file="header.jsp" %>
        <h2 style="padding-left: 700px;">Order For Customer</h2>
        <c:set var="order" value="${sessionScope.data}" />
        <table>
            <tr>
                <th>Order ID</th>
                <th>Customer ID</th>
                <th>Address</th>
                <th>Payment Method</th>
                <th>Order Date</th>
                <th>Status</th>
                <th>Total Price</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td>${order.orderID}</td>
                    <td>${order.customerID}</td>
                    <td>${order.address}</td>
                    <td>${order.isPaymentOnline ? 'Online' : 'Cash'}</td>
                    <td>${order.orderDate}</td>
                    <td>${order.status}</td>
                    <td>${order.totalPrice}</td>
                    <td> 
                          <a href="vieworder?orderid=${order.orderID}"><u>Xem chi tiết đơn hàng</u></a>
                    </td>
                </tr>
                 
            </c:forEach>

        </table>
        <div style="margin-top: 10px;">
                    <ul style="list-style: none; padding: 55px;text-align: center;">
                    <c:forEach var="i" begin="1" end="${pageCount}">
                    <c:choose>
                    <c:when test="${i == currentPage}">
                        <li style="margin-right: 5px; padding: 5px; border: 2px solid darkmagenta; display: inline;">
                            <strong>${i}</strong>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li style="margin-right: 5px; padding: 5px; border: 2px solid darkmagenta; display: inline;">
                            <a href="CustometOrderServlet?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    </ul>
        </div>
         <%@ include file="footer.jsp" %>
    </body>
</html>

<%-- 
    Document   : deleteOrder
    Created on : Mar 5, 2024, 2:36:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Delete Order</h2>
        <form action="DeleteOrderServlet" method="post">
            <label for="orderId">Enter Order ID to Delete:</label>
            <input type="text" id="orderId" name="orderId" value="${orderId}">
            <input type="submit" value="Delete">
            <input type="button" value="Back" onclick="javascript:history.go(-1);" />
        </form>
    </body>
</html>

<%-- 
    Document   : updateOrder
    Created on : Mar 5, 2024, 10:39:03 AM
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
        <h2>Update Order Status</h2>
        <form action="UpdateServlet" method="post">
            <div>
                <label>Order ID:</label>
                <input type="text" name="orderId" value="${orderId}" readonly/>
            </div>
            <div>
                <label>Old Status:</label>
                <input type="text" name="oldStatus" value="${oldstatus}" readonly/>
            </div>
            <div>
                <label>New Status:</label>
                <select name="newStatus">
                    <option value="pending">pending</option>
                    <option value="onhold">onhold</option>
                    <option value="process">process</option>
                    <option value="complete">complete</option>
                </select>
            </div>
            <input type="submit" value="Update">
            <input type="button" value="Back" onclick="javascript:history.go(-1);" />
        </form>
    </body>
</html>

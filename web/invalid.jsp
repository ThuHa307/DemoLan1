<%-- 
    Document   : invalid
    Created on : Mar 3, 2024, 10:38:38 PM
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
        <h1>Yêu cầu thất bại</h1>
        <h1>${sessionScope.MSG}</h1>
        <input type="button" value="Back" onclick="javascript:history.go(-1);" />
    </body>
</html>

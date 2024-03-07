<%-- 
    Document   : updatestock
    Created on : Mar 6, 2024, 7:36:31 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updatestock" method="post">
            <input type="hidden" name="id" value="${id}" />
            <label for="quantity">Nhập số lượng: </label>
            <input id="quantity" type="text" name="quantity"/>
            <input type="submit" value="Thêm" />
        </form>
            <a href="updatestock">Trở về</a>
        <c:if test="${state eq true}">
            <h4>Cập nhật thành công</h4>
        </c:if>
        <c:if test="${state eq false}">
            <h4>Cập nhật thất bại</h4>
        </c:if>

    </body>
</html>

<%-- 
    Document   : soldproduct
    Created on : Mar 6, 2024, 6:34:56 PM
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
        <style>
            .container.sold-contianer {
                margin-top: 50px;
            }
            .sold-title {
                text-align: center;
            }
            .sold-product {
                display: flex;
                padding: 20px;
            }

            .sold-product img {
                width: 120px;
            }
            .sold-product-info {
                flex: 2;
                margin-left: 30px;
            }
            .update-stock {
                display: flex;
                align-items: center;
            }
            a.btn-update-stock {
                color: white;
                background-color: black;
                padding: 6px 15px;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container sold-contianer">
            <h3 class="sold-title">Đang hết hàng</h3>
            <c:if test="${not empty searchData}">
                <div class="search-result">
                    <c:forEach var="product" items="${searchData}">
                        <div class="sold-product">
                            <img src="${product.image}"> 
                            <div class="sold-product-info">
                                <strong>${product.name}</strong> 
                                <p>Màu: ${product.color}</p> 
                                <p>Size: ${product.size}</p> 
                            </div>
                            <div class="update-stock">
                                <a class="btn-update-stock" href="updatestock?id=${product.id}">Thêm số lượng</a>  
                            </div>

                        </div>
                    </c:forEach>

                </div>                                                                    
            </c:if>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>

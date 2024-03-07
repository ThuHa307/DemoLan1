<%-- 
    Document   : updateProduct
    Created on : Mar 5, 2024, 11:05:59 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .create-form {
                margin: 50px 400px;
            }
            .create-form h1 {
                text-align: center
            }

            .form-check-label {
                margin-left: 20px;
            }

            .form-check-label img {
                width: 25px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .btn-submit {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <c:set var="product" value="${product}"></c:set>
        <c:set var="color" value="${product.color}"></c:set>
        <div class="create-form">
            <h1>Cập nhật sản phẩm</h1>
            <form action="updateproduct" method="post" class="was-validated" >
                <input type="hidden" name="productId" value="${product.id}"/>
                <div class="row mb-3">
                    <label for="name" class="col-sm-2 col-form-label">Tên sản phẩm</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" id="name" value="${product.name}" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="oriprice" class="col-sm-2 col-form-label">Giá gốc</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="oriprice" id="oriprice" value="${product.oriPrice}" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="price" class="col-sm-2 col-form-label">Giá bán</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="price" id="price" value="${product.price}" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="size" class="col-sm-2 col-form-label">Size</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="size" id="size" value="${product.size}" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="quantity" class="col-sm-2 col-form-label">Số lượng</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="quantity" id="quantity" value="${product.quantity}" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="type" class="col-sm-2 col-form-label">Phân loại</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="type" id="type" value="${product.type}" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="type" class="col-sm-2 col-form-label">Danh mục</label>
                    <div class="col-sm-10">
                        <input class="form-control" list="datalistOptions" name="categoryName" type="text" value="${Category.findName(product.getCategoryId())}" required>
                        <datalist id="datalistOptions">
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.name}">
                            </c:forEach>
                        </datalist>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="image" class="col-sm-2 col-form-label">URL hình ảnh</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="image" id="image" value="${product.image}" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="description" class="col-sm-2 col-form-label">Mô tả sản phẩm</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="description" name="description" rows="3" value="${product.description}"></textarea>
                    </div>

                </div>
                <fieldset class="row mb-3">
                    <legend class="col-form-label col-sm-2 pt-0">Màu sắc</legend>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="black" value="black" <c:if test="${color eq 'black'}">checked</c:if> />
                            <label class="form-check-label" for="black">
                                <img src="https://product.hstatic.net/200000642007/product/icon_50bks_3atsq0141_164a009817154f75a114c93c9193f4f0_808510f3df7e47bc963944d536798041.jpg">
                                <span>Đen</span>
                                <input type="hidden" name="black" value="https://product.hstatic.net/200000642007/product/icon_50bks_3atsq0141_164a009817154f75a114c93c9193f4f0_808510f3df7e47bc963944d536798041.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="blue" value="blue" <c:if test="${color eq 'blue'}">checked</c:if> />
                            <label class="form-check-label" for="blue">
                                <img src="https://product.hstatic.net/200000642007/product/icon_07bll_3atsq0141_dbb585794e384673bdbdcb8b79c23efa_1e071f7d9e234481a1e40fa1d9e0200a.jpg">
                                <span>Xanh dương</span>
                                <input type="hidden" name="blue" value="https://product.hstatic.net/200000642007/product/icon_07bll_3atsq0141_dbb585794e384673bdbdcb8b79c23efa_1e071f7d9e234481a1e40fa1d9e0200a.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="brown" value="brown" <c:if test="${color eq 'brown'}">checked</c:if> />
                            <label class="form-check-label" for="brown">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43bgs_3atsb0534_a7315d590fa34a55ab169ed256230deb_84cd09b74b854cafa702c3815603d80e.jpg">
                                <span>Nâu</span>
                                <input type="hidden" name="brown" value="https://product.hstatic.net/200000642007/product/icon_43bgs_3atsb0534_a7315d590fa34a55ab169ed256230deb_84cd09b74b854cafa702c3815603d80e.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="gray" value="gray" <c:if test="${color eq 'gray'}">checked</c:if> />
                            <label class="form-check-label" for="gray">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43mgs_3atsm0434_cce1e2a88d7d41e49ddaa6bf3423e291_9b79c0e2aecd4fc79895676991728852.jpg">
                                <span>Xám chì</span>
                                <input type="hidden" name="gray" value="https://product.hstatic.net/200000642007/product/icon_43mgs_3atsm0434_cce1e2a88d7d41e49ddaa6bf3423e291_9b79c0e2aecd4fc79895676991728852.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="green" value="green" <c:if test="${color eq 'green'}">checked</c:if>/>
                            <label class="form-check-label" for="green">
                                <img src="https://product.hstatic.net/200000642007/product/icon_07gnl_3atsq0141_331056b4f69d45a3b8893c7916f72175_b7f9d0d7e79d41cd88df9eb613cee8ff.jpg">
                                <span>Xanh lá</span>
                                <input type="hidden" name="green" value="https://product.hstatic.net/200000642007/product/icon_07gnl_3atsq0141_331056b4f69d45a3b8893c7916f72175_b7f9d0d7e79d41cd88df9eb613cee8ff.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="nude" value="nude" <c:if test="${color eq 'nude'}">checked</c:if> />
                            <label class="form-check-label" for="nude">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43sal_3atsm1133_63aae65069434299b3dc2c0b0cbf0a11_e8b616d98b9e45c2b260f3bba1f9d6dd.jpg">
                                <span>Nude</span>
                                <input type="hidden" name="nude" value="https://product.hstatic.net/200000642007/product/icon_43sal_3atsm1133_63aae65069434299b3dc2c0b0cbf0a11_e8b616d98b9e45c2b260f3bba1f9d6dd.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="pink" value="pink" <c:if test="${color eq 'pink'}">checked</c:if> />
                            <label class="form-check-label" for="pink">
                                <img src="https://product.hstatic.net/200000642007/product/icon_50pkl_3atse0334_2ee8f2bd13c6452da4e7c0c08660918e_f2a3c45fd9a943b181260505c4ad7d63.jpg">
                                <span>Hồng</span>
                                <input type="hidden" name="pink" value="https://product.hstatic.net/200000642007/product/icon_50pkl_3atse0334_2ee8f2bd13c6452da4e7c0c08660918e_f2a3c45fd9a943b181260505c4ad7d63.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="red" value="red" <c:if test="${color eq 'red'}">checked</c:if> />
                            <label class="form-check-label" for="red">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43wid_3atsb0134_49885495233d4d61a765134e26f82ad2_210e81cdd26a4bb5b8a242b19311a092.jpg">
                                <span>Đỏ đô</span>
                                <input type="hidden" name="red" value="https://product.hstatic.net/200000642007/product/icon_43wid_3atsb0134_49885495233d4d61a765134e26f82ad2_210e81cdd26a4bb5b8a242b19311a092.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="white" value="white" <c:if test="${color eq 'white'}">checked</c:if> />
                            <label class="form-check-label" for="white">
                                <img src="https://product.hstatic.net/200000642007/product/icon_50crs_3atsq0141_04ea619fe60642378c35c8f732981e46_921bfc475d88436bb0895e8f64b89197.jpg">
                                <span>Trắng tinh khiết</span>
                                <input type="hidden" name="white" value="https://product.hstatic.net/200000642007/product/icon_50crs_3atsq0141_04ea619fe60642378c35c8f732981e46_921bfc475d88436bb0895e8f64b89197.jpg" />
                            </label>
                        </div>
                    </div>
                </fieldset>
                <div class="btn-submit">
                    <button type="submit" class="btn bg-dark text-white">Cập nhật</button>
                </div>

            </form>
        </div>
        
    </body>
</html>

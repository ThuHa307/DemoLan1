<%-- 
    Document   : createProduct
    Created on : Mar 3, 2024, 10:40:22 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <div class="create-form">
            <h1>Tạo sản phẩm mới</h1>
            <form action="createproduct" method="post" class="was-validated" >
                <div class="row mb-3">
                    <label for="name" class="col-sm-2 col-form-label">Tên sản phẩm</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" id="name" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="oriprice" class="col-sm-2 col-form-label">Giá gốc</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="oriprice" id="oriprice" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="price" class="col-sm-2 col-form-label">Giá bán</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="price" id="price" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="size" class="col-sm-2 col-form-label">Size</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="size" id="size" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="quantity" class="col-sm-2 col-form-label">Số lượng</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="quantity" id="quantity" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="type" class="col-sm-2 col-form-label">Phân loại</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="type" id="type" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="type" class="col-sm-2 col-form-label">Danh mục</label>
                    <div class="col-sm-10">
                        <input class="form-control" name="categoryName" list="datalistOptions" id="" required>
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
                        <input type="text" class="form-control" name="image" id="image" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="description" class="col-sm-2 col-form-label">Mô tả sản phẩm</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                    </div>

                </div>
                <fieldset class="row mb-3">
                    <legend class="col-form-label col-sm-2 pt-0">Màu sắc</legend>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="black" value="black" />
                            <label class="form-check-label" for="black">
                                <img src="https://product.hstatic.net/200000642007/product/icon_50bks_3atsq0141_164a009817154f75a114c93c9193f4f0_808510f3df7e47bc963944d536798041.jpg">
                                <span>Đen</span>
                                <input type="hidden" name="black" value="https://product.hstatic.net/200000642007/product/icon_50bks_3atsq0141_164a009817154f75a114c93c9193f4f0_808510f3df7e47bc963944d536798041.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="blue" value="blue" />
                            <label class="form-check-label" for="blue">
                                <img src="https://product.hstatic.net/200000642007/product/icon_07bll_3atsq0141_dbb585794e384673bdbdcb8b79c23efa_1e071f7d9e234481a1e40fa1d9e0200a.jpg">
                                <span>Xanh dương</span>
                                <input type="hidden" name="blue" value="https://product.hstatic.net/200000642007/product/icon_07bll_3atsq0141_dbb585794e384673bdbdcb8b79c23efa_1e071f7d9e234481a1e40fa1d9e0200a.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="brown" value="brown" />
                            <label class="form-check-label" for="brown">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43bgs_3atsb0534_a7315d590fa34a55ab169ed256230deb_84cd09b74b854cafa702c3815603d80e.jpg">
                                <span>Nâu</span>
                                <input type="hidden" name="brown" value="https://product.hstatic.net/200000642007/product/icon_43bgs_3atsb0534_a7315d590fa34a55ab169ed256230deb_84cd09b74b854cafa702c3815603d80e.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="gray" value="gray" />
                            <label class="form-check-label" for="gray">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43mgs_3atsm0434_cce1e2a88d7d41e49ddaa6bf3423e291_9b79c0e2aecd4fc79895676991728852.jpg">
                                <span>Xám chì</span>
                                <input type="hidden" name="gray" value="https://product.hstatic.net/200000642007/product/icon_43mgs_3atsm0434_cce1e2a88d7d41e49ddaa6bf3423e291_9b79c0e2aecd4fc79895676991728852.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="green" value="green" />
                            <label class="form-check-label" for="green">
                                <img src="https://product.hstatic.net/200000642007/product/icon_07gnl_3atsq0141_331056b4f69d45a3b8893c7916f72175_b7f9d0d7e79d41cd88df9eb613cee8ff.jpg">
                                <span>Xanh lá</span>
                                <input type="hidden" name="green" value="https://product.hstatic.net/200000642007/product/icon_07gnl_3atsq0141_331056b4f69d45a3b8893c7916f72175_b7f9d0d7e79d41cd88df9eb613cee8ff.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="nude" value="nude" />
                            <label class="form-check-label" for="nude">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43sal_3atsm1133_63aae65069434299b3dc2c0b0cbf0a11_e8b616d98b9e45c2b260f3bba1f9d6dd.jpg">
                                <span>Nude</span>
                                <input type="hidden" name="nude" value="https://product.hstatic.net/200000642007/product/icon_43sal_3atsm1133_63aae65069434299b3dc2c0b0cbf0a11_e8b616d98b9e45c2b260f3bba1f9d6dd.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="pink" value="pink" />
                            <label class="form-check-label" for="pink">
                                <img src="https://product.hstatic.net/200000642007/product/icon_50pkl_3atse0334_2ee8f2bd13c6452da4e7c0c08660918e_f2a3c45fd9a943b181260505c4ad7d63.jpg">
                                <span>Hồng</span>
                                <input type="hidden" name="pink" value="https://product.hstatic.net/200000642007/product/icon_50pkl_3atse0334_2ee8f2bd13c6452da4e7c0c08660918e_f2a3c45fd9a943b181260505c4ad7d63.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="red" value="red" />
                            <label class="form-check-label" for="red">
                                <img src="https://product.hstatic.net/200000642007/product/icon_43wid_3atsb0134_49885495233d4d61a765134e26f82ad2_210e81cdd26a4bb5b8a242b19311a092.jpg">
                                <span>Đỏ đô</span>
                                <input type="hidden" name="red" value="https://product.hstatic.net/200000642007/product/icon_43wid_3atsb0134_49885495233d4d61a765134e26f82ad2_210e81cdd26a4bb5b8a242b19311a092.jpg" />
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="color" id="white" value="white" />
                            <label class="form-check-label" for="white">
                                <img src="https://product.hstatic.net/200000642007/product/icon_50crs_3atsq0141_04ea619fe60642378c35c8f732981e46_921bfc475d88436bb0895e8f64b89197.jpg">
                                <span>Trắng tinh khiết</span>
                                <input type="hidden" name="white" value="https://product.hstatic.net/200000642007/product/icon_50crs_3atsq0141_04ea619fe60642378c35c8f732981e46_921bfc475d88436bb0895e8f64b89197.jpg" />
                            </label>
                        </div>
                    </div>
                </fieldset>
                <div class="btn-submit">
                    <button type="submit" class="btn bg-dark text-white">Tạo mới</button>
                </div>

            </form>
        </div>
        
    </body>
</html>

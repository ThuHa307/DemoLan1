<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Voucher Shop</title>
        <!-- Custom CSS -->
        <link rel="stylesheet" href="styles.css">
        <style>
            .coupon_row{
                padding: 20px;
            }
            .coupon .kanan {
                border-left: 1px dashed #ddd;
                width: 40% !important;
                position:relative;
            }

            .coupon .kanan .info::after, .coupon .kanan .info::before {
                content: '';
                position: absolute;
                width: 20px;
                height: 20px;
                background: #dedede;
                border-radius: 100%;
            }
            .coupon .kanan .info::before {
                top: -10px;
                left: -10px;
            }

            .coupon .kanan .info::after {
                bottom: -10px;
                left: -10px;
            }
            .coupon .time {
                font-size: 1.6rem;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <section class="container my-5">
            <div class="row coupon_row" >
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhskeaibwww54a" width="85" alt="totoprayogo.com"  />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-success">Còn</span>
                                <h3 class="fs-5">Voucher free ship</h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 20k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>10 ngày</span>
                                        </span>
                                    </div>
                                    <a href="" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFsYiQ-ZVqvM6IO1COXo4zWG32oV82h7c7Y9CNJFZPRgfxB9OPj23hmPRZuzGya8YtCbg&usqp=CAU" width="85" alt="totoprayogo.com" class="" />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-success">Còn</span>
                                <h3 class="fs-5">Voucher free ship </h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 30k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>5 Ngày</span>
                                        </span>
                                    </div>
                                    <a href="https://www.totoprayogo.com" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row coupon_row" >
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhskeaibwww54a" width="85" alt="totoprayogo.com"  />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-danger ">Hết</span>
                                <h3 class="fs-5">Voucher free ship</h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 15k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>10 ngày</span>
                                        </span>
                                    </div>
                                    <a href="" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFsYiQ-ZVqvM6IO1COXo4zWG32oV82h7c7Y9CNJFZPRgfxB9OPj23hmPRZuzGya8YtCbg&usqp=CAU" width="85" alt="totoprayogo.com" class="" />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-success">Còn</span>
                                <h3 class="fs-5">Voucher free ship </h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 30k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>5 Ngày</span>
                                        </span>
                                    </div>
                                    <a href="https://www.totoprayogo.com" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row coupon_row" >
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhskeaibwww54a" width="85" alt="totoprayogo.com"  />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-success">Còn</span>
                                <h3 class="fs-5">Voucher free ship</h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 15k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>10 ngày</span>
                                        </span>
                                    </div>
                                    <a href="" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFsYiQ-ZVqvM6IO1COXo4zWG32oV82h7c7Y9CNJFZPRgfxB9OPj23hmPRZuzGya8YtCbg&usqp=CAU" width="85" alt="totoprayogo.com" class="" />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-success">Còn</span>
                                <h3 class="fs-5">Voucher free ship </h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 30k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>5 Ngày</span>
                                        </span>
                                    </div>
                                    <a href="https://www.totoprayogo.com" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row coupon_row" >
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhskeaibwww54a" width="85" alt="totoprayogo.com"  />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-danger">Hết</span>
                                <h3 class="fs-5">Voucher free ship</h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 15k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>10 ngày</span>
                                        </span>
                                    </div>
                                    <a href="" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                        <div class="kiri p-3">
                            <div class="icon-container ">
                                <div class="icon-container_box">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFsYiQ-ZVqvM6IO1COXo4zWG32oV82h7c7Y9CNJFZPRgfxB9OPj23hmPRZuzGya8YtCbg&usqp=CAU" width="85" alt="totoprayogo.com" class="" />
                                </div>
                            </div>
                        </div>
                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                            <div>
                                <span class="badge bg-danger">Hết</span>
                                <h3 class="fs-5">Voucher free ship </h3>
                                <p class="text-muted mb-0">Giảm giá vận chuyển cực sốc tối đa 30k</p>
                            </div>
                        </div>
                        <div class="kanan">
                            <div class="info m-3 d-flex align-items-center">
                                <div class="w-100">
                                    <div class="block">
                                        <span class="time font-weight-light">
                                            <span>5 Ngày</span>
                                        </span>
                                    </div>
                                    <a href="https://www.totoprayogo.com" target="_blank" class="btn btn-sm btn-outline-danger btn-block">
                                        Nhận
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </body>
</html>

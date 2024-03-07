<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Your Page Title</title>

        <!-- Custom CSS -->
        <link rel="stylesheet" href="styles.css">
        <style>
            html,
            body {
                margin: 0;
                padding: 0;
                height: 100%;
                font-family: "SFU Futura Book" !important;
                overflow-x: hidden;
            }
            .slider {
                display: flex;
                flex-direction: column;
                overflow: hidden;
                height: 40px; /* Đặt chiều cao mong muốn */
                margin: 0;
                padding: 0;
                position: relative; /* Thêm thuộc tính position */
                background-color: rgb(51, 51, 51);
            }

            .slide {
                box-sizing: border-box;
                opacity: 0;
                line-height: 30px; /* Set the line-height to match the height of the slider */
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 100%;
                text-align: center;
                color: #fff;
            }

            .slide:nth-child(1) {
                animation: slide1 15s infinite;
            }
            .slide:nth-child(2) {
                animation: slide2 15s infinite;
            }
            .slide:nth-child(3) {
                animation: slide3 15s infinite;
            }

            @keyframes slide1 {
                0% {
                    opacity: 0;
                }
                8.33% {
                    opacity: 1;
                }
                25% {
                    opacity: 1;
                }
                33.33% {
                    opacity: 0;
                }
                100% {
                    opacity: 0;
                }
            }

            @keyframes slide2 {
                0% {
                    opacity: 0;
                }
                33.33% {
                    opacity: 0;
                }
                41.66% {
                    opacity: 1;
                }
                58.33% {
                    opacity: 1;
                }
                66.66% {
                    opacity: 0;
                }
                100% {
                    opacity: 0;
                }
            }

            @keyframes slide3 {
                0% {
                    opacity: 0;
                }
                66.66% {
                    opacity: 0;
                }
                75% {
                    opacity: 1;
                }
                91.66% {
                    opacity: 1;
                }
                100% {
                    opacity: 0;
                }
            }

            .hidden {
                display: none;
            }


            .banner {
                position: relative;
                height: 100%;
                padding: 0;
                margin: 0;
            }

            .banner_img {
                width: 100%;
                height: auto;
            }

            .banner_text {
                position: absolute;
                top: 50%;
                left: 20%;
                transform: translate(-50%, -50%);
                text-align: center;
                width: 40%;
            }

            .banner_text_title {
                font-size: 26px;
                color: #fff;
            }

            .banner_text_detail {
                font-size: 20px;
                margin-bottom: 4px;
                color: #fff;
            }

            .banner_text_button {
                display: inline-block;
                margin-top: 8px;
                padding: 8px 10px;
                background-color: #575757;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .banner_text_button:hover {
                background-color: #444;
                cursor: pointer;
                color: #fff;

            }

            .scroll {
                width: 100%;
                max-width: 100vw;
                padding: 0;
                margin-right:0;
                overflow: hidden;
                margin-top: 4px;
                position: relative;

            }

            .scroll-container {
                display: flex;
                animation: scroll 15s linear infinite;
                padding: 0;
                margin: 0;
                position: relative;
            }

            .scroll-container:hover{
                animation-play-state: paused;
            }

            .item-list {
                display: flex;
                padding: 0;
                margin: 0;
                list-style: none;
                width: 10000%;
            }

            .item {
                width: calc(100vw / 6);
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                cursor: pointer;
            }

            .item img {
                width: 100%;
                height: auto;
            }

            .item p {
                margin-top: 5px;
                font-size: 14px;
            }


            .item:hover {
                transform: translateY(-8px);
            }

            .container:hover .scroll-container {
                animation-play-state: paused;
            }

            @keyframes scroll {
                0% {
                    transform: translateX(0);
                }

                100% {
                    transform: translateX(calc(-5% * 6));
                }

            }


            #recommendation {
                width: 100%;
                max-width: 100vw;
                padding: 0;
                margin-right:0;
                overflow: hidden;
                margin-top: 4px;
                position: relative;

            }

            #recommendation-scroll {
                display: flex;
                padding: 0;
                margin: 0;
                position: relative;
            }


            .recom-list{
                display: flex;
                padding: 0;
                margin: 0;
                list-style: none;
                width: 10000%;
            }

            .recom-product {
                width: calc(100vw / 4.5);
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                cursor: pointer;
                margin-right: 4px;
                overflow: hidden;
                position: relative;
            }

            .recom-product img {
                width: 100%;
                height: auto;
                transition: transform 0.3s;
            }


        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <section class="all">
        <div class="slider">
            <p class="slide">Đổi trả dễ dàng trong vòng 30 ngày kể từ khi nhận sản phẩm.</p>
            <p class="slide">Xem thêm thông tin về lịch giao hàng ngày Tết & Lễ tình nhân</p>
            <p class="slide">Miễn phí vận chuyển cho khách hàng mới</p>
        </div>
        <div class="banner">
            <img class="banner_img"
                src="https://file.hstatic.net/1000284478/file/cki24_vie_lny_sf2_sbanner_1920x825-8_c150c23120d748cda8b7a8336ff5d408.jpg"
                alt="">
            <div class="banner_text">
                <h1 class="banner_text_title">AVIATO</h1>
                <h2 class="banner_text_detail">ƯỚC CÔ CHO EM 10 ĐIỂM</h2>
            </div>
        </div>
        <div class="scroll" id="scroll">
            <div class="scroll-container" id="scroll-container">
                <ul class="item-list">
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dw51729dbd/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-7-500x667.jpg"
                            alt="Item 1">
                        <p>GIÀY LƯỚI</p>
                    </li>
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwe02ade1a/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-4-500x667.jpg"
                            alt="Item 2">
                        <p>TÚI HOBO DUO</p>
                    </li>
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwb5757d2e/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-3-500x667.jpg"
                            alt="Item 3">
                        <p>HÀNG MỚI</p>
                    </li>
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dw1fe68c40/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-5-500x667.jpg"
                            alt="Item 4">
                        <p>TÚI ĐEO VAI</p>
                    </li>
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwdaa1a039/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-6-500x667.jpg"
                            alt="Item 5">
                        <p>GIÀY CAO GÓT</p>
                    </li>
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dw00fdb3c0/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-8-500x667.jpg"
                            alt="Item 6">
                        <p>TÚI XÁCH</p>
                    </li>
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwb770db1a/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-1-500x667.jpg"
                            alt="Item 7">
                        <p>GIAY</p>
                    </li>
                    <li class="item">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwe74472a7/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-2-500x667.jpg"
                            alt="Item 8">
                        <p>TÚI ĐEO VAI</p>
                    </li>
                </ul>
            </div>
        </div>
        <script>
            const container = document.getElementById('scroll');
            const content = document.getElementById('scroll-container');
            
            let isScrolling = false;
            
            container.addEventListener('mousedown', function (event) {
                isScrolling = true;
                startX = event.pageX - container.offsetLeft;
                scrollLeft = container.scrollLeft;
            });
            
            container.addEventListener('mouseleave', function () {
                isScrolling = false;
            });
            
            container.addEventListener('mouseup', function () {
                isScrolling = false;
            });
            
            container.addEventListener('mousemove', function (event) {
                if (!isScrolling) return;
                event.preventDefault();
                const x = event.pageX - container.offsetLeft;
                const walk = (x - startX) * 3; // Adjust scrolling speed
                container.scrollLeft = scrollLeft - walk;
            });
        </script>
        <div class="wrapper">
            <div class="row mt-0">
                <div class="position-relative col-md-6 p-1">
                    <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dw483d30ba/images/homepage/2024/Charleskeith_home_A5_week6-1000x1250.jpg" alt="Image" class="img-fluid">
                    <div  class="position-absolute bottom-0 start-0 text-white " style="margin-left: 25px; margin-bottom: 12px;">
                        <p style="margin-bottom: 0px; font-size: 20px ; color: #ffff;">BST CHET LO</p>
                        <a href=""  style="color: #ffff;">Sắp ra mắt</a>
                    </div>
                </div>
                <div class="position-relative col-md-6 p-1">
                    <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dw41ced1c6/images/homepage/2024/Charleskeith_home_A6_week6-1000x1250.jpg" alt="Image" class="img-fluid">
                    <div  class="position-absolute bottom-0 start-0 text-white " style="margin-left: 25px; margin-bottom: 12px;">
                        <p style="margin-bottom: 0px; font-size: 20px ; color: #4b4545;">BST TÙM LUM</p>
                        <a href=""  style="color: #504747;">Sắp ra mắtt</a>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="position-relative col-md-6 p-1">
                    <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwc082f551/images/homepage/2024/Charleskeith_home_A3_week6-1000x1250.jpg" alt="Image" class="img-fluid">
                    <div  class="position-absolute bottom-0 start-0 text-white " style="margin-left: 25px; margin-bottom: 12px;">
                        <p style="margin-bottom: 0px; font-size: 20px ; color: #242222;">BST MÙA ĐÔNG</p>
                        <a href=""  style="color: #3a3838;">Sắp ra mắt</a>
                    </div>
                </div>
                <div class="position-relative col-md-6 p-1">
                    <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwfd143b3c/images/homepage/2024/Charleskeith_home_A4_week6-1000x1250.jpg" alt="Image" class="img-fluid">
                    <div  class="position-absolute bottom-0 start-0 text-white " style="margin-left: 25px; margin-bottom: 12px;">
                        <p style="margin-bottom: 0px; font-size: 20px ; color: #251515;">BST MÙA THU</p>
                        <a href=""  style="color: #361e1e;">Sắp ra mắt</a>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="position-relative col-md-6 p-1">
                    <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dw7854f22e/images/homepage/2024/Charleskeith_home_A11_week6-1000x1250.jpg" alt="Image" class="img-fluid">
                    <div  class="position-absolute bottom-0 start-0 text-white " style="margin-left: 25px; margin-bottom: 12px;">
                        <p style="margin-bottom: 0px; font-size: 20px ; color: #242222;">BST MÙA XUÂN</p>
                        <a href=""  style="color: #242222;">Sắp ra mắt</a>
                    </div>
                </div>
                <div class="position-relative col-md-6 p-1">
                    <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwb532f7c7/images/homepage/2024/Charleskeith_home_A2_week6-1000x1250.jpg" alt="Image" class="img-fluid">
                    <div  class="position-absolute bottom-0 start-0 text-white " style="margin-left: 25px; margin-bottom: 12px;">
                        <p style="margin-bottom: 0px; font-size: 20px ; color: #242222;">BST MÙA HẠ</p>
                        <a href=""  style="color: #242222;">Sắp ra mắt</a>
                    </div>
                </div>
            </div>        
        </div>
        <h1 style="margin-bottom: 15px; margin-top: 30px; font-size: 20px; margin-inline-start: 30px; text-transform: uppercase;font-weight: 700;">Gợi ý dành cho bạn</h1>
        <div  id="recommendation">
            <div  id="recommendation-scroll">
                <ul class="recom-list">
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-vn-products/default/dwabdc0d0f/images/hi-res/2024-L2-CK1-70360153-41-1.jpg?sw=456&sh=608" alt="Item 7">
                        <p>GIAY</p>
                    </li>
                    
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-vn-products/default/dw91fb37d1/images/hi-res/2023-L3-CK2-30782111-05-1.jpg?sw=456&sh=608"
                            alt="Item 2">
                        <p>TÚI HOBO DUO</p>
                    </li>
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-vn-products/default/dwb218b19f/images/hi-res/2024-L2-CK2-50701377-24-1.jpg?sw=456&sh=608"
                            alt="Item 3">
                        <p>HÀNG MỚI</p>
                    </li>
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-vn-products/default/dw57b73bbd/images/hi-res/2024-L2-CK1-70900504-B5-1.jpg?sw=456&sh=608"
                            alt="Item 4">
                        <p>TÚI ĐEO VAI</p>
                    </li>
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-vn-products/default/dw1d75b32b/images/hi-res/2024-L2-CK2-30782297-1-D1-1.jpg?sw=456&sh=608"
                            alt="Item 5">
                        <p>GIÀY CAO GÓT</p>
                    </li>
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-vn-products/default/dw4ac3cb07/images/hi-res/2023-L6-CK1-70920137-41-1.jpg?sw=456&sh=608"
                            alt="Item 6">
                        <p>TÚI XÁCH</p>
                    </li>
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-vn-products/default/dw2c59f64c/images/hi-res/2024-L2-CK6-80701376-09-1.jpg?sw=456&sh=608"
                            alt="Item 7">
                        <p>GIAY</p>
                    </li>
                    <li class="recom-product">
                        <img src="https://www.charleskeith.vn/on/demandware.static/-/Library-Sites-CharlesKeithVN/default/dwe74472a7/images/homepage/2024/CharlesKeith_OurPopularCategories_week6-2-500x667.jpg"
                            alt="Item 8">
                        <p>TÚI ĐEO VAI</p>
                    </li>
                </ul>
            </div>
        </section>
        <%@ include file="footer.jsp" %>
        <script>
            const recommendation = document.getElementById('recommendation');
            const recom = document.getElementById('recommendation-scroll');
            
            let isScroll = false;
            
            recommendation.addEventListener('mousedown', function (event) {
                isScroll = true;
                startX = event.pageX - recommendation.offsetLeft;
                scrollLeft = recommendation.scrollLeft;
            });
            
            recommendation.addEventListener('mouseleave', function () {
                isScroll = false;
            });
            
            recommendation.addEventListener('mouseup', function () {
                isScroll = false;
            });
            
            recommendation.addEventListener('mousemove', function (event) {
                if (!isScroll) return;
                event.preventDefault();
                const x = event.pageX - recommendation.offsetLeft;
                const walk = (x - startX) * 3; // Adjust scrolling speed
                recommendation.scrollLeft = scrollLeft - walk;
            });
        </script>
    </div>
        
    </body>
</html>

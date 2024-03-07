<%-- 
    Document   : signUpAndIn
    Created on : Feb 18, 2024, 1:15:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cus" class="model.Customer" scope="session" />
<jsp:setProperty name="cus" property = "*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập/Đăng kí</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
           @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

            * {
                box-sizing: border-box;
            }

            body {
                background: #f6f5f7;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                font-family: 'Montserrat', sans-serif;
                height: 100vh;
                margin: -20px 0 50px;
            }

            h1 {
                font-weight: bold;
                margin: 0;
            }

            h2 {
                text-align: center;
            }

            p {
                font-size: 14px;
                font-weight: 100;
                line-height: 20px;
                letter-spacing: 0.5px;
                margin: 20px 0 30px;
            }

            span {
                font-size: 12px;
            }

            a {
                color: #333;
                font-size: 14px;
                text-decoration: none;
                margin: 15px 0;
            }

            button {
                border-radius: 20px;
                border: 1px solid #070707;
                background-color: #070707;
                color: #FFFFFF;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
            }

            button:active {
                transform: scale(0.95);
            }

            button:focus {
                outline: none;
            }

            button.ghost {
                background-color: transparent;
                border-color: #FFFFFF;
            }

            form {
                background-color: #FFFFFF;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 50px;
                height: 100%;
                text-align: center;
            }

            input {
                background-color: #eee;
                border: none;
                padding: 12px 15px;
                margin: 8px 0;
                width: 100%;
            }
            .input-container {
                display: flex;
                gap: 30px;
            }
            .input-container input {
                width: 100%;
            }
            .container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
                    0 10px 10px rgba(0, 0, 0, 0.22);
                position: relative;
                overflow: hidden;
                width: 768px;
                max-width: 100%;
                min-height: 580px;
            }

            .form-container {
                position: absolute;
                top: 0;
                height: 100%;
                transition: all 0.6s ease-in-out;
            }

            .sign-in-container {
                left: 0;
                width: 50%;
                z-index: 2;
            }

            .container.right-panel-active .sign-in-container {
                transform: translateX(100%);
            }

            .sign-up-container {
                left: 0;
                width: 50%;
                opacity: 0;
                z-index: 1;
            }

            .container.right-panel-active .sign-up-container {
                transform: translateX(100%);
                opacity: 1;
                z-index: 5;
                animation: show 0.6s;
            }

            @keyframes show {

                0%,
                49.99% {
                    opacity: 0;
                    z-index: 1;
                }

                50%,
                100% {
                    opacity: 1;
                    z-index: 5;
                }
            }

            .overlay-container {
                position: absolute;
                top: 0;
                left: 50%;
                width: 50%;
                height: 100%;
                overflow: hidden;
                transition: transform 0.6s ease-in-out;
                z-index: 100;
            }

            .container.right-panel-active .overlay-container {
                transform: translateX(-100%);
            }

            .overlay {
                background: #0a0a0a;
                background: -webkit-linear-gradient(to right, #0e0e0e, #282626);
                background: linear-gradient(to right, #0e0d0d, #2d2829);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: 0 0;
                color: #FFFFFF;
                position: relative;
                left: -100%;
                height: 100%;
                width: 200%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .container.right-panel-active .overlay {
                transform: translateX(50%);
            }

            .overlay-panel {
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 40px;
                text-align: center;
                top: 0;
                height: 100%;
                width: 50%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .overlay-left {
                transform: translateX(-20%);
            }

            .container.right-panel-active .overlay-left {
                transform: translateX(0);
            }

            .overlay-right {
                right: 0;
                transform: translateX(0);
            }

            .container.right-panel-active .overlay-right {
                transform: translateX(20%);
            }

            .social-container {
                margin: 20px 0;
            }

            .social-container a {
                border: 1px solid #DDDDDD;
                border-radius: 50%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                margin: 0 5px;
                height: 40px;
                width: 40px;
            }
            .remember-checkbox {
                display: inline-block;
                vertical-align: middle;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="addCustomer" method="post">
                    <h1>Đăng kí</h1>
<!--                    <div class="social-container">
                        <a href="#" class="social"><i class="fa-brands fa-google"></i></i></a>
                    </div>-->
                    <span>hoặc đăng kí với tài khoản mới</span>
                    <input type="text" placeholder="Tài khoản" name="username" value="${cus.userName}" required/>
                    <input type="password" placeholder="Mật khẩu" name="password" value="${cus.password}" required/>
                    <input type="text" placeholder="Họ tên" name="name" value="${cus.fullName}" required/>
                    <div class="input-container">
                        <label><input name="gender" type="radio" value="Nam" /> Nam</label>
                        <label><input name="gender" type="radio" value="Nữ" /> Nữ</label>
                        <label><input name="gender" type="radio" value="Khác" /> Khác</label>
                    </div>
                    <input type="text" placeholder="Ngày sinh" name="dob" value="${cus.dateOfBirth}" required/>
                    <input type="text" placeholder="Số điện thoại" name="sdt" value="${cus.phone}" required/>
                    <input type="email" placeholder="Mail" name="gmail" value="${cus.gmail}" required/>
                    <div class="g-recaptcha" data-sitekey="6LeN-Y4pAAAAAMObadZMC6-qer0j_HozIrAmpK21"></div>
                    <div id="error"></div>
                    <button>Đăng kí</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Đăng nhập</h1>
                    <div class="social-container">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:9999/aviato-clothes-shop/logingoogle&response_type=code&client_id=141126111888-g1ghkkh04bubd1c17cnlbmfijjlqlrl8.apps.googleusercontent.com&approval_prompt=force" class="social"><i class="fa-brands fa-google"></i></a>
                    </div>
                    <span>hoặc đăng nhập với tài khoản của bạn</span>
                    <input type="text" placeholder="Tài khoản" name="username" value="${userR}" required/>
                    <input type="password" placeholder="Mật khẩu" name="password" value="${passR}" required/>
                    <input type="checkbox" name="remember" value="1" class="remember-checkbox"/>Ghi nhớ đăng nhập
                    <a href="#">Quên mật khẩu?</a>
                    <button type="submit">
                        Đăng nhập
                    </button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Mừng trở lại!</h1>
                        <p>Để duy trì kết nối với chúng tôi vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
                        <button class="ghost" id="signIn">Đăng nhập</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Xin chào!</h1>
                        <p>Nhập thông tin cá nhân của bạn và bắt đầu hành trình với chúng tôi</p>
                        <button class="ghost" id="signUp">Đăng kí</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');

            signUpButton.addEventListener('click', () => {
                container.classList.add('right-panel-active');
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove('right-panel-active');
            });
        </script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
                window.onload = function (){
                        let isValid = false;
                        const form = document.getElementById("form");
                        const error = document.getElementById("error");
				
                        form.addEventListener("submit", function (event){
                                event.preventDefault();
                                const response = grecaptcha.getResponse();
                                if (response){
                                        form.submit();
                                } else {
                                        error.innerHTML = "Please check";
                                }
                        });
                }
        </script>
    </body>
</html>

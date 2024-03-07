<%-- 
    Document   : contact
    Created on : Feb 23, 2024, 4:07:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.emailjs.com/dist/email.min.js"></script>
        <script>
            emailjs.init("7TqwrCCIQ9tjL4zQm"); //account public key
        </script>

        <style>
            .page-header {
                background:#f5f5f5;
                margin-top:20px;
                border-bottom:none;
                padding:30px 0;
                h1 {
                    font-weight:200;
                    margin:0 0 6px 0;
                }
                .breadcrumb {
                    background:transparent;
                    padding:5px;
                    margin:0;
                    li {
                        font-weight:200;
                        font-size:12px;
                        a {
                            color:black;
                        }
                    }
                }
            }
            .breadcrumb>li+li:before {
                padding: 0 5px;
                color: #ccc;
                content: "/\00a0"
            }

            .breadcrumb>.active {
                color: #777
            }

            .contact-us {
                padding: 100px 0;
            }
            .contact{
                align-items: flex-start;
            }
            .contact-form{
                width: 50%;
            }
            .contact-details{
                width: 50%;
            }

            .contact-form {
                margin-bottom: 40px;
            }

            .contact-form .form-control {
                background-color: transparent;
                border: 1px solid #dedede;
                box-shadow: none;
                height: 45px !important;
                color: #0c0c0c;
                height: 38px;
                font-family: 'Open Sans', sans-serif;
                font-size: 14px;
                border-radius: 0;
                margin-top: 20px;
                margin-bottom: 10px;
            }
            .contact-form input:hover,
            .contact-form textarea:hover,
            .contact-form #contact-submit:hover {
                border-color: #000;
            }

            .contact-form #contact-submit {
                border: none;
                padding: 15px 0;
                width: 100%;
                margin: 0;
                background: #000;
                color: #fff;
                border-radius: 0;
            }

            .contact-form textarea.form-control {
                padding: 10px;
                height: 120px !important;
                outline: none;
            }
            .contact-details .google-map img{
                max-width: 100%;
                height: auto;
                display: flex;
                margin-bottom: 40px;
                margin-top: 20px;
            }
            .contact-details .contact-short-info {
                margin-top: 20px;
            }

            .contact-details .contact-short-info li {
                margin-bottom: 6px;
                color: #555;
                font-weight: 300;
            }

            .contact-details .contact-short-info li i {
                margin-right: 10px;
            }
            .error {
                display: none;
                padding: 10px;
                color: #D8000C;
                border-radius: 4px;
                font-size: 13px;
                background-color: #FFBABA;
            }

            .success {
                background-color: #6cb670;
                border-radius: 4px;
                color: #fff;
                display: none;
                font-size: 13px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <!--contact-->
        <section>
            <section class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="content">
                                <h1 class="page-name">Contact Us</h1>
                                <ol class="breadcrumb">
                                    <li><a href="home.jsp">Home</a></li>
                                    <li class="active">contact</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="page-wrapper">
                <div class="contact-section">
                    <div class="container">
                        <div class="contact row">
                            <!-- Contact Form -->
                            <div class="contact-form col-md-6 " >
                                <form id="contact-form" method="post" action="orderProcessing.jsp" role="form">

                                    <div class="form-group">
                                        <input type="text" placeholder="Your Name" class="form-control" name="name" id="sendername">
                                    </div>

                                    <div class="form-group">
                                        <input type="email" placeholder="Your Email" class="form-control" name="email" id="senderemail">
                                    </div>

                                    <div class="form-group">
                                        <input type="text" placeholder="Subject" class="form-control" name="subject" id="subject">
                                    </div>

                                    <div class="form-group">
                                        <textarea rows="6" placeholder="Message" class="form-control" name="message" id="message"></textarea>	
                                    </div>

                                    <div id="replyto" class="success">
                                        <!--Thank you. The Mailman is on His Way :)-->
                                    </div>
<!--
                                    <div id="mail-fail" class="error">
                                        Sorry, don't know what happened. Try later :(
                                    </div>-->

                                    <div class="form-group" id="cf-submit">
                                        <button onclick="sendMessage();">Submit</button>
                                        <!--<input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit">-->
                                    </div>						

                                </form>
                            </div>
                            <!-- ./End Contact Form -->

                            <!-- Contact Details -->
                            <div class="contact-details col-md-6 " >
                                <div class="google-map">
                                    <img src="assets/img/cart/anhcamon.jpg" alt="">
                                </div><!--
                                -->                         </div>
                        </div>
                    </div> <!-- end container -->
                </div>
            </section>
        </section>
        <script>
            function sendMessage() {
                var serviceID = "service_u1zhe36"; //email service id
                var templateID = "template_jwum60d"; // email template id
                var params = {
                    sendername: document.querySelector("#sendername").value,
                    senderemail: document.querySelector("#senderemail").value,
                    subject: document.querySelector("#subject").value,
                    message: document.querySelector("#message").value
                };
                emailjs.send(serviceID, templateID, params)
                        .then(res => {
                            alert('Thank you, ' + params['sendername'] + '! Your message has been sent.');
                        })
                        .catch(error => {
                            console.error('Error sending email:', error);
                        });
            }
        </script>
        <!--footer-->
        <%@ include file="footer.jsp" %>
    </body>
</html>


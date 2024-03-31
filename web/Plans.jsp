<%-- 
    Document   : ForgotPass
    Created on : 14 May, 2023, 2:22:39 AM
    Author     : Niladri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose Plan</title>

        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap">

        <link rel="icon" href="LOGO/palette_icon.png">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            html {
                font-size: 62.5%;
                overflow-x: hidden;
            }
            body {
                overflow-x: hidden;
                height: 100vh;
                background-image: url('LOGO/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            /*Login Popup*/
            .login-popup{
                width: 100%;
                height: 100vh;
                position: absolute;
                background-image: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8));
                backdrop-filter: blur(5px);
                position: fixed;
            }
            .form-box{
                width: 1000px;
                height: 620px;
                position: relative;
                margin: 6% auto;
                background: black;
                padding: 5px;
                border-radius: 10px;
                overflow: hidden;
            }
            .form-box i{
                position: absolute;
                cursor: pointer;
                margin-top: 10px;
                margin-left: 955px;
            }
            .head{
                color: white;
                font-size: 30px;
                font-weight: 600;
                display: block;
                width: 100%;
                margin: auto;
                text-align: center;
                margin-top: 30px;
            }
            .plan1, .plan2, .plan3{
                position: absolute;
                width: 250px;
                height: 300px;
                border: 2px solid white;
                border-radius: 10px;
                margin: 65px 0 0 50px;
            }
            .plan2{
                margin-left: 370px;
            }
            .plan3{
                margin-left: 690px;
            }
            .plan1.active, .plan2.active, .plan3.active{
                border: 2px solid red;
            }
            .plan-name{
                position: absolute;
                color: white;
                font-size: 25px;
                font-weight: 600;
                margin: 10px 92px;
            }
            .banner-line1,.banner-line2, .banner-line3{
                margin-top: 50px;
                border-top: 1px;
            }
            .banner-line1.active, .banner-line2.active, .banner-line3.active{
                border-color: red;
            }
            .continue-btn{
                font-size: 22px;
                font-weight: 700;
                width: 100%;
                padding: 10px 30px;
                cursor: pointer;
                display: block;
                margin: auto;
                background: red;
                color: white;
                border-radius: 30px;
                border: 0;
                outline: none;
                margin-top: 70px;
            }
            .plan-content{
                padding: 30px 25px;
                line-height: 50px;
            }
            .tick{
                color: white;
                font-size: 22px;
            }
            .plan-content-lines{
                color: white;
                font-size: 18px;
            }
            .plan-choose{
                position: absolute;
                width: 99%;
                animation: .8s slide-left;
            }
            @keyframes slide-left{
                from{
                    margin-left: 100%;
                }
                to{
                    margin-left: 0%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-popup">
                <div class="form-box">
                    <i class="fa-solid fa-xmark fa-3x" style="color: #ffffff;"></i>
                    <form class="plan-choose" method="post" action="http://localhost:8080/com.palette/substocard">
                        <a class="head">Please Choose a Plan</a>
                        <div class="plan1" id="plan1">
                            <a class="plan-name">₹249</a>
                            <hr class="banner-line1">
                            <div class="plan-content">
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">Validity : 3 Months</span><br>
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">No of Devices : 3</span><br>
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">No of Streams : 2</span><br>
                            </div>
                            <button type="submit" class="continue-btn" name="btn" value="A">Continue</button>
                        </div>
                        <div class="plan2" id="plan2">
                            <a class="plan-name">₹449</a>
                            <hr class="banner-line2">
                            <div class="plan-content">
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">Validity : 6 Months</span><br>
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">No of Devices : 5</span><br>
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">No of Streams : 3</span><br>
                            </div>
                            <button type="submit" class="continue-btn" name="btn" value="B">Continue</button>
                        </div>
                        <div class="plan3" id="plan3">
                            <a class="plan-name">₹799</a>
                            <hr class="banner-line3">
                            <div class="plan-content">
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">Validity : 1 Year</span><br>
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">No of Devices : 7</span><br>
                                <a class="tick">&check;  </a>
                                <span class="plan-content-lines">No of Streams : 5</span><br>
                            </div>
                            <button type="submit" class="continue-btn" name="btn" value="C">Continue</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script>
            // Close button
            document.querySelector(".fa-xmark").addEventListener("click", function () {
                window.location.href = ("http://localhost:8080/com.palette/LandingPage.jsp");
            });

            // Plan choose
            document.querySelector(".plan1").addEventListener("click", function () {
                document.querySelector(".plan1").classList.add("active");
                document.querySelector(".plan2").classList.remove("active");
                document.querySelector(".plan3").classList.remove("active");
                document.querySelector(".banner-line1").classList.add("active");
                document.querySelector(".banner-line2").classList.remove("active");
                document.querySelector(".banner-line3").classList.remove("active");
                
            });
            document.querySelector(".plan2").addEventListener("click", function () {
                document.querySelector(".plan1").classList.remove("active");
                document.querySelector(".plan2").classList.add("active");
                document.querySelector(".plan3").classList.remove("active");
                document.querySelector(".banner-line1").classList.remove("active");
                document.querySelector(".banner-line2").classList.add("active");
                document.querySelector(".banner-line3").classList.remove("active");
            });
            document.querySelector(".plan3").addEventListener("click", function () {
                document.querySelector(".plan1").classList.remove("active");
                document.querySelector(".plan2").classList.remove("active");
                document.querySelector(".plan3").classList.add("active");
                document.querySelector(".banner-line1").classList.remove("active");
                document.querySelector(".banner-line2").classList.remove("active");
                document.querySelector(".banner-line3").classList.add("active");
            });
        </script>
    </body>
</html>

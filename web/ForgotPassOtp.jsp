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
        <title>Verify OTP</title>

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
                width: 520px;
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
                margin-left: 478px;
            }
            .button-box{
                width: 300px;
                margin: 50px auto;
                position: relative;
                border-radius: 30px;
            }
            .toggle-btn{
                padding: 10px 30px;
                font-size: 22px;
                font-weight: 700;
                background: transparent;
                border: 0;
                outline: none;
                position: relative;
                color: white;
            }
            .li{
                cursor: pointer;
            }
            #top-btn{
                top: 0;
                left: 0px;
                position: absolute;
                width: 130px;
                height: 100%;
                background: red;
                border-radius: 30px;
                transition: .5s;
            }
            .input-group{
                top: 175px;
                width: 430px;
                position: absolute;
                transition: .5s;
            }
            .input-field{
                width: 100%;
                padding: 10px 0;
                margin: 12px 0;
                border-left: 0;
                border-right: 0;
                border-top: 0;
                border-bottom: 1px solid white;
                outline: none;
                background: transparent;
                color: white;
                font-size: 20px;
            }
            .check-box-rem{
                margin: 40px 10px 30px 0;
            }
            .check-box-term{
                margin: 40px 10px 30px 0;
            }
            .rem{
                cursor: pointer;
                color: white;
                font-size: 18px;
            }
            .fpass{
                cursor: pointer;
                color: #1a79ca;
                font-size: 18px;
                margin-left: 103px;
            }
            .term{
                cursor: pointer;
                color: white;
                font-size: 18px;
            }
            .login-btn, .register-btn{
                font-size: 22px;
                font-weight: 700;
                width: 85%;
                padding: 10px 30px;
                cursor: pointer;
                display: block;
                margin: auto;
                background: red;
                color: white;
                border-radius: 30px;
                border: 0;
                outline: none;
            }
            .login-btn{
                margin-top: 70px;
            }
            .register-btn{
                margin-top: 30px;
            }
            .rg{
                top: 120px;
            }
            .num::-webkit-outer-spin-button,
            .num::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            .otp-head{
                color: white;
                font-size: 23px;
                font-weight: 500;
                width: 430px;
            }
            .otp-mid{
                color: white;
                font-size: 15px;
            }
            #login{
                left: 50px;
            }
            #register{
                position: absolute;
                left: 550px;
            }
            #after-clicked{
                width: 100%;
                position: absolute;
                top: 80px;
                left: 42px;
            }
            .toggle-btn su{
                cursor: copy;
            }
            .input-group{
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
        <input type="hidden" id="passchangeotp" value="<%= request.getAttribute("passchangeotp")%>">
        <div class="container">
            <div class="login-popup">
                <div class="form-box">
                    <i class="fa-solid fa-xmark fa-3x" style="color: #ffffff;"></i>
                    <div class="button-box">
                        <div id="top-btn"></div>
                        <input type="button" class="toggle-btn li" value="Log In">
                        <input type="button" class="toggle-btn" value="Sign Up">
                    </div>
                    <form id="verify" class="input-group rg" method="post" action="http://localhost:8080/com.palette/fpassotp">
                        <div id="after-clicked">
                            <a class="otp-head">Confirm OTP</a><br><br>
                            <a class="otp-mid">Please enter one-time-password sent to your email</a><br><br><br>
                            <input type="number" name="entOtp" class="input-field num" placeholder="Enter OTP" required><br><br>

                            <input type="submit" id="otp" class="register-btn" value="Submit OTP">
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
            
            // Swal function
            var status = document.getElementById("passchangeotp").value;
            if (status === "passchangewrongotp") {
                swal("Sorry", "You have entered wrong OTP!", "error");
            }
        </script>
    </body>
</html>

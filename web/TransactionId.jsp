<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="LOGO/palette_icon.png">
        <title>Redirecting...</title>
        <style>
            body{
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container{
                width: 1000px;
                height: 500px;
                box-shadow: 5px 5px 10px 10px rgba(0, 0, 0, 0.15);
                margin-top: 150px;
                text-align: center;
            }
            .loader{
                display: inline-block;
                position: relative;
                width: 80px;
                height: 80px;
            }
            .loader span{
                position: absolute;
                top: 75px;
                width: 13px;
                height: 13px;
                border-radius: 50%;
                animation-timing-function: cubic-bezier(0, 1, 1, 0);
            }
            .loader span:nth-child(1){
                left: 15%;
                animation: loader 1s infinite;
                background: #eb4335;
                box-shadow: 0 0 10px #eb4335, 0 0 30px #eb4335;
            }
            .loader span:nth-child(2){
                left: 40%;
                animation: loader 1s 0.2s infinite;
                background: #fbbc05;
                box-shadow: 0 0 10px #fbbc05, 0 0 30px #fbbc05;
            }
            .loader span:nth-child(3){
                left: 65%;
                animation: loader 1s 0.4s infinite;
                background: #34a853;
                box-shadow: 0 0 10px #34a853, 0 0 30px #34a853;
            }
            .loader span:nth-child(4){
                left: 90%;
                animation: loader 1s 0.6s infinite;
                background: #4285f4;
                box-shadow: 0 0 10px #4285f4, 0 0 30px #4285f4;
            }
            @keyframes loader{
                0%{
                    transform: scale(0.5);
                }
                50%{
                    transform: scale(2);
                }
                100%{
                    transform: scale(0.5);
                }
            }
        </style>
    </head>
    <body>
        <%HttpSession hpt = request.getSession();%>
        <div class="container">
            <div class="loader">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
            <br><br><br>
            <h1>Processing your payment....</h1>
            <br>
            <h3>Transaction Id: </h3><%=hpt.getAttribute("tid").toString()%>
            <br><br><br><br><br><br>
            <h3>Do not close or refresh this window!</h3>
        </div>
    </body>
    <%response.setHeader("Refresh", "7; url=http://localhost:8080/com.palette/register");%>
</html>

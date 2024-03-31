<%-- 
    Document   : HelpUs
    Created on : May 18, 2023, 8:03:01 PM
    Author     : samra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HelpUs</title>
        <link rel="stylesheet" href="HelpUs.css">
    </head>
    <body>
        <p id="help">Help Us</p>
        <div class="header">
            <!--<input id="search" type="text" placeholder="What do you need help with?">-->
        </div>
        <div id="mid">
        <p id="heading">Sign in for personalized help</p>
        <button id="signin">SIGN IN</button>
        <button id="join">JOIN PALETTE</button>
            <div id="mid-bottom">
                <p id="popular">Popular Topics</p>
                <a id="topics1" href="http://localhost:8080/PALETTE/CasualPages/firstL1.jsp">How to sign up for Palette </a>
                <a id="topics2" href="http://localhost:8080/PALETTE/CasualPages/firstL3.jsp">Plans and Pricing </a>
                <a id="topics3" href="http://localhost:8080/PALETTE/CasualPages/thirdL1.jsp">Can't sign in to Palette </a>
            </div>
        </div>
        <div class="bottom">
            <div class="first">
                <p id="started">Getting Started</p>
                <a href="http://localhost:8080/PALETTE/CasualPages/firstL1.jsp" id='quick'>How to sign up for Palette?</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/firstL2.jsp" id='quick'>What is Palette?</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/firstL3.jsp" id='quick'>Plans and Pricing</a>
            </div>
            <div class="second">
                <p id="started">Can't Watch</p>
                <a href="http://localhost:8080/PALETTE/CasualPages/secondL1.html" id='quick'>How to change your account password?</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/secondL2.html" id='quick'>Palette says to sign up when trying to sign in</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/secondL3.html" id='quick'>Palette says,'This site is not compatible with your device'.</a>
            </div>
            <div class="third">
                <p id="started">Manage My Account</p>
                <a href="http://localhost:8080/PALETTE/CasualPages/thirdL1.jsp" id='quick'>Can't sign in to Palette</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/thirdL2.jsp" id='quick'>How to restart your Palette account</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/thirdL3.jsp" id='quick'>Palette account email was changed without permission</a>
                
            </div>
            <div class="fourth">
                <p id="started">Watching Palette</p>
                <a href="http://localhost:8080/PALETTE/CasualPages/fourthL1.html" id='quick'>What devices can I use to stream Palette?</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/fourthL2.html" id='quick'>How to watch Palette on your TV</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/fourthL3.html" id='quick'>How to download titles to watch offline</a>
            </div>
            <div class="fifth">
                <p id="started">Quick Links</p>
                <a href="http://localhost:8080/PALETTE/ForgotPass.jsp" id='quick'>Reset password</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/MyAccount.jsp" id='quick'>Update email</a>
                <br><br>
                <a href="http://localhost:8080/PALETTE/CasualPages/req.html" id='quick'>Request TV shows or movies</a>
            </div>
        </div>
        
    </body>
</html>

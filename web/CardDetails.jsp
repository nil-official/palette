<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Payment</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap">

        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="CSS/CardDetails.css">

    </head>
    <body>
        <%HttpSession newsess = request.getSession();%>
        <div class="background">
            <img src="LOGO/background.jpg">
        </div>
        <div class="container">

            <div class="card-container">

                <div class="front">
                    <div class="image">
                        <img src="LOGO/silver-chip.png" alt="" style="padding: 5px;">
                        <img id="network" src="" alt="">
                    </div>
                    <div class="card-number-box">################</div>
                    <div class="flexbox">
                        <div class="box">
                            <span>Cardholder Name</span>
                            <div class="card-holder-name">Full Name</div>
                        </div>
                        <div class="box">
                            <span>Expiry</span>
                            <div class="expiration">
                                <span class="exp-month">MM</span>
                                <span class="exp-year">YYYY</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="back">
                    <div class="stripe"></div>
                    <div class="box">
                        <span>CVV</span>
                        <div class="cvv-box"></div>
                        <!--<img src="LOGO/visa-logo.jpg" alt="">-->
                    </div>
                </div>

            </div>

            <form method="post" action="http://localhost:8080/com.palette/gentid" onsubmit="return validate()">
                <div class="inputBox">
                    <span>Card Number</span>
                    <input type="number" id="cardno" maxlength="16" class="card-number-input" placeholder="Enter card number" onkeydown="clearcard()">
                    <span id="errcardno" style="color:red;font-size:100%"></span>
                </div>
                <div class="inputBox">
                    <span>Cardholder Name</span>
                    <input type="text" id="cardname" class="card-holder-input" placeholder="Enter cardholder name" onkeydown="clearname()">
                    <span id="errcardname" style="color:red;font-size:100%"></span>
                </div>
                <div class="flexbox">
                    <div class="inputBox">
                        <span>Expiry Month</span>
                        <select name="" id="cardmonth" class="month-input" onclick="clearmonth()">
                            <option value="Month" selected disabled>Month</option>
                            <option value="01">01</option>
                            <option value="02">02</option>
                            <option value="03">03</option>
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <span id="errcardmonth" style="color:red;font-size:100%"></span>
                    </div>
                    <div class="inputBox">
                        <span>Expiry Year</span>
                        <select name="" id="cardyear" class="year-input" onclick="clearyear()">
                            <option value="Year" selected disabled>Year</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                            <option value="2029">2029</option>
                            <option value="2030">2030</option>
                            <option value="2030">2031</option>
                        </select>
                        <span id="errcardyear" style="color:red;font-size:100%"></span>
                    </div>
                    <div class="inputBox">
                        <span>CVV</span>
                        <input type="text" id="cardcvv" maxlength="3" class="cvv-input" placeholder="CVV" onkeydown="clearcvv()">
                        <span id="errcardcvv" style="color:red;font-size:100%"></span>
                    </div>
                </div>
                <input type="submit" value="Pay Now <%=newsess.getAttribute("cost").toString()%>" class="submit-btn">
                
            </form>
             

        </div>    

        <script>
            // Dynamic Card Details
            document.querySelector('.card-number-input').oninput = () => {
                document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
            };
            document.querySelector('.card-holder-input').oninput = () => {
                document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
            };
            document.querySelector('.month-input').oninput = () => {
                document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
            };
            document.querySelector('.year-input').oninput = () => {
                document.querySelector('.exp-year').innerText = document.querySelector('.year-input').value;
            };
            document.querySelector('.cvv-input').onmouseenter = () => {
                document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
                document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
            };
            document.querySelector('.cvv-input').onmouseleave = () => {
                document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
                document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
            };
            document.querySelector('.cvv-input').oninput = () => {
                document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
            };
            
            // Card Details Validation
            function validate(){
                var cardno = document.getElementById("cardno").value;
                var cardname = document.getElementById("cardname").value;
                var cardmonth = document.getElementById("cardmonth").value;
                var cardyear = document.getElementById("cardyear").value;
                var cardcvv = document.getElementById("cardcvv").value;
                const num = cardno;
                const first = String(num)[0];
                
                // Card number validation
                if(cardno === ""){
                    errcardno.innerHTML = "Card Number can't be blank!";
                    return false;
                }
                if(cardno.length !== 16){
                    errcardno.innerHTML = "Invalid card number!";
                    return false;
                }
//                // Name validation
                if(cardname === ""){
                    errcardname.innerHTML = "Cardholder Name can't be blank!";
                    return false;
                }
                // Month validation
                if(cardmonth === "Month"){
                    errcardmonth.innerHTML = "Please select!";
                    return false;
                }
                // Year validation
                if(cardyear === "Year"){
                    errcardyear.innerHTML = "Please select!";
                    return false;
                }
                // Cvv validation
                if(cardcvv === ""){
                    errcardcvv.innerHTML = "Please fill!";
                    return false;
                }
                if(cardcvv.length !== 3){
                    errcardcvv.innerHTML = "Invalid cvv!";
                    return false;
                }
                return true;
            }
            
            // Clearing functions
            function clearcard(){
                var cardno = document.getElementById("cardno").value;
                const num = cardno;
                const first = String(num)[0];
                if(first === "5"){
                    document.getElementById("network").src = "LOGO/mc.png";
                }
                if(first === "6" || first === "8"){
                    document.getElementById("network").src = "LOGO/rupay3.png";
                }
                if(first === "4"){
                    document.getElementById("network").src = "LOGO/visa-logo.jpg";
                }
                errcardno.innerHTML = "";
            }
            function clearname(){
                errcardname.innerHTML = "";
            }
            function clearmonth(){
                errcardmonth.innerHTML = "";
            }
            function clearyear(){
                errcardyear.innerHTML = "";
            }
            function clearcvv(){
                errcardcvv.innerHTML = "";
            }
        </script>
    </body>
</html>
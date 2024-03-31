<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="CSS/LandingPage.css">
        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <title>Palette</title>
    </head>
    <body>
        <input type="hidden" id="regstatus" value="<%= request.getAttribute("regstatus")%>">
        <input type="hidden" id="logstatus" value="<%= request.getAttribute("logstatus")%>">
        <input type="hidden" id="passchange" value="<%= request.getAttribute("passchange")%>">
        <input type="hidden" id="logout" value="<%= request.getParameter("logout")%>">
        <input type="hidden" id="nologin" value="<%= request.getParameter("restrict")%>">
        <header>
            <div class="container">
                <div class="navigation flex">
                    <div class="logo">
                        <img src="LOGO/pallete_nav.png" alt="">
                    </div>

                    <div class="navbar flex" id="navbar">
                        <div class="left-nav flex">
                            <ul class="flex menu">
                                <li class="menu-items"><a href="testHOME.jsp" class="home">Home</a></li>
                                <li class="menu-items"><a href="testMOVIE.jsp" class="movie">Movies</a></li>
                                <li class="menu-items"><a href="testTVS.jsp" class="tvs">TV Shows</a></li>
                            </ul>
                        </div>

                        <div class="right-nav flex">
                            <div class="search_user">
                                <input type="text" placeholder="Search..." id="search_input"> 
                                <div class="search">
                                    <a href="#" class="card">
                                        <img src="img/the boys.jpg" alt="">
                                        <div class="cont">
                                            <h3>The Boys</h3>
                                            <p>Action, 2021 , <span>IMDB</span><i class="bi bi-star-fill"></i>9.6</p>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <span class="login-admin">
                                <i id="admin-btn" class="fa-solid fa-user-tie fa-2x" style="color: #ffffff;"></i>
                            </span>

                            <span class="login">
                                <button id="login-btn" class="login-btn"><a href="#">Login</a></button>
                            </span>
                        </div>
                    </div>
                    <div class="mobile-nav-btn">
                        <ion-icon class="mobile-nav-icon" name="menu-outline"></ion-icon>
                        <ion-icon class="mobile-nav-icon" name="close-outline"></ion-icon>
                    </div>


                </div>


                <div class="login-popup-admin">
                    <div class="form-box">
                        <i class="fa-solid fa-xmark fa-2x close-btn" style="color: #ffffff;"></i>
                        <div class="button-box">
                            <div id="top-btn2"></div>
                            <input type="button" class="toggle-btn2" value="Log In">
                        </div>
                        <form id="login2" class="input-group" method="POST" action="loginadmin">
                            <input name="aEmail" type="text" class="input-field" placeholder="Enter id" required><br><br><br><br>
                            <input name="aPassword" type="password" class="input-field" placeholder="Enter password" required>
                            <br>
                            <input type="submit" class="login-button" value="Log In">
                        </form>
                    </div>
                </div>



                <div class="login-popup">
                    <div class="form-box">
                        <i class="fa-solid fa-xmark fa-2x close-btn-login" style="color: #ffffff;"></i>
                        <div class="button-box">
                            <div id="top-btn"></div>
                            <input type="button" class="toggle-btn" value="Log In" onclick="login()">
                            <input type="button" class="toggle-btn" value="Sign Up" onclick="register()">
                        </div>
                        <form id="login" class="input-group" method="POST" action="login">
                            <input id="setEmail" name="lEmail" type="email" class="input-field" placeholder="Enter email" required><br><br>
                            <input name="lPassword" type="password" class="input-field" placeholder="Enter password" required>

                            <input type="checkbox" id="checkbox-rem" class="check-box-rem" style="visibility: hidden"><label style="visibility: hidden" for="checkbox-rem" class="rem">Remember me</label>
                            <a href="ForgotPass.jsp" class="fpass">Forgot password?</a>

                            <input type="submit" class="login-button" value="Log In">
                        </form>
                        <form id="register" class="input-group rg" method="post" action="otp" onsubmit="return confirm()">
                            <input name="rName" type="text" class="input-field" id="xname" placeholder="Enter name" required>
                            <input name="rEmail" type="email" class="input-field" id="xemail" placeholder="Enter email" required>
                            <input name="rPassword" type="password" class="input-field" id="xpassword" placeholder="Create password" onkeydown="passclear()">
                            <span id="errpass" style="color: red; font-size: 100%;"></span>
                            <input type="text" class="input-field" id="xcpassword" placeholder="Confirm password" onkeydown="cpassclear()">
                            <span id="errcpass" style="color: red; font-size: 100%;"></span><br>
                            <input type="checkbox" id="checkbox-term" class="check-box-term" required><label for="checkbox-term" class="term">I agree to the terms & condition</label>

                            <input type="submit" name="sendotp" class="register-btn" value="Get OTP">
                        </form>
                    </div>
                </div>


            </div>
            <!-- <video src="video/kS.mp4" id="video" autoplay loop muted></video> -->
            <main class="slider">

                <div class="mySlides fade">
                    <button class="playbtn" onclick="loginfirst()"><span class="fa fa-play play" aria-hidden="true"></span>Play</button>
                    <!--<a  class="watch" onclick="loginfirst()" >Watch Now</a>-->
                    <video class="slide" src="VIDEOS/inter.mp4" autoplay muted  width="95%" height="500px"></video>
                </div>
                <div class="mySlides fade">
                    <button class="playbtn" onclick="loginfirst()"><span class="fa fa-play play" aria-hidden="true"></span>Play</button>
                    <!--<a  class="watch" onclick="loginfirst()" >Watch Now</a>-->
                    <video class="slide" src="VIDEOS/brahmastra.mp4" autoplay muted  width="100%" height="500px"></video>
                </div>
                <div class="mySlides fade">
                    <button class="playbtn" onclick="loginfirst()"><span class="fa fa-play play" aria-hidden="true"></span>Play</button>
                    <!--<a  class="watch" onclick="loginfirst()" >Watch Now</a>-->
                    <video class="slide" src="VIDEOS/nowayhome.mp4" autoplay muted  width="95%" height="500px"></video>
                </div>
                <div class="mySlides fade">
                    <button class="playbtn" onclick="loginfirst()"><span class="fa fa-play play" aria-hidden="true"></span>Play</button>
                    <!--<a  class="watch" onclick="loginfirst()">Watch Now</a>-->
                    <video class="slide" src="VIDEOS/pathaan.mp4" autoplay muted  width="100%" height="500px"></video>
                </div>
                <div class="mySlides fade">
                    <button class="playbtn" onclick="loginfirst()"><span class="fa fa-play play" aria-hidden="true"></span>Play</button>
                    <!--<a  class="watch" onclick="loginfirst()">Watch Now</a>-->
                    <video class="slide" src="VIDEOS/shershaah.mp4" autoplay muted></video>
                </div>

                <a class="prev" onclick="prevSlide()"><i class="fa-solid fa-angle-left fa-2x" style="color: #ffffff;"></i></a>
                <a class="next" onclick="showSlides()"><i class="fa-solid fa-angle-right fa-2x" style="color: #ffffff;"></i></a>
            </main><br>
            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span> 
                <span class="dot" onclick="currentSlide(4)"></span>
                <span class="dot" onclick="currentSlide(5)"></span>
            </div>

            <section class="sec_1">
                <h3>Trending</h3>
                <i class="bi bi-chevron-left"></i>
                <i class="bi bi-chevron-right"></i>
                <div class="cards" id="cards">
                </div>
            </section>
            <section class="sec_2">
                <h3>Top 10</h3>
                <i class="bi bi-chevron-left" id="left_button"></i>
                <i class="bi bi-chevron-right" id="right_button"></i>
                <div class="cards_2">
                </div>
            </section>
            <section class="sec_3" id="sec_3">
                <h3>Latest Releases</h3>
                <i class="bi bi-chevron-left" id="l_button"></i>
                <i class="bi bi-chevron-right" id="r_button"></i>
                <div class="cards_3">
                </div>
            </section>
        </header>
        <div class="footer">
            <a class="footlinks" href="http://localhost:8080/PALETTE/LandingPage.jsp">Home</a>
            <a class="footlinks" href="http://localhost:8080/PALETTE/CasualPages/firstL3.jsp">Pricing</a>
            <a class="footlinks" href="http://localhost:8080/PALETTE/CasualPages/HelpUs.jsp">FAQs</a>
            <a class="footlinks" href="http://localhost:8080/PALETTE/CasualPages/About_us.jsp">About Us</a>
            <a class="footlinks" href="http://localhost:8080/PALETTE/CasualPages/HelpUs.jsp">Help Us</a>
            <br><br>
            <hr style="border:1px solid gray; margin-left: 20px; margin-right: 20px">
            <br>
            <p class="copyright">© 2023 Palette, Inc</p>
        </div>
        <script>
            function getQueryParam(name) {
                name = name.replace(/[\[\]]/g, "\\$&");
                var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                    results = regex.exec(window.location.href);
                if (!results)
                    return null;
                if (!results[2])
                    return '';
                return decodeURIComponent(results[2].replace(/\+/g, " "));
            }
            var email = getQueryParam('email');
            if (email) {
                document.getElementById('setEmail').value = email;
                document.querySelector(".login-popup").classList.add("active");
            }
        </script>
        <script src="JS/restricted.js"></script>
        <script>
                    var timeOut = 2000;
                    var slideIndex = 0;
                    var autoOn = true;
                    showSlides(slideIndex);

                    function currentSlide(n) {
                        showSlides(slideIndex === n);
                    }

                    autoSlides();

                    function autoSlides() {
                        timeOut = timeOut - 20;

                        if (autoOn === true && timeOut < 0) {
                            showSlides();
                        }
                        setTimeout(autoSlides, 50);
                    }

                    function prevSlide() {

                        timeOut = 2000;

                        var slides = document.getElementsByClassName("mySlides");
                        var dots = document.getElementsByClassName("dot");

                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                            dots[i].className = dots[i].className.replace(" active", "");
                        }
                        slideIndex--;

                        if (slideIndex > slides.length) {
                            slideIndex = 1;
                        }
                        if (slideIndex === 0) {
                            slideIndex = 5;
                        }
                        slides[slideIndex - 1].style.display = "block";
                        dots[slideIndex - 1].className += " active";
                    }

                    function showSlides() {

                        timeOut = 2000;

                        var slides = document.getElementsByClassName("mySlides");
                        var dots = document.getElementsByClassName("dot");

                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                            dots[i].className = dots[i].className.replace(" active", "");
                        }
                        slideIndex++;

                        if (slideIndex > slides.length) {
                            slideIndex = 1;
                        }
                        slides[slideIndex - 1].style.display = "block";
                        dots[slideIndex - 1].className += " active";
                    }


                    //Login Button
                    document.querySelector("#login-btn").addEventListener("click", function () {
                        document.querySelector(".login-popup").classList.add("active");
                    });
                    document.querySelector(".close-btn-login").addEventListener("click", function () {
                        document.querySelector(".login-popup").classList.remove("active");
                    });
                    // Admin login
                    document.querySelector("#admin-btn").addEventListener("click", function () {
                        document.querySelector(".login-popup-admin").classList.add("active");
                    });
                    document.querySelector(".close-btn").addEventListener("click", function () {
                        document.querySelector(".login-popup-admin").classList.remove("active");
                    });

                    // Toggle Login/Signup
                    var log = document.getElementById("login");
                    var reg = document.getElementById("register");
                    var tbtn = document.getElementById("top-btn");
                    function register() {
//                            log.style.display = "none";
                        log.style.left = "-450px";
                        reg.style.left = "50px";
                        tbtn.style.left = "143px";
                    }
                    function login() {
                        log.style.left = "50px";
                        reg.style.left = "550px";
                        tbtn.style.left = "0";
                    }


        </script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script>
                    var s1 = document.getElementById("regstatus").value;
                    if (s1 === "success") {
                        swal("Congrats", "Account Created Successfully!", "success");
                    } else if (s1 === "failed") {
                        swal("Sorry", "Registration Failed!", "error");
                    }

                    var s2 = document.getElementById("logstatus").value;
                    if (s2 === "failed") {
                        swal("Sorry", "Wrong Username or Password!", "error");
                    }

                    var s3 = document.getElementById("passchange").value;
                    if (s3 === "passchangesuccess") {
                        swal("Congrats", "Password Changed Successfully!", "success");
                    } else if (s3 === "passchangefailed") {
                        swal("Sorry", "Password Change Failed!!", "error");
                    }

                    var s9 = document.getElementById("logout").value;
                    if (s9 === "success") {
                        swal("Congrats", "You have been logged out!", "success");
                    }

                    var s8 = document.getElementById("nologin").value;
                    if (s8 === "no") {
                        swal("Sorry", "Please login first!", "error");
                        
                    } else {
                    }

                    function loginfirst() {
                        swal("Sorry", "Please login first!", "error");
                    }
        </script>
        <script>
            function confirm() {
                var el = document.getElementById("xpassword").value;
                var epl = document.getElementById("xcpassword").value;
//                var passPatt = /^(?=.\d)(?=.[a-z])(?=.[A-Z])(?=.[^a-zA-Z0-9])(?!.*\s).{8,20}$/;
                if (el === "") {
                    errpass.innerHTML = "Password cannot be blank";
                    return false;
                }
//                if (!el.match(passPatt))
//                {
//                    errpass.innerHTML = "Invalid Password";
//                    return false;
//                }
                if (epl === "") {
                    errcpass.innerHTML = "Password cannot be blank";
                    return false;
                }
                if (epl !== el) {
                    errcpass.innerHTML = "Password  should match!";
                    return false;
                }
                
                return true;
            }

            function passclear() {
                errpass.innerHTML = "";
            }
            function cpassclear() {
                errcpass.innerHTML = "";
            }
        </script>
    </body>
</html>
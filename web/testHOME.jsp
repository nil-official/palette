<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("LandingPage.jsp?restrict=no");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="CSS/testHOME.css">
        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <title>Palette : Home</title>
    </head>
    <body>
        <input type="hidden" id="logstatus" value="<%= request.getAttribute("logstatus")%>">
        <header>
            <div class="container">
                <div class="navigation flex">
                    <div class="logo">
                        <img src="LOGO/pallete_nav.png" alt="">
                    </div>

                    <div class="navbar flex" id="navbar">
                        <div class="left-nav flex">
                            <ul class="flex menu">
                                <li class="menu-items"><a href="#" class="home">Home</a></li>
                                <li class="menu-items"><a href="testMOVIE.jsp" class="movie">Movies</a></li>
                                <li class="menu-items"><a href="testTVS.jsp" class="tvs">TV Shows</a></li>
                                <!--<li class="menu-items"><a href="https://1337x.to/">Clips</a></li>-->
                                <!--<li class="menu-items"><a href="#">Premium</a></li>-->
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
                            
                            <span class="avatar">
                                <i class="fa-solid fa-bars fa-3x" style="color: #ffffff; cursor: pointer" onclick="toggleProfile()"></i>
                            </span>
                            
                        </div>
                    </div>
                    <div class="mobile-nav-btn">
                        <ion-icon class="mobile-nav-icon" name="menu-outline"></ion-icon>
                        <ion-icon class="mobile-nav-icon" name="close-outline"></ion-icon>
                    </div>
                </div>

                <div class="dialog-box" id="subMenu">
                    <div class="profile">
                        <div class="profile-pic">
                            <img src="zdefault-avatar.png" alt="">
                        </div>
                        <div class="user">
                            <a class="userEmail"><%= session.getAttribute("name")%></a>
                            <!--<input type="text" id="diaEmail" value="dummy@gmail.com" readonly>-->
                        </div>
                    </div>
                    <hr>
                    <div class="dia-options">
                        <a href="MyAccount.jsp" class="dia-link">
                            <i class="fa-solid fa-user fa-2x l-l" style="color: #ffffff;"></i>
                            <p>My Profile</p>
                            <span><i class="fa-solid fa-angle-right r-l" style="color: #ffffff;"></i></span>
                        </a>
<!--
                        <a href="#" class="dia-link">
                            <i class="fa-solid fa-moon fa-2x l-l" style="color: #ffffff;"></i>
                            <p>Theme</p>
                            <span><i class="fa-solid fa-angle-right r-l" style="color: #ffffff;"></i></span>
                        </a>-->

                        <a href="CasualPages/About_us.jsp" class="dia-link">
                            <i class="fa-solid fa-users fa-2x l-l" style="color: #ffffff;"></i>
                            <p>About Us</p>
                            <span><i class="fa-solid fa-angle-right r-l" style="color: #ffffff;"></i></span>
                        </a>

                        <a href="CasualPages/HelpUs.jsp" class="dia-link">
                            <i class="fa-solid fa-circle-question fa-2x l-l" style="color: #ffffff;"></i>
                            <p>Help & Feedback</p>
                            <span><i class="fa-solid fa-angle-right r-l" style="color: #ffffff;"></i></span>
                        </a>
                    </div>
                    <hr>
                    <div class="dia-options">
                        <a href="http://localhost:8080/com.palette/logout" class="dia-link">
                            <i class="fa-solid fa-power-off fa-2x l-l" style="color: #ffffff;"></i>
                            <p>Sign Out</p>
                            <span><i class="fa-solid fa-angle-right r-l" style="color: #ffffff;"></i></span>
                        </a>
                    </div>
                </div>







            </div>
            <!-- <video src="video/kS.mp4" id="video" autoplay loop muted></video> -->
            <main class="slider">
                
                <div class="mySlides fade">             
                    <a href="VIDEOS/shershaah.webm" class="playbtn"><span class="fa fa-play play" aria-hidden="true"></span>Play</a>
                    <video class="slide" src="VIDEOS/shershaah.mp4" autoplay muted></video>
                </div>
                
<!--                <div class="mySlides fade">
                    <a class="playbtn" onclick="playmovie()"><span class="fa fa-play play" aria-hidden="true"></span>Play</a>
                        <video class="slide" src="VIDEOS/inter.mp4" autoplay muted  width="95%" height="500px"></video>
                    </div>-->
                    <div class="mySlides fade">
                        <a href="VIDEOS/brahmastra.webm" class="playbtn"><span class="fa fa-play play" aria-hidden="true"></span>Play</a>
                        <video class="slide" src="VIDEOS/brahmastra.mp4" autoplay muted  width="100%" height="500px"></video>
                    </div>
                    <div class="mySlides fade">
                        <a href="VIDEOS/Spider-Man_trailer.webm" class="playbtn"><span class="fa fa-play play" aria-hidden="true"></span>Play</a>
                        <video class="slide" src="VIDEOS/nowayhome.mp4" autoplay muted  width="95%" height="500px"></video>
                    </div>
                    <div class="mySlides fade">
                        <a href="VIDEOS/pathaan.webm" class="playbtn"><span class="fa fa-play play" aria-hidden="true"></span>Play</a>
                        <video class="slide" src="VIDEOS/pathaan.mp4" autoplay muted  width="100%" height="500px"></video>
                    </div>
                    <div class="mySlides fade">
                        <a href="VIDEOS/shershaah.webm" class="playbtn"><span class="fa fa-play play" aria-hidden="true"></span>Play</a>
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
            <a class="footlinks" href="#">Home</a>
            <a class="footlinks" href="http://localhost:8080/com.palette/CasualPages/firstL3.jsp">Pricing</a>
            <a class="footlinks" href="http://localhost:8080/com.palette/CasualPages/HelpUs.jsp">FAQs</a>
            <a class="footlinks" href="http://localhost:8080/com.palette/CasualPages/About_us.jsp">About Us</a>
            <a class="footlinks" href="http://localhost:8080/com.palette/CasualPages/HelpUs.jsp">Help Us</a>
            <br><br>
            <hr style="border:1px solid gray; margin-left: 20px; margin-right: 20px">
            <br>
            <p class="copyright">© 2023 Palette, Inc</p>
        </div>
        <script src="JS/home.js"></script>
        <script>
            function playmovie(){
                window.location.assign("D:\PALETTE_updated_till_18thMay\PALLETE\web\VIDEOS\inter.mp4");
            }
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

                    // Popup Profile
                    let sub = document.getElementById("subMenu");
                    function toggleProfile() {
                        sub.classList.toggle("active");
                    }


//                    //Login Button
//                    document.querySelector("#login-btn").addEventListener("click", function () {
//                        document.querySelector(".login-popup").classList.add("active");
//                    });
//                    document.querySelector(".close-btn-login").addEventListener("click", function () {
//                        document.querySelector(".login-popup").classList.remove("active");
//                    });
//                    // Admin login
//                    document.querySelector("#admin-btn").addEventListener("click", function () {
//                        document.querySelector(".login-popup-admin").classList.add("active");
//                    });
//                    document.querySelector(".close-btn").addEventListener("click", function () {
//                        document.querySelector(".login-popup-admin").classList.remove("active");
//                    });
//
//                    // Toggle Login/Signup
//                    var log = document.getElementById("login");
//                    var reg = document.getElementById("register");
//                    var tbtn = document.getElementById("top-btn");
//                    function register() {
//                        log.style.left = "-450px";
//                        reg.style.left = "50px";
//                        tbtn.style.left = "138px";
//                    }
//                    function login() {
//                        log.style.left = "50px";
//                        reg.style.left = "550px";
//                        tbtn.style.left = "0";
//                    }
        </script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script>
//                    var s1 = document.getElementById("regstatus").value;
//                    if (s1 === "success") {
//                        swal("Congrats", "Account Created Successfully!", "success");
//                    } else if (s1 === "failed") {
//                        swal("Sorry", "Registration Failed!", "error");
//                    }
//
//                    var s2 = document.getElementById("logstatus").value;
//                    if (s2 === "failed") {
//                        swal("Sorry", "Wrong Username or Password!", "error");
//                    }
//
//                    var s3 = document.getElementById("passchange").value;
//                    if (s3 === "passchangesuccess") {
//                        swal("Congrats", "Password Changed Successfully!", "success");
//                    } else if (s3 === "passchangefailed") {
//                        swal("Sorry", "Password Change Failed!!", "error");
//                    }
//
//                    var s9 = document.getElementById("logout").value;
//                    if (s9 === "success") {
//                        swal("Congrats", "You have been logged out!", "success");
//                    }
        </script>
        <script>
                // Success login status
                var s1 = document.getElementById("logstatus").value;
                if (s1 === "success") {
                    swal("Congrats", "Login Successful!", "success");
                }
                
        </script>
    </body>
</html>
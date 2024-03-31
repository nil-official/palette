<%-- 
    Document   : MyAccount
    Created on : 4 May, 2023, 5:11:24 PM
    Author     : Niladri
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%--
    String handleNull(String value) {
        return (value != null) ? value : "";
    }
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account</title>

        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap">
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.5.1/css/all.css">

        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="CSS/MyAccount.css">
        <link rel="stylesheet" href="CSS/validation.css">
    </head>
    <body>

        <input type="hidden" id="update" value="<%= request.getAttribute("update")%>">
        <%
            try {

                Class.forName("oracle.jdbc.driver.OracleDriver");
                // Connect to the database
                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

                // Creating statement
                Statement stmt = conn.createStatement();

                // Retrieve email from login
                String id = request.getSession(false).getAttribute("id").toString();
                //String id = "1002";

                // Creating Query
                String query = "SELECT UAVATAR, UEMAIL, UPASSWORD, UNAME, UMCODE, UMOBILE, UADDRESS, UPINCODE, UCITY, USTATE, PAMOUNT, PNOD, PNOS FROM USERS WHERE UCID = '" + id + "'";
                //String query = "SELECT * FROM USERS WHERE UCID = '"+id+"'";
                ResultSet rs = stmt.executeQuery(query);

                // Loop through the results and display each movie in a table row
                while (rs.next()) {
        %>

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
                        <span class="search">
                            <!--<form action="" class="search-bar">
                                <input type="text" placeholder="Search..">
                                <a href="#"><i class="fa-solid fa-magnifying-glass fa-2x" style="color: #ffffff;"></i></a>
                            </form>-->
                        </span>
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
                        <a name ="gg" class="userEmail"><%= rs.getString(4)%></a>
                    </div>
                </div>
                <hr>
                <div class="dia-options">
                    <a href="#" class="dia-link">
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

            <div class="my-account">

                
                <div class="my-account-area">
                    <form method="POST" action="updateInfo" enctype="multipart/form-data">
                        <input type="hidden" name="fid" value="<%= session.getAttribute("id")%>">
                        <h1 class="fhead">My Account</h1>
                        <div class="profile-pic-details">
                            <h1>Profile Picture</h1>
                            <div class="account-image">
                                <% Blob i = rs.getBlob("uavatar");
                                    if (i == null) {
                                %>
                                <i class="fa-solid fa-user fa-10x default-image"></i>
                                <%} else {
                                        //to show the image
                                        Blob imageBlob = rs.getBlob("uavatar");
                                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                        out.write("<img style='position: absolute;max-width: 150px;margin-left: 10px;margin-top: 18px;'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                                    }%>
                                <img class="chosen-image" id="chosen-image">
                                <input type="file" name="fimage" id="upload-button" accept="image/*" onchange="dpChange()">
                                <label for="upload-button">
                                    <i class="fa-solid fa-upload" style="color: #ffffff;"></i> &nbsp;
                                    Choose
                                </label>
                            </div>
                        </div>
                        <div class="profile-details">
                            <h1>Profile Info</h1><br>
                            <a>Name</a>
                            <div class="account-input">
                                <input type="text" name="fname" id="fname" value="<%= rs.getString(4)%>">
                            </div>
                            <a>Mobile Number</a>
                            <div class="account-input-codes">
                                <select class="country-codes" name="fmcode">
                                    <% String cc = rs.getString(5);
                                        if (cc == null) {
                                            cc = "Select";%>
                                    <option value="<%=cc%>"><%=cc%></option>
                                    <%} else {%>
                                    <option value="<%= rs.getString(5)%>"><%= rs.getString(5)%></option>
                                    <%}%>
                                    <option value="+91">+91</option>
                                    <option value="+54">+54</option>
                                    <option value="+61">+61</option>
                                    <option value="+43">+43</option>
                                    <option value="+32">+32</option>
                                    <option value="+55">+55</option>
                                    <option value="+1">+1</option>
                                    <option value="+56">+56</option>
                                    <option value="+86">+86</option>
                                    <option value="+57">+57</option>
                                    <option value="+53">+53</option>
                                    <option value="+42">+42</option>
                                    <option value="+45">+45</option>
                                    <option value="+20">+20</option>
                                    <option value="+240">+240</option>
                                    <option value="+291">+291</option>
                                    <option value="+372">+372</option>
                                    <option value="+251">+251</option>
                                    <option value="+500">+500</option>
                                    <option value="+298">+298</option>
                                    <option value="+679">+679</option>
                                    <option value="+358">+358</option>
                                    <option value="+33">+33</option>
                                    <option value="+594">+594</option>
                                    <option value="+689">+689</option>
                                    <option value="+241">+241</option>
                                    <option value="+220">+220</option>
                                    <option value="+49">+49</option>
                                    <option value="+30">+30</option>
                                    <option value="+299">+299</option>
                                    <option value="+590">+590</option>
                                    <option value="+671">+671</option>
                                    <option value="+502">+502</option>
                                    <option value="+224">+224</option>
                                    <option value="+245">+245</option>
                                    <option value="+592">+592</option>
                                    <option value="+509">+509</option>
                                    <option value="+504">+504</option>
                                    <option value="+852">+852</option>
                                    <option value="+36">+36</option>
                                    <option value="+354">+354</option>
                                    <option value="+62">+62</option>
                                    <option value="+98">+98</option>
                                    <option value="+964">+964</option>
                                    <option value="+353">+353</option>
                                    <option value="+972">+972</option>
                                    <option value="+39">+39</option>
                                    <option value="+81">+81</option>
                                </select>
                            </div>
                            <div class="account-input-mobile">
                                <%
                                    String mob = rs.getString(6);
                                    if (mob == null) {
                                        mob = "";
                                    }
                                %>
                                <input type="text" name="fmobile" value="<%=mob%>">
                            </div>
                            <a>Address</a>
                            <div class="account-input">
                                <%--
                                    String add = rs.getString(7);
                                    if (add == null) {
                                        add = "";
                                    }
                                --%>
                                <input id="xt" type="text" name="faddress" value="<%=rs.getString(7)%>">
                                <script defer>
                                    const imp = document.getElementById("xt");
                                    window.addEventListener("load",()=>{
                                        if (imp.value === "null")
                                        imp.value("");
                                    });
                                </script>
                            </div>
                            <a>Pincode</a>
                            <div class="account-input">
                                <%
                                    String pin = rs.getString(8);
                                    if (pin == null) {
                                        pin = "";
                                    }
                                %>
                                <input type="text" name="fpincode" id="fpincode" value="<%=pin%>">
                            </div>
                            <a>Town/City</a>
                            <div class="account-input">
                                <%
                                    String city = rs.getString(9);
                                    if (city == null) {
                                        city = "";
                                    }
                                %>
                                <input type="text" name="fcity" id="fcity" value="<%=city%>">
                            </div>
                            <a>State</a>
                            <div class="account-input">
                                <select class="state-select" name="fstate">
                                    <% String st = rs.getString(10);
                                        if (st == null) {
                                            st = "Select";%>
                                    <option value="<%=st%>"><%=st%></option>
                                    <%} else {%>
                                    <option value="<%= rs.getString(10)%>"><%= rs.getString(10)%></option>
                                    <%}%>
                                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                    <option value="Assam">Assam</option>
                                    <option value="Bihar">Bihar</option>
                                    <option value="Chandigarh">Chandigarh</option>
                                    <option value="Chhattisgarh">Chhattisgarh</option>
                                    <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                                    <option value="Daman and Diu">Daman and Diu</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Lakshadweep">Lakshadweep</option>
                                    <option value="Puducherry">Puducherry</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Gujarat">Gujarat</option>
                                    <option value="Haryana">Haryana</option>
                                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                                    <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                    <option value="Jharkhand">Jharkhand</option>
                                    <option value="Karnataka">Karnataka</option>
                                    <option value="Kerala">Kerala</option>
                                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    <option value="Maharashtra">Maharashtra</option>
                                    <option value="Manipur">Manipur</option>
                                    <option value="Meghalaya">Meghalaya</option>
                                    <option value="Mizoram">Mizoram</option>
                                    <option value="Nagaland">Nagaland</option>
                                    <option value="Odisha">Odisha</option>
                                    <option value="Punjab">Punjab</option>
                                    <option value="Rajasthan">Rajasthan</option>
                                    <option value="Sikkim">Sikkim</option>
                                    <option value="Tamil Nadu">Tamil Nadu</option>
                                    <option value="Telangana">Telangana</option>
                                    <option value="Tripura">Tripura</option>
                                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                                    <option value="Uttarakhand">Uttarakhand</option>
                                    <option value="West Bengal">West Bengal</option>
                                </select>
                            </div>
                        </div>
                        <div class="button-details">
<!--                            <input type="reset" value="Clear">-->
                            <input id="clicked" name="clicked" type="submit" value="Update">
                        </div>
                    </form>
                    <form method="POST" action="updateCredOTP">
                        <input type="hidden" name="fid" value="<%= session.getAttribute("id")%>">
                        <div class="account-details">
                            <h1>Account Info</h1><br>
                            <a>Email</a>
                            <div class="account-input">
                                <input class="input-email" type="text" name="femail" id="femail" value="<%= rs.getString(2)%>" 
                                       oninput="validateEmail(this.id, 'email-icon')">
                                <i id="email-icon" class="fas fa-times" style="color: red; display: none;"></i>
                            </div>
                            <a>Password</a>
                            <div class="account-input">
                                <input type="password" name="fpassword" id="fpassword" value="<%= rs.getString(3)%>">
                            </div>
                            <a>Confirm Password</a>
                            <div class="account-input">
                                <input type="text" name="fconpassword" id="fconpassword" value="<%= rs.getString(3)%>">
                            </div>
                        </div>
                        <div class="button-details account-cred">
<!--                            <input type="reset" value="Clear">-->
                            <input id="clicked" name="clicked" type="submit" value="Update">
                        </div>
                    </form>

                    <div class="subscription-details">
                        <h1>Subscription Info</h1><br>
                        <a>Plan</a>
                        <div class="account-input">
                            <input type="text" name="fplan" id="fplan" disabled value="<%= rs.getString(11)%>">
                        </div>
                    </div>
                    <div class="device-details">
                        <h1>Device Info</h1><br>
                        <a>Number of Allowed Devices</a>
                        <div class="account-input">
                            <input type="text" name="fdevice" id="fdevice" value="<%= rs.getString(12)%>" disabled>
                        </div>
                        <a>Number of Allowed Streams</a>
                        <div class="account-input">
                            <input type="text" name="fdevice" id="fdevice" disabled value="<%= rs.getString(13)%>" disabled>
                        </div>
                    </div>

                </div>

            </div>

        </div>
        <script>
            // Popup Profile
            let sub = document.getElementById("subMenu");
            function toggleProfile() {
                sub.classList.toggle("active");
            }

            //Dp Change
            function dpChange()
            {
                var image = document.getElementById("chosen-image");
                image.src = URL.createObjectURL(event.target.files[0]);
            }
        </script>


        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script>
            var update = document.getElementById("update").value;
            if (update === "success") {
                swal("Congrats", "Account Updated Successfully!", "success");
            } else if (update === "failed") {
                swal("Sorry", "Invalid Data Entry!", "error");
            } else if (update === "duplicate") {
                swal("Sorry", "Email is Already Registered!", "error");
            }
        </script>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>

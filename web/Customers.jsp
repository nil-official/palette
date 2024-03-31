<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : Customers</title>
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="CSS/admincust.css">
        <%!
            OracleConnection oconn;
            OracleStatement ost;
            OraclePreparedStatement opst;
            OracleResultSet ors;
            OracleResultSetMetaData orsmd;
            String q;
            int counter, reccounter;
        %>
        <style>

        </style>
        <script>
            function funDelete()
            {
                if (confirm("R U sure 2 delete???") === true)
                    return true;
                else
                    return false;
            }
        </script>
    </head>
    <body>
        <div id="mySidenav" class="sidenav">
            <p class="logo"><span><img class="small-logo" src="LOGO/palette_icon.png"></span><img class="big-logo" src="LOGO/pallete_nav.png"></p>
            <a href="Admin.jsp" class="icon-a dash"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
            <a href="#" class="icon-a cust"><i class="fa fa-users icons"></i> &nbsp;&nbsp;Customers</a>
            <a href="Transactions.jsp" class="icon-a tras"><i class="fa-solid fa-sack-dollar icons"></i> &nbsp;&nbsp;Transactions</a>
            <a href="Plan.jsp" class="icon-a pla"><i class="fa fa-list icons"></i> &nbsp;&nbsp;Plans</a>
            <a href="LandingPage.jsp" class="icon-a pla"><i class="fa-solid fa-right-from-bracket"></i> &nbsp;&nbsp;Logout</a>
        </div>
        
        <div id="main">
        <div class="head">
                <div class="col-div-6">
                    <span style="font-size:30px;cursor:pointer; color: black;" class="nav"  >&#9776; Dashboard</span>
                    <span style="font-size:30px;cursor:pointer; color: black;" class="nav2"  >&#9776; Dashboard</span>
                </div>

                <div class="col-div-6">
                    <div class="profile">
                        <p>Welcome, Admin!</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        
        <div>
<!--            <span style="font-weight: bold; font-size: 150%">!!!Hello Users!!!</span>-->
            <span>
                <form class="search" method="POST" action="Customers.jsp">
                    <input type="email" placeholder="Enter Email to Search" name="tSearch" required>
                    <button type="submit" name="bSearch" id="sh" style="display: none;">Search</button>
                    <label for="sh"><i class="fa-solid fa-magnifying-glass fa-2x" style="color: #000000; cursor: pointer;"></i></label>
                </form>
            </span>
        </div>
        <br/>

        <%
            // STEP 1: REGISTERING THE JSP WITH ORACLE
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

            //STEP 2: CREATING THE CONNECTION OBJECT
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

            if (request.getParameter("bSearch") != null) {
                String vSearchUser = request.getParameter("tSearch");

                //STEP 4: CREATING THE QUERY
                q = "select ucid, uname, uemail, upassword, umobile, uaddress, upincode, ucity, ustate from users where uemail=?";

                //STEP 3: CREATING THE STATEMENT
                opst = (OraclePreparedStatement) oconn.prepareStatement(q);

                //STEP 5: FILLING UP THE PARAMETERS
                opst.setString(1, vSearchUser);

                //STEP 5: Executing the query and populating the resultset
                ors = (OracleResultSet) opst.executeQuery();

        %>
        <form method="POST" action="Customers.jsp">
            <button class="back-btn" type="submit">Display all Customers</button>
        </form>
        <% } else {

                //STEP 3: CREATING THE STATEMENT
                ost = (OracleStatement) oconn.createStatement();

                //STEP 4: CREATING THE QUERY
                q = "select ucid, uname, uemail, upassword, umobile, uaddress, upincode, ucity, ustate from USERS order by 2";

                //STEP 5: Executing the query and populating the resultset
                ors = (OracleResultSet) ost.executeQuery(q);

            }
            //STEP 6: Getting the Headings
            orsmd = (OracleResultSetMetaData) ors.getMetaData();
        %>
        <div class="col-div-8">
            <div class="box-8">
                <div class="content-box">
                    <table>
                        <thead>
                            <tr>
                                <%
                                    for (counter = 1; counter <= orsmd.getColumnCount(); counter++) {
                                %>
                                <th><%=orsmd.getColumnName(counter)%></th>
                                    <%
                                        }
                                    %>
                                <th colspan="2"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                reccounter = 0;
                                while (ors.next()) {
                                    reccounter++;
                            %>
                            <tr>
                                <%
                                    for (int i = 1; i <= 9; i++) {
                                %>
                                <td><%=ors.getString(i)%></td>
                                <%
                                    }
                                %>
                                <!--<td><button type="submit">Edit</button></td>-->
                                <td><form method="POST" action="http://localhost:8080/com.palette/deluser?UEMAIL=<%=ors.getString(3)%>" onsubmit="return funSub()">
                                        <button class="remove-btn" type="submit">Remove</button>
                                    </form></td>
                            </tr>
                            <%
                                }

                            %>
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
        <%            if (reccounter == 0) {
        %>
        <h2 style="font-family: monospace; color: yellow">No matching records exists. Try with a better match</h2>
        <%
            }
            // ors.close();
            //  ost.close();
            oconn.close();

        %>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                $(".cus").click(function () {
                                    $(".cus").css('background', 'red');
                                    $(".cus").css('color', '#f1f1f1');
                                    $(".col-div-3").css('display', 'none');
                                    $(".col-div-8").css('display', 'none');
                                    $(".customers").css('display', 'block');
                                });

                                $(".nav").click(function () {
                                    $("#mySidenav").css('width', '70px');
                                    $("#main").css('margin-left', '70px');
                                    $(".logo").css('visibility', 'hidden');
                                    $(".logo span").css('visibility', 'visible');
                                    $(".logo span").css('margin-left', '-10px');
                                    $(".icon-a").css('visibility', 'hidden');
                                    $(".icons").css('visibility', 'visible');
                                    $(".icons").css('margin-left', '-8px');
                                    $(".nav").css('display', 'none');
                                    $(".nav2").css('display', 'block');
                                    $(".small-logo").css('display', 'block');
                                });

                                $(".nav2").click(function () {
                                    $("#mySidenav").css('width', '300px');
                                    $("#main").css('margin-left', '300px');
                                    $(".logo").css('visibility', 'visible');
                                    $(".icon-a").css('visibility', 'visible');
                                    $(".icons").css('visibility', 'visible');
                                    $(".nav").css('display', 'block');
                                    $(".nav2").css('display', 'none');
                                    $(".small-logo").css('display', 'none');
                                });

        </script>
    </body>
</html>
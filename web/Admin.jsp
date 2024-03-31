<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : Dashboard</title>
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="CSS/admindash.css">
        <script>
            function funSub()
            {
                if (confirm("Are you sure to remove this account???") === true)
                    return true;
                else
                    return false;
            }
        </script>
    </head>
    <body>
        <%!
            OracleConnection oconn, con;
            OracleStatement ost;
            OracleResultSet ors;
            OracleResultSetMetaData orsmd;
            String q, s, nc;
        %>

        <%
            HttpSession ab = request.getSession();
            
            //STEP 1 : REGISTERING OF THE REQUIRED DRIVER WITH THE JAVA PROGRAM
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

            //STEP 2: INSTANTIATING THE CONNECTION OBJECT
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

            //STEP 3: CREATING THE QUERY
            q = "select ucid, uname, uemail, upassword from users order by ucid desc";

            //STEP 4: INSTANTIATING STATEMENT OBJECT FOR EXECUTING SQL QUERIES
            ost = (OracleStatement) oconn.createStatement();

            //STEP 5: EXECUTING THE STATEMENT AND FILL UP THE RESULTSET
            ors = (OracleResultSet) ost.executeQuery(q);

            //STEP 6: GETTING SYSTEM INFORMATION ABOUT THE FETCHED TABLE
            orsmd = (OracleResultSetMetaData) ors.getMetaData();
        %>


        <div id="mySidenav" class="sidenav">
            <p class="logo"><span><img class="small-logo" src="LOGO/palette_icon.png"></span><img class="big-logo" src="LOGO/pallete_nav.png"></p>
            <a href="#" class="icon-a dash"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
            <a href="Customers.jsp" class="icon-a cust"><i class="fa fa-users icons"></i> &nbsp;&nbsp;Customers</a>
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

            <div class="clearfix"></div>
            <br/>

            <div class="col-div-3">
                <div class="box">
                    <p>
                        <%= ab.getAttribute("count").toString()%>
                        <br/>
                        <span>Customers</span>
                    </p>
                    <i class="fa fa-users box-icon"></i>
                </div>
            </div>
            <div class="col-div-3">
                <div class="box">
                    <p>
                        <%= ab.getAttribute("count").toString()%>
                        <br/><span>Transactions</span></p>
                    <i class="fa-solid fa-sack-dollar box-icon"></i>
                </div>
            </div>
            <div class="col-div-3">
                <div class="box">
                    <p>3<br/><span>Plans</span></p>
                    <i class="fa-solid fa-list box-icon"></i>
                </div>
            </div>
            <div class="clearfix"></div>
            <br/><br/>



            <!--Dashboard-->
            <div class="col-div-8">
                <div class="box-8">
                    <div class="content-box">
                        <p>Recent Registrations</p>
                        <br/>
                        <table>
                            <thead>
                                <tr>
                                    <%                                        
                                        for (int i = 1; i <= orsmd.getColumnCount(); i++) {
                                    %>
                                    <th><%= orsmd.getColumnName(i)%></th>
                                        <%
                                            }
                                        %>
                                    <th colspan="2"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    while (ors.next()) {
                                %>
                                <tr>
                                    <%
                                        for (int i = 1; i <= 4; i++) {
                                    %>
                                    <td><%=ors.getString(i)%></td>
                                    <%
                                        }
                                    %>

                                    <!--                                    <td><button type="submit">Change</button></td>
                                                                        <td><form method="POST" action="http://localhost:8080/PALETTE/deluser?UEMAIL=<%=ors.getString(3)%>" onsubmit="return funSub()">
                                                                                <button type="submit">Remove</button>
                                                                            </form></td>-->
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
                            
            <div class="clearfix"></div>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
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

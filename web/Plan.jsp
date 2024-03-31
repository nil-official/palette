<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : Plans</title>
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v6.4.0/css/all.css">
        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="CSS/adminplan.css">
    </head>
    <body>

        <div id="mySidenav" class="sidenav">
            <p class="logo"><span><img class="small-logo" src="LOGO/palette_icon.png"></span><img class="big-logo" src="LOGO/pallete_nav.png"></p>
            <a href="Admin.jsp" class="icon-a dash"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
            <a href="Customers.jsp" class="icon-a cust"><i class="fa fa-users icons"></i> &nbsp;&nbsp;Customers</a>
            <a href="Transactions.jsp" class="icon-a tras"><i class="fa-solid fa-sack-dollar icons"></i> &nbsp;&nbsp;Transactions</a>
            <a href="#" class="icon-a plan"><i class="fa fa-list icons"></i> &nbsp;&nbsp;Plans</a>
            <a href="LandingPage.jsp" class="icon-a"><i class="fa-solid fa-right-from-bracket"></i> &nbsp;&nbsp;Logout</a>
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
            <br/>


            <div class="col-div-8">
                <div class="box-8">
                    <div class="content-box">
                        <table>
                            <thead>
                            <th>Price</th>
                            <th>Validity</th>
                            <th>No of Devices</th>
                            <th>No of Streams</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>249/-</td>
                                    <td>3 Months</td>
                                    <td>3</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>449/-</td>
                                    <td>6 Months</td>
                                    <td>5</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>799/-</td>
                                    <td>1 Year</td>
                                    <td>7</td>
                                    <td>5</td>
                                </tr>
                            </tbody>
                            <tfoot>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <link rel="icon" href="LOGO/palette_icon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap">
        <style>
            .content{
                font-family: 'Montserrat', sans-serif;
                font-size: 20px;
            }
            .content table, th, td{
                border: 1px solid black;
                border-collapse: collapse;
            }
            .content th, td{
                padding: 10px;
                text-align: left;
            }
            button{
                border: none;
                border-radius: 5px;
                background-color: red;
                color: white;
                padding: 10px;
                font-size: 23px;
                margin-top: 20px;
                margin-right: 20px;
                cursor: pointer;
            }
            button a{
                text-decoration: none;
                color: white;
            }
        </style>
    </head>
    <body>
        <%
            HttpSession spd = request.getSession();
            request.setAttribute("regstatus", "success");
        %>
        <h1>Transaction Successful!</h1>
        <div class="content">
            <table>
                <tr>
                    <th>Email Id</th>
                    <td><%=spd.getAttribute("email")%></td>
                </tr>
                <tr>
                    <th>Transaction Id</th>
                    <td><%=spd.getAttribute("tid")%></td>
                </tr>
                <tr>
                    <th>Date & Time of Transaction</th>
                    <td><%=spd.getAttribute("tdate")%></td>
                </tr>
                <tr>
                    <th>Amount</th>
                    <td><%=spd.getAttribute("cost")%></td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>Success</td>
                </tr>
            </table>
        </div>
        <button onclick="window.print()">Print</button>
        <%
            String email = spd.getAttribute("email").toString();
            String link = "http://localhost:8080/com.palette/LandingPage.jsp?email="+email;
        %>
        <button><a href="<%= link %>">Continue to Login</a></button>
    </body>
</html>

package PalettePack;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;
import oracle.jdbc.OracleStatement;

public class cpass extends HttpServlet {

    OracleConnection oconn;
    OracleStatement ost;
    OraclePreparedStatement opst;
    OracleResultSet ors;
    String q;
    RequestDispatcher dispatcher = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String newPass = request.getParameter("pass2");
        HttpSession hs = request.getSession(false);
        String femail = hs.getAttribute("femail").toString();

        try {

            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

            q = "update users set upassword=? where uemail=?";
            opst = ((OraclePreparedStatement) oconn.prepareStatement(q));
            opst.setString(1, newPass);
            opst.setString(2, femail);

            int rowCount = opst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("passchange", "passchangesuccess");
                dispatcher = request.getRequestDispatcher("LandingPage.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("passchange", "passchangefailed");
                dispatcher = request.getRequestDispatcher("LandingPage.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(cpass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

package PalettePack;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Niladri
 */
public class register extends HttpServlet {

    String vName, vEmail, vPassword;
    OracleConnection oconn;
    OraclePreparedStatement ost;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        try (PrintWriter out = response.getWriter()) {

            RequestDispatcher dispatcher = null;

            HttpSession mySession = request.getSession();
            
            String email = mySession.getAttribute("email").toString();

            try {

                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

                String q = "INSERT INTO USERS(UCID,UNAME,UEMAIL,UPASSWORD,PID,PDATE,PAMOUNT,PNOD,PNOS) values(UCID.nextval,?,?,?,?,?,?,?,?)";

                ost = (OraclePreparedStatement) oconn.prepareStatement(q);

                ost.setString(1, mySession.getAttribute("name").toString());
                ost.setString(2, email);
                ost.setString(3, mySession.getAttribute("pass").toString());

                ost.setString(4, mySession.getAttribute("tid").toString());
                ost.setString(5, mySession.getAttribute("tdate").toString());
                
                ost.setString(6, mySession.getAttribute("cost").toString());
                ost.setString(7, mySession.getAttribute("nod").toString());
                ost.setString(8, mySession.getAttribute("nos").toString());

                int rowCount = ost.executeUpdate();

                if (rowCount > 0) {
                    mySession.setAttribute("email", email);
                    dispatcher = request.getRequestDispatcher("Invoice.jsp");
                } else {
                    request.setAttribute("regstatus", "failed");
                    dispatcher = request.getRequestDispatcher("LandingPage.jsp");
                }
                dispatcher.forward(request, response);
            } catch (SQLException ex) {
                //ex.printStackTrace();
                request.setAttribute("regstatus", "failed");
                dispatcher = request.getRequestDispatcher("LandingPage.jsp");
                dispatcher.forward(request, response);
            } finally {
                ost.close();
                oconn.close();
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

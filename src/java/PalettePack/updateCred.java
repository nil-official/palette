package PalettePack;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

/**
 *
 * @author Niladri
 */
public class updateCred extends HttpServlet {

    OracleConnection oconn;
    OraclePreparedStatement ost;
    RequestDispatcher dispatcher;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        HttpSession mys = request.getSession(false);
        String genOtp = mys.getAttribute("otp").toString();
        String entOtp = request.getParameter("entOtp");

        if (genOtp.equals(entOtp)) {
            
            String vId = mys.getAttribute("id").toString();
            String vEmail = mys.getAttribute("email").toString();
            String vPassword = mys.getAttribute("pass").toString();
            
            try {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

                String q = "UPDATE USERS SET UEMAIL=? ,UPASSWORD=? WHERE UCID= ?";

                ost = (OraclePreparedStatement) oconn.prepareStatement(q);

                ost.setString(1, vEmail);
                ost.setString(2, vPassword);
                ost.setString(3, vId);

                int rowCount = ost.executeUpdate();

                if (rowCount > 0) {
                    request.setAttribute("update", "success");
                    dispatcher = request.getRequestDispatcher("MyAccount.jsp");
                }
                else {
                    request.setAttribute("update", "failed");
                    dispatcher = request.getRequestDispatcher("MyAccount.jsp");
                }
                dispatcher.forward(request, response);


            } catch (IOException | SQLException | ServletException ex) {
                request.setAttribute("update", "failed");
                dispatcher = request.getRequestDispatcher("MyAccount.jsp");
                dispatcher.forward(request, response);
            } finally{
                ost.close();
                oconn.close();
            }  
            
        }
        else {
            response.sendRedirect("updateCredOTP.jsp?otp=invalid");
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
            Logger.getLogger(updateCred.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updateCred.class.getName()).log(Level.SEVERE, null, ex);
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

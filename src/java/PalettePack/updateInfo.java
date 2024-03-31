package PalettePack;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

@MultipartConfig(maxFileSize = 16177215) //For max 16 MB images

public class updateInfo extends HttpServlet {
    
    OracleConnection oconn;
    OraclePreparedStatement ost;
    RequestDispatcher dispatcher;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        try (PrintWriter out = response.getWriter()) {

        String vId = request.getParameter("fid");
        String vName = request.getParameter("fname");
        String vMcode = request.getParameter("fmcode");
        String vMobile = request.getParameter("fmobile");
        String vAddress = request.getParameter("faddress");
        String vPincode = request.getParameter("fpincode");
        String vCity = request.getParameter("fcity");
        String vState = request.getParameter("fstate");
        //out.print("<html><h1>"+vId+vName+vMcode+vMobile+vAddress+vPincode+vCity+vState+"</h1></html>");
        try {

            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

            String q = "UPDATE USERS SET UNAME=? ,UMCODE=? ,UMOBILE=? ,UADDRESS=? ,UPINCODE=? ,UCITY=? ,USTATE=?, UAVATAR=? WHERE UCID= ?";

            ost = (OraclePreparedStatement) oconn.prepareStatement(q);
            
            ost.setString(1, vName);
            ost.setString(2, vMcode);
            ost.setString(3, vMobile);
            ost.setString(4, vAddress);
            ost.setString(5, vPincode);
            ost.setString(6, vCity);
            ost.setString(7, vState);
            
            //Image Update
            Part filePart = request.getPart("fimage");
            InputStream fileContent = filePart.getInputStream();
            String fileName = filePart.getSubmittedFileName();
            long fileSize = filePart.getSize();
            ost.setBinaryStream(8, fileContent, (int) fileSize);
            
            ost.setString(9, vId);

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

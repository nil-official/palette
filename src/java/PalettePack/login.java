package PalettePack;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            String tEmail, tPassword;
            OracleConnection oconn;
            OraclePreparedStatement ostmt;
            
            tEmail = request.getParameter("lEmail");
            tPassword = request.getParameter("lPassword");
            
//        out.print(tEmail);
//        out.print(tPassword);

            HttpSession session = request.getSession();
            RequestDispatcher dispatcher = null;

            try {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

                String sql = "select * from users where uemail=? and upassword=?";
                ostmt = (OraclePreparedStatement) oconn.prepareStatement(sql);

                ostmt.setString(1, tEmail);
                ostmt.setString(2, tPassword);

                ResultSet rs = ostmt.executeQuery();
                if (rs.next()) {
                    session.setAttribute("name", rs.getString("uname"));
                    session.setAttribute("email", rs.getString("uemail"));
                    session.setAttribute("id", rs.getString("ucid"));
                    request.setAttribute("logstatus", "success");
                    dispatcher = request.getRequestDispatcher("testHOME.jsp");
                } else {
                    request.setAttribute("logstatus", "failed");
                    dispatcher = request.getRequestDispatcher("LandingPage.jsp");
                }
                dispatcher.forward(request, response);

            } catch (IOException | SQLException | ServletException e) {}

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
        processRequest(request, response);
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
        processRequest(request, response);
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

package PalettePack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Niladri
 */
public class substocard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession subs = request.getSession();
            String action = request.getParameter("btn");
            String value = null;

            if (null != action) switch (action) {
                case "A":
                    value = "249/-";
                    subs.setAttribute("nod", "3");
                    subs.setAttribute("nos", "2");
                    subs.setAttribute("cost", value);
                    response.sendRedirect("CardDetails.jsp");
                    break;
                case "B":
                    value = "449/-";
                    subs.setAttribute("nod", "5");
                    subs.setAttribute("nos", "3");
                    subs.setAttribute("cost", value);
                    response.sendRedirect("CardDetails.jsp");
                    break;
                case "C":
                    value = "799/-";
                    subs.setAttribute("nod", "7");
                    subs.setAttribute("nos", "5");
                    subs.setAttribute("cost", value);
                    response.sendRedirect("CardDetails.jsp");
                    break;
                default:
                    break;
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

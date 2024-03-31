package PalettePack;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class fpassotp extends HttpServlet {

    String genOtp, entOtp;
    RequestDispatcher dispa;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession hs = request.getSession(false);
        genOtp = hs.getAttribute("fotp").toString();
        entOtp = request.getParameter("entOtp");
        
        dispa = null;
        
        if(genOtp.equals(entOtp))
        {
           dispa=request.getRequestDispatcher("ChangePass.jsp");
           dispa.forward(request, response);
        }
        else
        {
            request.setAttribute("passchangeotp", "passchangewrongotp");
            dispa=request.getRequestDispatcher("ForgotPassOtp.jsp");
            dispa.forward(request, response);
        }
    }

}

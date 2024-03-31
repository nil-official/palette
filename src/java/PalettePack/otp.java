package PalettePack;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class otp extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("rEmail");
        String name = request.getParameter("rName");
        String pass = request.getParameter("rPassword");
         
        RequestDispatcher dispatcher = null;
        HttpSession mySession = request.getSession();

        if (email != null || !email.equals("")) {
            
            Random random = new Random();
            int otpvalue = random.nextInt(999999 - 100000 + 1) + 100000;

            String to = email;
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("dont.reply.palette@gmail.com", "amxydmgpsyvlnfsc");
                }
            });
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("OTP for Registration ");
                message.setText("Your One Time Password is: " + otpvalue + "\n\n\nRegards,\nTeam Palette");
                Transport.send(message);
                
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            dispatcher = request.getRequestDispatcher("OtpPage.jsp");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            mySession.setAttribute("name", name);
            mySession.setAttribute("pass", pass);
            dispatcher.forward(request, response);
        }
        else{
            request.setAttribute("regstatus", "failed");
            dispatcher = request.getRequestDispatcher("LandingPage.jsp");
            dispatcher.forward(request, response);
        }
    }
}

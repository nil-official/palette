package PalettePack;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

public class updateCredOTP extends HttpServlet {

    OracleConnection oconn;
    OraclePreparedStatement ostmt;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = null;
        HttpSession mySession = request.getSession();

        String id = request.getParameter("fid");
        String email = request.getParameter("femail");
        String pass = request.getParameter("fpassword");

        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

            String sql = "select * from users where uemail=?";
            ostmt = (OraclePreparedStatement) oconn.prepareStatement(sql);

            ostmt.setString(1, email);

            ResultSet rs = ostmt.executeQuery();
            
            if (rs.next()) {
                request.setAttribute("update", "duplicate");
                dispatcher = request.getRequestDispatcher("MyAccount.jsp");
                dispatcher.forward(request, response);
            } else {
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
                        message.setSubject("OTP for Updation of Credentials!");
                        message.setText("Your One Time Password is: " + otpvalue + "\n\nRegards,\nTeam Palette");
                        Transport.send(message);

                    } catch (MessagingException e) {
                        //throw new RuntimeException(e);
                        request.setAttribute("update", "failed");
                        dispatcher = request.getRequestDispatcher("MyAccount.jsp");
                        dispatcher.forward(request, response);
                    }
                    dispatcher = request.getRequestDispatcher("updateCredOTP.jsp");
                    mySession.setAttribute("otp", otpvalue);
                    mySession.setAttribute("id", id);
                    mySession.setAttribute("email", email);
                    mySession.setAttribute("pass", pass);
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("update", "failed");
                    dispatcher = request.getRequestDispatcher("MyAccount.jsp");
                    dispatcher.forward(request, response);
                }
            }

        } catch (IOException | SQLException | ServletException e) {
            request.setAttribute("update", "failed");
            dispatcher = request.getRequestDispatcher("MyAccount.jsp");
            dispatcher.forward(request, response);
        }

    }
}

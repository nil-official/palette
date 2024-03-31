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

public class fpass extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        OracleConnection oconn;
        OraclePreparedStatement ostmt;
        String femail = request.getParameter("entEmail");
        RequestDispatcher dispatcher = null;
        HttpSession mySession = request.getSession();

        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@FRIDAY:1521:orcl2", "palette", "admin");

            String sql = "select * from users where uemail=?";
            ostmt = (OraclePreparedStatement) oconn.prepareStatement(sql);

            ostmt.setString(1, femail);

            ResultSet rs = ostmt.executeQuery();
            if (rs.next()) {

                int fotp = 0;
                Random rand = new Random();
                fotp = rand.nextInt(999999);

                String to = femail;
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
                    message.setFrom(new InternetAddress(femail));
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("OTP for Password Change");
                    message.setText("Your One Time Password is: " + fotp + "\n\nRegards,\nTeam Palette");
                    Transport.send(message);

                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                dispatcher = request.getRequestDispatcher("ForgotPassOtp.jsp");
                mySession.setAttribute("fotp", fotp);
                mySession.setAttribute("femail", femail);
                dispatcher.forward(request, response);

            } else {
                dispatcher = request.getRequestDispatcher("ForgotPass.jsp?email=invalid");
            }
            dispatcher.forward(request, response);

        } catch (IOException | RuntimeException | SQLException | ServletException e) {}

    }

}

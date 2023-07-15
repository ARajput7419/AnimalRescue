package filters;
import database.Otp;
import database.OtpDAO;
import email.EmailService;
import jakarta.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Random;

public class OtpRequestFilter  implements Filter {

    OtpDAO dao = new OtpDAO();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        if (request.getParameter("type") == null || !request.getParameter("type").equals("request_")){
            filterChain.doFilter(request,response);
            return;
        }


        HttpSession session = request.getSession();
        if (session == null) {
            response.sendRedirect("/login");
            return;
        }



        try{

        String to = request.getParameter("to");
        String user = request.getParameter("username");
        String from = "jyotisolanki74192@gmail.com";
        long id = Long.parseLong(request.getParameter("id"));
        String subject = "User : "+session.getAttribute("username")+" Requested For OTP ";
            String category = request.getParameter("category");
            String description = request.getParameter("description");
        Otp old_otp = dao.get((String)session.getAttribute("username"),user,id);
        boolean deleted = false;
        String otp = null;
        Timestamp expire = null;
        Random random = new Random();
        if (old_otp == null){
            otp = ""+random.nextInt(100000,1000000);
            expire = new Timestamp(System.currentTimeMillis()+120000);
        }
        else{

            Timestamp current = new Timestamp(System.currentTimeMillis());

            if (current.before(old_otp.getExpireTime())){
                otp = old_otp.getOtp();
            }
            else{
                dao.delete((String)session.getAttribute("username"),user,id);
                otp = ""+random.nextInt(100000,1000000);
                expire = new Timestamp(System.currentTimeMillis()+120000);
                deleted = true;

            }

        }
            String body = "<font color=\"blue\"><h2>Hello "+user+",</h2></font><br><br>\n" +
                    "<div style=\"box-shadow: 0px 0px 10px 10px pink; padding: 10px;\">\n" +
                    "<h3>The OTP is "+otp+" for the verification of animal having  following details :</h3> <br>\n" +
                    "<table style = \"border: 1px solid white;border-collapse: collapse;\" cellpadding=\"10px\" border=\"2px solid black\" bgcolor=\"gray\">\n" +
                    "<tbody>\n" +
                    "<tr>\n" +
                    "<td>ID : </td><td>"+id+"</td>\n" +
                    "</tr>\n" +
                    "<tr>\n" +
                    "<td>Category : </td> <td> "+category+" </td>\n" +
                    "</tr>\n" +
                    "<tr>\n" +
                    "\t<td> Description :</td> <td>"+description+"</td> \n" +
                    "</tr>\n" +
                    "</tbody>\n" +
                    "</table>\n" +
                    "<br>\n" +
                    "<h4>Sent By : </h4>\n" +
                    "<h4>Animal Rescue Team</h4>\n" +
                    "</div>\n";
            EmailService.sendMail(from,to,subject,body);
            if (old_otp == null || deleted)
                dao.insert(otp,(String)session.getAttribute("username"),user,id,expire);
            request.setAttribute("message","Otp is sent successfully");
            request.setAttribute("status",true);

        } catch (MessagingException | SQLException e) {

            request.setAttribute("message","Something went wrong");
            request.setAttribute("status",false);
            e.printStackTrace();
        }
        filterChain.doFilter(request,response);

    }

    @Override
    public void destroy() {

    }
}

package filters;
import database.Animal;
import database.AnimalDAO;
import database.Otp;
import database.OtpDAO;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;

public class OtpSubmitFilter implements Filter {

    OtpDAO dao = new OtpDAO();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {


    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        if (request.getParameter("type")==null || !request.getParameter("type").equals("submit"))
        {
            filterChain.doFilter(request,response);
            return;
        }

        HttpSession session = request.getSession();
        if (session == null)
        {
            response.sendRedirect("/login");
            return;
        }
        String from = (String) session.getAttribute("username");
        String to = request.getParameter("to");
        try {
            long id = Long.parseLong(request.getParameter("id"));
            Otp otp = dao.get(from,to,id);
            String sent_otp = request.getParameter("otp");
            if ( otp == null || sent_otp == null){

                request.setAttribute("message","Otp Verification is failed");
            }
            else
            {

                Timestamp current_timestamp = new Timestamp(System.currentTimeMillis());

                if (current_timestamp.compareTo(otp.getExpireTime()) >= 0){
                    request.setAttribute("message","Time Expired");
                }
                else{

                    if (sent_otp.equals(otp.getOtp()))
                    {

                        Animal animal = (Animal) request.getAttribute("animal");
                        new AnimalDAO().update("update animals set served = 1  where id="+animal.getId());
                        request.setAttribute("message","Verification is done");
                        animal.setServed(true);
                        dao.delete(from,to,id);

                    }
                    else
                        request.setAttribute("message","Wrong OTP");

                }


            }

        } catch (Exception e) {
            request.setAttribute("message","There is some problem");
            e.printStackTrace();
        }

        filterChain.doFilter(request,response);

    }

    @Override
    public void destroy() {

    }
}

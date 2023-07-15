package filters;

import database.AnimalDAO;
import database.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class ProfileFilter implements Filter {

    AnimalDAO dao = new AnimalDAO();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;

        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        if (user == null) {

            response.sendRedirect(request.getServletContext().getContextPath()+"/login");
            return;
        }

        try {
            int rescued = dao.count("select count(*) from animals where username='"+user.getUsername()+"' and served = 1");
            user.setRescued(rescued);

            int total = dao.count("select count(*) from animals where username='"+user.getUsername()+"'");
            user.setTotal(total);

        } catch (SQLException e) {
            request.setAttribute("message","Not able to fetch counts ");
            e.printStackTrace();
        }


        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}

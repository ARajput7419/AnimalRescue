package filters;

import database.UserDAO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class Delete implements Filter {

    UserDAO dao = new UserDAO();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest)servletRequest).getSession();

        HttpServletRequest request = (HttpServletRequest)servletRequest;

        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String username = (String) session.getAttribute("username");

        if (username == null)
            response.sendRedirect(((HttpServletRequest) servletRequest).getContextPath());
       else
        {
            try {
                dao.deleteUser(username);
                session.removeAttribute("user");
                session.removeAttribute("username");
                request.setAttribute("status",true);
                request.setAttribute("message","User account is deleted");



            } catch (SQLException e){
                request.setAttribute("status",false);
                request.setAttribute("message","There is some problem");
            }
            filterChain.doFilter(request,response);

        }
    }

    @Override
    public void destroy() {

    }
}

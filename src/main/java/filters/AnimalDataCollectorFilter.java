package filters;

import database.Animal;
import database.AnimalDAO;
import database.User;
import database.UserDAO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AnimalDataCollectorFilter implements Filter {

    AnimalDAO dao = new AnimalDAO();
    UserDAO userDAO = new UserDAO();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        Animal animal = null;


        try {
            long id = Long.parseLong(request.getParameter("id"));
            animal = dao.get(id);
            User user = userDAO.get(animal.getUsername());
            request.setAttribute("animal",animal);
            request.setAttribute("user",user);

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (animal == null){
            response.getWriter().write("<font color='red'><h1>Entry is not found</h1></font>");
            return;
        }
       filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}

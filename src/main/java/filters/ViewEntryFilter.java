package filters;

import database.Animal;
import database.AnimalDAO;
import database.User;
import database.UserDAO;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ViewEntryFilter implements Filter {

    AnimalDAO dao = new AnimalDAO();
    UserDAO userDAO = new UserDAO();
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {



    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        long id = Long.parseLong(request.getParameter("id"));
        try {
            Animal animal = dao.get(id);
            if (animal == null)
                throw new RuntimeException("animal object is null");
            System.out.println(animal);
            User user = userDAO.get(animal.getUsername());
            request.setAttribute("animal",animal);
            request.setAttribute("user",user);

        } catch (Exception e) {
            request.setAttribute("message","There is some error");
            e.printStackTrace();
        }

        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}

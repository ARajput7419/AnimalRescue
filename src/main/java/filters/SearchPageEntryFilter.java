package filters;

import database.Animal;
import database.AnimalDAO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class SearchPageEntryFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    AnimalDAO dao = new AnimalDAO();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = ( HttpServletResponse) servletResponse;

        long id = Long.parseLong(request.getParameter("id"));
        Animal animal = null;
        try {
            animal = dao.get(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (animal == null) {

            response.getWriter().write("<font color='red'><h1>Entry is not found</h1></font>");
            return;
        }
        request.setAttribute("animal",animal);
        filterChain.doFilter(request,response);


    }

    @Override
    public void destroy() {

    }
}

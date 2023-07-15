package filters;


import database.Animal;
import database.AnimalDAO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchPageFilter implements Filter {


    AnimalDAO dao = new AnimalDAO();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username == null)
            response.sendRedirect("/login");
        else{

            String state = request.getParameter("state");
            String district = request.getParameter("district");
            String pinCode = request.getParameter("pinCode");
            String category = request.getParameter("category");

            ArrayList<Animal> animals = null;

            try {
                animals =  dao.query("select * from animals where state='"+state+"' and  district= '"+district+"' and pinCode = '"+pinCode+"' and served = 0 and category='"+category+"'");
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("animals",animals);
            filterChain.doFilter(request,response);

        }


    }

    @Override
    public void destroy() {

    }
}

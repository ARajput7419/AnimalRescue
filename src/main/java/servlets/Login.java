package servlets;

import database.User;
import database.UserDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class Login extends HttpServlet {

    UserDAO dao = new UserDAO();


    private void helper(HttpServletRequest request , HttpServletResponse response,HttpSession session,String requested_page) throws ServletException, IOException, SQLException {

        session.setMaxInactiveInterval(60*60);
        RequestDispatcher dispatcher_lo = request.getRequestDispatcher("/login.jsp");
        if (session.getAttribute("username") != null) {
            response.sendRedirect(requested_page);
        } else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null) {
                User user = dao.get(username);
                if (user != null) {
                    if (password.equals(user.getPassword())) {
                        session.setAttribute("username", username);
                        session.setAttribute("user",user);
                        response.sendRedirect(requested_page);
                    } else {
                        request.setAttribute("message", "Invalid Credentials");
                        dispatcher_lo.forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Invalid User");
                    dispatcher_lo.forward(request, response);
                }

            }
            else{
                dispatcher_lo.forward(request, response);
            }
        }
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response){

        String requested_page = request.getParameter("requested_page");

        if (requested_page == null)
            requested_page = "profile.jsp";

        try {
            helper(request,response,request.getSession(),requested_page);
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse response){

        String requested_page = request.getParameter("request_page");

        if (requested_page == null)

            requested_page = "profile.jsp";


        try {

            helper(request,response,request.getSession(),requested_page);

        }
        catch (ServletException | IOException | SQLException e) {

            e.printStackTrace();
        }

    }

}
package servlets;
import database.AnimalDAO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class AnimalEntryDelete extends HttpServlet {

    AnimalDAO dao = new AnimalDAO();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        long entry = Long.parseLong(request.getParameter("id"));

        HttpSession session = request.getSession();

        if (session.getAttribute("username")==null)
            response.sendRedirect("/login");

        else{

            try {
                dao.deleteAnimal(entry,(String)(session.getAttribute("username")));
                response.sendRedirect(request.getServletContext().getContextPath()+"/animal_section?message=Entry is deleted successfully");
            } catch (SQLException e) {
                response.sendRedirect(request.getServletContext().getContextPath()+"/animal_section?message=There is some problem");
                e.printStackTrace();
            }
        }
    }
}
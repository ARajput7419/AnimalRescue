package servlets;

import database.User;
import database.UserDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class Update extends HttpServlet {


    UserDAO dao = new UserDAO();

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {

        User user = new User();

        if(ServletFileUpload.isMultipartContent(request)){
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
            try{
                List<FileItem> items = fileUpload.parseRequest(request);
                for(FileItem item : items){
                    String name = item.getFieldName();
                    String value = item.getString();
                    switch (name){

                        case "username":
                        {
                            user.setUsername(value);
                            break;
                        }
                        case "password":{
                            user.setPassword(value);
                            break;
                        }
                        case "pinCode":{
                            user.setPinCode(value);
                            break;
                        }
                        case "location":{
                            user.setLocation(value);
                            break;
                        }
                        case "state":{
                            user.setState(value);
                            break;
                        }
                        case "district":{
                            user.setDistrict(value);
                            break;
                        }
                        case "email":{
                            user.setEmail(value);
                            break;
                        }
                        case "mobile":{
                            user.setMobile(value);
                            break;
                        }
                        case "fName":{
                            user.setfName(value);
                            break;
                        }
                        case "lName":{
                            user.setlName(value);
                            break;
                        }
                        case "image":{
                            user.setImage(item.getInputStream());
                            break;
                        }

                    }
                }

            } catch (FileUploadException | IOException e) {
                e.printStackTrace();
            }

        }

        String message = null;
        try {
            dao.update(user);
            user = dao.get(user.getUsername());
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            session.setMaxInactiveInterval(60*60);
            message = "Profile is update Successfully !!!";

        } catch (SQLException | IOException e) {

            message = e.toString();

        }

        response.sendRedirect("profile.jsp?message="+message);


    }



}

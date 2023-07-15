package servlets;

import database.User;
import database.UserDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class Registration extends HttpServlet {

    UserDAO userDAO = new UserDAO();

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException, ServletException {

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

                                String filename = item.getName();
                                String array[] = filename.split("\\.");
                                String type=array[array.length-1];
                                user.setType(type);
                                user.setImage(item.getInputStream());
                                break;
                            }

                    }
                }

            } catch (FileUploadException | IOException e) {
                e.printStackTrace();
            }

        }

        try {
            if (exists(user)){

                RequestDispatcher dispatcher = request.getRequestDispatcher("/registration");
                request.setAttribute("success",false);
                request.setAttribute("message","User Already Exists");
                dispatcher.forward(request,response);

            }
            else{
                    userDAO.insert(user);
                    request.setAttribute("success",true);
                    request.setAttribute("message","User is registered successfully");
                    request.getRequestDispatcher("/registration").forward(request,response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    boolean exists(User user) throws SQLException, IOException {
        return userDAO.userExists(user.getUsername());
    }


}


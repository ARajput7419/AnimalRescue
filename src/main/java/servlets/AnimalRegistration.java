package servlets;
import database.Animal;
import database.AnimalDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public class AnimalRegistration extends HttpServlet {

    AnimalDAO dao = new AnimalDAO();

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException {


        Animal animal = new Animal();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null )
        {
            response.sendRedirect("/login");
            return;
        }

        if(ServletFileUpload.isMultipartContent(request)){
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
            try{
                List<FileItem> items = fileUpload.parseRequest(request);
                for(FileItem item : items){
                    String name = item.getFieldName();
                    String value = item.getString();
                    switch (name){

                        case "category":{
                            animal.setCategory(value);
                            break;
                        }

                        case "district":{
                            animal.setDistrict(value);
                            break;
                        }

                        case "pinCode":{
                            animal.setPinCode(value);
                            break;
                        }
                        case "location":{
                            animal.setLocation(value);
                            break;
                        }
                        case "state":{
                            animal.setState(value);
                            break;
                        }
                        case "description":{
                            animal.setDescription(value);
                            break;
                        }
                        case "image":{
                            String filename = item.getName();
                            String array[] = filename.split("\\.");
                            String type=array[array.length-1];
                            animal.setType(type);
                            animal.setImage(item.getInputStream());
                            break;
                        }

                    }
                }

            } catch (FileUploadException | IOException e) {
                e.printStackTrace();
            }

        }



        animal.setTimestamp(new Timestamp(System.currentTimeMillis()));
        animal.setServed(false);
        animal.setUsername(username);

        try {
            dao.insert(animal);
            response.sendRedirect(request.getServletContext().getContextPath()+"/animal_section?message=Animal is registered successfully");
        } catch (SQLException | IOException e) {
           System.out.println(e);
            response.sendRedirect(request.getServletContext().getContextPath()+"/animal_registration?message=Not able to register");
        }


    }
}
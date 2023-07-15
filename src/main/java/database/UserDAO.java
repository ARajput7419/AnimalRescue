package database;
import java.io.IOException;
import java.sql.*;

public class UserDAO {


    public User get(String username) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("select * from users where username = ?");
        preparedStatement.setString(1,username);
        ResultSet set = preparedStatement.executeQuery();
        if (!set.next()) return null;
        else
        {
            User user = new User();
            user.setUsername(set.getString("username"));
            user.setPassword(set.getString("password"));
            user.setEmail(set.getString("email"));
            user.setMobile(set.getString("mobile"));
            user.setDistrict(set.getString("district"));
            user.setState(set.getString("state"));
            user.setPinCode(set.getString("pinCode"));
            user.setLocation(set.getString("location"));
            user.setfName(set.getString("fName"));
            user.setlName(set.getString("lName"));
            user.setImage(set.getBlob("image").getBinaryStream());
            user.setType(set.getString("type"));

            return user;
        }

    }

   public int insert(User user) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();

        PreparedStatement statement = connection.prepareStatement("insert into users(username,password,email,mobile,district,state,pinCode,location,image,fName,lName,type) values (?,?,?,?,?,?,?,?,?,?,?,?)");

        statement.setString(1,user.getUsername());
        statement.setString(2,user.getPassword());
        statement.setString(3,user.getEmail());
        statement.setString(4,user.getMobile());
        statement.setString(5,user.getDistrict());
        statement.setString(6,user.getState());
        statement.setString(7,user.getPinCode());
        statement.setString(8,user.getLocation());
        statement.setBlob(9,user.getImage());
        statement.setString(10,user.getfName());
        statement.setString(11,user.getlName());
        statement.setString(12,user.getType());

        return statement.executeUpdate();

    }


    public void update(User user) throws SQLException, IOException {


        Connection connection = GetConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(
                "update users set password=?,email=?,mobile=?,district=?,state=?,pinCode=?,location=?,image=?,fName=?,lName=? , type = ? where username = ?"
        );

        statement.setString(1,user.getPassword());
        statement.setString(2,user.getEmail());
        statement.setString(3,user.getMobile());
        statement.setString(4,user.getDistrict());
        statement.setString(5,user.getState());
        statement.setString(6,user.getPinCode());
        statement.setString(7,user.getLocation());
        statement.setBlob(8 , user.getImage());
        statement.setString(9,user.getfName());
        statement.setString(10,user.getlName());
        statement.setString(11,user.getType());
        statement.setString(12,user.getUsername());

        statement.executeUpdate();


    }

    public void deleteUser(String username) throws SQLException, IOException {
        Connection connection = GetConnection.getConnection();
        Statement statement = connection.createStatement();
        statement.executeUpdate("delete from otp where to_='"+username+"' or from_ = '"+username+"'");
        statement.executeUpdate("delete from animals where username='"+username+"'");
        statement.executeUpdate("delete from users where username='"+username+"'");
    }


    public boolean userExists(String username) throws SQLException, IOException {
        Connection connection = GetConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("select * from users where username='"+username+"'");
        return set.next();
    }


    public User[] query(String query) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();

        Statement statement = connection.createStatement();

        ResultSet set = statement.executeQuery(query);

        User [] users = new User[set.getFetchSize()];

        int k = 0;

        while (set.next()){
            users[k] = new User(set.getString("username"),
                    set.getString("fName"),
                    set.getString("lName"),
                    set.getString("password"),
                    set.getString("mobile"),
                    set.getString("email"),
                    set.getString("location"),
                    set.getString("state"),
                    set.getString("district"),
                    set.getString("pinCode"),
                    set.getBlob("image").getBinaryStream(),
                    set.getString("type")
            );
        }

        return users;

    }


}

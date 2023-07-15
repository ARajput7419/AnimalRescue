package database;

import java.io.IOException;
import java.sql.*;

public class OtpDAO {

    public Otp get(String from , String to , long id) throws SQLException, IOException {

       Connection connection =  GetConnection.getConnection();

       PreparedStatement statement  = connection.prepareStatement("select * from otp where from_ = ? and to_ = ? and id = ?");

       statement.setString(1,from);
       statement.setString(2,to);
       statement.setLong(3,id);

       ResultSet set = statement.executeQuery();

       if(!set.next()) return null;

       Otp otp  = new Otp(
               set.getString("from_"),
               set.getString("to_"),
               set.getLong("id"),
               set.getString("otp"),
               set.getTimestamp("expire")
       );

       return otp;
    }

    public void delete(String from , String to , long id) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("delete from otp where from_ = ? and to_ = ? and id = ?");
        preparedStatement.setString(1,from);
        preparedStatement.setString(2,to);
        preparedStatement.setLong(3,id);
        preparedStatement.executeUpdate();

    }

    public void insert(String otp , String from , String to , long id , Timestamp expire) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("insert into otp(from_,to_,otp,expire,id) values (?,?,?,?,?)");
        preparedStatement.setString(1,from);
        preparedStatement.setString(2,to);
        preparedStatement.setString(3,otp);
        preparedStatement.setTimestamp(4,expire);
        preparedStatement.setLong(5,id);
        preparedStatement.executeUpdate();

    }

}

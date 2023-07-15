package database;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class AnimalDAO {

   public Animal get(long id ) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("select * from animals where id = ?");
        preparedStatement.setLong(1,id);
        ResultSet set = preparedStatement.executeQuery();
        if (!set.next()) return null;
        else
        {
            Animal animal = new Animal();
            animal.setUsername(set.getString("username"));
            animal.setId(set.getLong("id"));
            animal.setDescription(set.getString("descriptions"));
            animal.setDistrict(set.getString("district"));
            animal.setState(set.getString("state"));
            animal.setPinCode(set.getString("pinCode"));
            animal.setLocation(set.getString("location"));
            animal.setServed(set.getBoolean("served"));
            animal.setTimestamp(set.getTimestamp("timestamp_"));
            animal.setCategory(set.getString("category"));
            animal.setType(set.getString("type"));
            Blob blob = set.getBlob("image");
            animal.setImage(blob.getBinaryStream());
            return animal;
        }

    }

    public int insert(Animal animal) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();

        PreparedStatement statement = connection.prepareStatement("insert into animals(username,image,district,state,pinCode,location,descriptions,category,timestamp_,served,type) values (?,?,?,?,?,?,?,?,?,?,?)");
        statement.setString(1, animal.getUsername());
        statement.setBlob(2,animal.getImage());
        statement.setString(3,animal.getDistrict());
        statement.setString(4,animal.getState());
        statement.setString(5,animal.getPinCode());
        statement.setString(6,animal.getLocation());
        statement.setString(7,animal.getDescription());
        statement.setString(8,animal.getCategory());
        statement.setTimestamp(9,animal.getTimestamp());
        statement.setBoolean(10,animal.isServed());
        statement.setString(11,animal.getType());

        return statement.executeUpdate();

    }

    public int deleteAnimal(long id, String username) throws SQLException, IOException {
        Connection connection = GetConnection.getConnection();
        Statement statement = connection.createStatement();
        return statement.executeUpdate("delete from animals where id="+id+" and username = '"+username+"'");

    }




    public boolean animalExists(long id) throws SQLException, IOException {
        Connection connection = GetConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("select * from animals where id="+id);
        return set.next();
    }


    public ArrayList<Animal> query(String query) throws SQLException, IOException {

        Connection connection = GetConnection.getConnection();

        Statement statement = connection.createStatement();

        ResultSet set = statement.executeQuery(query);

        ArrayList<Animal> animals = new ArrayList<>();

        while (set.next()){

            animals.add( new Animal(
                    set.getLong("id"),
                    set.getString("username"),
                    set.getBlob("image").getBinaryStream(),
                    set.getString("location"),
                    set.getString("state"),
                    set.getString("district"),
                    set.getString("pinCode"),
                    set.getString("descriptions"),
                    set.getTimestamp("timestamp_"),
                    set.getString("category"),
                    set.getBoolean("served"),
                    set.getString("type")

            ));

        }

        return animals;

    }

    public void update(String query) throws SQLException, IOException {
       Connection connection = GetConnection.getConnection();
       Statement statement = connection.createStatement();
       statement.executeUpdate(query);
    }

    public int count(String query) throws SQLException, IOException {
       Connection connection = GetConnection.getConnection();
       Statement statement = connection.createStatement();
       ResultSet set = statement.executeQuery(query);
       if (!set.next()) return 0;
       return set.getInt(1);
    }

}

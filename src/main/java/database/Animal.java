package database;

import java.io.InputStream;
import java.sql.Time;
import java.sql.Timestamp;

public class Animal {


    public Animal(long id, String username, InputStream image, String location, String state, String district, String pinCode, String description, Timestamp timestamp , String category,boolean served,String type) {
        this.id = id;
        this.username = username;
        this.image = image;
        this.location = location;
        this.state = state;
        this.district = district;
        this.pinCode = pinCode;
        this.description = description;
        this.timestamp = timestamp;
        this.category = category;
        this.served = served;
        this.type = type;
    }

    public Animal(){

    }

    private long id;
    private String type;
    private String username;
    private InputStream image;
    private String location;
    private String state;
    private String district;
    private String pinCode;
    private String description;
    private Timestamp timestamp;
    private String category;
    private boolean served;
    private String base64Image;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public boolean isServed() {
        return served;
    }

    public void setServed(boolean served) {
        this.served = served;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public InputStream getImage() {
        return image;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getPinCode() {
        return pinCode;
    }

    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

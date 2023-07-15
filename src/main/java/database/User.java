package database;

import java.io.InputStream;

public class User {

    private String type;
    private String username;
    private String fName;
    private String lName;
    private String password;
    private String mobile;
    private String email;
    private String location;
    private String state;
    private String district;
    private String pinCode;
    private InputStream image;
    private int total;
    private int rescued;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRescued() {
        return rescued;
    }

    public void setRescued(int rescued) {
        this.rescued = rescued;
    }

    public InputStream getImage() {
        return image;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    private String base64Image;

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public User(String username, String fName, String lName, String password, String mobile, String email, String location, String state, String district, String pinCode, InputStream image,String type) {
        this.username = username;
        this.fName = fName;
        this.lName = lName;
        this.password = password;
        this.mobile = mobile;
        this.email = email;
        this.location = location;
        this.state = state;
        this.district = district;
        this.pinCode = pinCode;
        this.image = image;
        this.type=type;
    }



    public User(){

    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "User{" +
                "type='" + type + '\'' +
                ", username='" + username + '\'' +
                ", fName='" + fName + '\'' +
                ", lName='" + lName + '\'' +
                ", password='" + password + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", location='" + location + '\'' +
                ", state='" + state + '\'' +
                ", district='" + district + '\'' +
                ", pinCode='" + pinCode + '\'' +
                ", image=" + image +
                ", base64Image='" + base64Image + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}

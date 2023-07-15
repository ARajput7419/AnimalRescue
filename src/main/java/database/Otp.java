package database;

import java.sql.Timestamp;


public class Otp {

    private String from;
    private String to;
    private long id;
    private String otp;
    private Timestamp expireTime;

    public Otp(String from, String to, long id, String otp, Timestamp expireTime) {
        this.from = from;
        this.to = to;
        this.id = id;
        this.otp = otp;
        this.expireTime = expireTime;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public Timestamp getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Timestamp expireTime) {
        this.expireTime = expireTime;
    }
}

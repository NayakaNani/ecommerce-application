package com.nendrasys.commerce.model;

import java.sql.Timestamp;
import java.util.Date;

public class User {

    private Integer id;

    private String name;

    private Timestamp recentPurchase;

    private Integer highestPurchase;

    private String mobileNumber;

    private String emailAddress;

    private String gender;

    private String password;

    private String role;

    private Integer enabled;

    public User() {}

    public User(Integer id, String name, Timestamp recentPurchase, Integer highestPurchase, String mobileNumber, String emailAddress, String gender, String password, String role, Integer enabled) {
        this.id = id;
        this.name = name;
        this.recentPurchase = recentPurchase;
        this.highestPurchase = highestPurchase;
        this.mobileNumber = mobileNumber;
        this.emailAddress = emailAddress;
        this.gender = gender;
        this.password = password;
        this.role = role;
        this.enabled = enabled;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getRecentPurchase() {
        return recentPurchase;
    }

    public void setRecentPurchase(Timestamp recentPurchase) {
        this.recentPurchase = recentPurchase;
    }

    public Integer getHighestPurchase() {
        return highestPurchase;
    }

    public void setHighestPurchase(Integer highestPurchase) {
        this.highestPurchase = highestPurchase;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }
}

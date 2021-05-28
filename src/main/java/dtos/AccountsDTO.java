package dtos;

import javax.persistence.*;
import java.sql.Date;
public class AccountsDTO {
    private int userId;
    private String username;
    private String password;
    private int roleID;
    private String email;
    private String fullName;
    private Date doB;
    private String address;
    private String phoneNumber;
    private boolean isActive;

    public AccountsDTO() {
    }

    public AccountsDTO(int userId, String username, String password, int roleID, String email, String fullName, Date doB, String address, String phoneNumber, boolean isActive) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.roleID = roleID;
        this.email = email;
        this.fullName = fullName;
        this.doB = doB;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.isActive = isActive;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDoB() {
        return doB;
    }

    public void setDoB(Date doB) {
        this.doB = doB;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}

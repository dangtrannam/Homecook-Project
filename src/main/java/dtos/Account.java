package dtos;

public class Account {
    int UserID;
    String Username, Password, Role, Email, FullName, DoB, Address, PhoneNumber;
    boolean IsActive;

    public Account(int userID, String username, String password, String role, String email, String fullName, String doB, String address, String phoneNumber, boolean isActive) {
        UserID = userID;
        Username = username;
        Password = password;
        Role = role;
        Email = email;
        FullName = fullName;
        DoB = doB;
        Address = address;
        PhoneNumber = phoneNumber;
        IsActive = isActive;
    }

    public Account() {
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String role) {
        Role = role;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String fullName) {
        FullName = fullName;
    }

    public String getDoB() {
        return DoB;
    }

    public void setDoB(String doB) {
        DoB = doB;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        PhoneNumber = phoneNumber;
    }

    public boolean isActive() {
        return IsActive;
    }

    public void setActive(boolean active) {
        IsActive = active;
    }

    @Override
    public String toString() {
        return "Account{" +
                "UserID=" + UserID +
                ", Username='" + Username + '\'' +
                ", Password='" + Password + '\'' +
                ", Role='" + Role + '\'' +
                ", Email='" + Email + '\'' +
                ", FullName='" + FullName + '\'' +
                ", DoB='" + DoB + '\'' +
                ", Address='" + Address + '\'' +
                ", PhoneNumber='" + PhoneNumber + '\'' +
                ", IsActive=" + IsActive +
                '}';
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.account;

import java.io.Serializable;

/**
 *
 * @author KHANHBQSE63463
 */
public class AccountDTO implements Serializable {

    private String userID;
    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private String website;
    private boolean sendNotification;
    private int role;

    public AccountDTO() {
    }

    public static class Builder {
        //required field
        private String userID;
        private String email;
        //optional field
        private String firstName;
        private String lastName;
        private String password;
        private String website;
        private boolean sendNotification;
        private int role;
        
        public Builder(String userID, String email) {
            this.userID = userID;
            this.email = email;
        }
        public AccountDTO build() {
            return new AccountDTO(this);
        }
        public Builder firstName(String firstName) {
            this.firstName = firstName;
            return this;
        }
        public Builder lastName(String lastName) {
            this.lastName = lastName;
            return this;
        }
        public Builder password(String password) {
            this.password = password;
            return this;
        }
        public Builder website(String website) {
            this.website = website;
            return this;
        }
        public Builder sendNotification(boolean sendNotification) {
            this.sendNotification = sendNotification;
            return this;
        }
        public Builder role(int role) {
            this.role = role;
            return this;
            
        }
    }
    
    private AccountDTO(Builder builder) {
        this.userID = builder.userID;
        this.email = builder.email;
        this.firstName = builder.firstName;
        this.lastName = builder.lastName;
        this.password = builder.password;
        this.website = builder.website;
        this.sendNotification = builder.sendNotification;
        this.role = builder.role;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public boolean isSendNotification() {
        return sendNotification;
    }

    public void setSendNotification(boolean sendNotification) {
        this.sendNotification = sendNotification;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

}

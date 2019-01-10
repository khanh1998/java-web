/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts2.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import sample.account.AccountDAO;
import sample.account.AccountDTO;

/**
 *
 * @author KHANHBQSE63463
 */
public class RegisterAction extends ActionSupport{

    private String userID;
    private String email;
    private String firstName;
    private String lastName;
    private String website;
    private String password;
    private String repassword;
    private boolean sendNotification;
    private int role;

    public RegisterAction() {
    }

    public String execute() throws Exception {
        AccountDAO accountDAO = new AccountDAO();
        AccountDTO accountDTO = 
                new AccountDTO
                        .Builder(userID, email)
                        .firstName(firstName).lastName(lastName)
                        .password(password).website(website)
                        .sendNotification(sendNotification)
                        .role(role)
                        .build();
        boolean registerSuccess = accountDAO.registerAccount(accountDTO);
        
        if (registerSuccess)
            return Action.SUCCESS;
        else
            return Action.INPUT;
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

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }
    
    
}

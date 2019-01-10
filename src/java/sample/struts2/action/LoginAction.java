/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts2.action;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.account.AccountDAO;

/**
 *
 * @author KHANHBQSE63463
 */
public class LoginAction {

    private String UserId;
    private String Password;

    private final String FAIL = "fail";
    private final String SUCCESS = "success";

    public LoginAction() {
    }

    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        AccountDAO accountDAO = new AccountDAO();
        int role = accountDAO.isRegisteredAccount(UserId, Password);
        if (role == -1) {
            return FAIL;
        }
        if (role == 0 || role == 1) {
            session.put("userId", UserId);
            session.put("role", role);
        }
        return SUCCESS;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String UserId) {
        this.UserId = UserId;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

}

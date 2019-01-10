/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts2.action;

import com.opensymphony.xwork2.Action;
import sample.account.AccountDAO;

/**
 *
 * @author KHANHBQSE63463
 */
public class ChangeRoleAction {

    private String typeOfChange;
    private String[] userIDs;

    public ChangeRoleAction() {
    }

    public String execute() throws Exception {
        AccountDAO accountDAO = new AccountDAO();
        System.out.println(typeOfChange);
        System.out.println(userIDs);
        if ("adminToSubs".equals(typeOfChange)) {
            for (String userID : userIDs) {
                boolean success = accountDAO.changeAdminRoleToSubscriber(userID);
                if (!success)
                    return Action.ERROR;
            }
        }
        if ("subsToAdmin".equals(typeOfChange)) {
            for (String userID : userIDs) {
                boolean success = accountDAO.changeSubscriberRoleToAdmin(userID);
                if (!success)
                    return Action.ERROR;
            }
        }
        return Action.SUCCESS;
    }

    public String getTypeOfChange() {
        return typeOfChange;
    }

    public void setTypeOfChange(String typeOfChange) {
        this.typeOfChange = typeOfChange;
    }

    public String[] getUserIDs() {
        return userIDs;
    }

    public void setUserIDs(String[] userIDs) {
        this.userIDs = userIDs;
    }
    
}

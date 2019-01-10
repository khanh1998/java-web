/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts2.action;

import com.opensymphony.xwork2.Action;
import java.util.ArrayList;
import sample.account.AccountDAO;
import sample.account.AccountDTO;

/**
 *
 * @author KHANHBQSE63463
 */
public class SearchAction {
    private String searchValue;
    private ArrayList<AccountDTO> resultList;
    private int quantityOfAdmin;
    private int quantityOfSubs;
    
    public SearchAction() {
    }
    
    public String execute() throws Exception {
        AccountDAO accountDAO = new AccountDAO();
        if (searchValue == null)
            searchValue = "";
        accountDAO.search(searchValue);
        resultList = accountDAO.getAccountDTOs();
        
        quantityOfAdmin = 0;
        quantityOfSubs = 0;
        for (AccountDTO accountDTO: resultList) {
            if (accountDTO.getRole() == 1)
                quantityOfAdmin++;
            else
                quantityOfSubs++;
        }
        
        return Action.SUCCESS;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public ArrayList<AccountDTO> getResultList() {
        return resultList;
        
    }

    public int getQuantityOfAdmin() {
        return quantityOfAdmin;
    }

    public int getQuantityOfSubs() {
        return quantityOfSubs;
    }
    
    
}

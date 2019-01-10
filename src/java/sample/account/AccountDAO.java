/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.account;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import sample.utils.DBUtil;

/**
 *
 * @author KHANHBQSE63463
 */
public class AccountDAO implements Serializable {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    
    private ArrayList<AccountDTO> accountDTOs;
    public AccountDAO() {
    }

    /**
     * @param userId - id of account
     * @param password - password of account
     * @return <b>-1</b> if this is not a registered account<br>
     * <b>0</b> if this is a subscriber account<br>
     * <b>1</b> if this is a administrator account<br>
     * @throws SQLException
     * @throws NamingException
     */
    public int isRegisteredAccount(String userId, String password)
            throws SQLException, NamingException {
        String url = "SELECT role FROM Account WHERE userId = ? AND password = ?";
        try {
            openConnection();
            getResultSet(url, userId, password);
            if (resultSet.next()) {
                int role = resultSet.getInt("role");
                return role;
            }
        } finally {
            closeConnection();
        }
        return -1;
    }
    public boolean changeAdminRoleToSubscriber(String userID) throws SQLException, NamingException {
        String url = "UPDATE Account SET role = 0 WHERE userID = ?";
        try {
            openConnection();
            preparedStatement = connection.prepareStatement(url);
            preparedStatement.setString(1, userID);
            int row = preparedStatement.executeUpdate();
            if (row > 0)
                return true;
        } finally {
            closeConnection();
        }
        return false;
    }
    
    public boolean changeSubscriberRoleToAdmin(String userID) throws SQLException, NamingException {
        String url = "UPDATE Account SET role = 1 WHERE userID = ?";
        try {
            openConnection();
            preparedStatement = connection.prepareStatement(url);
            preparedStatement.setString(1, userID);
            int row = preparedStatement.executeUpdate();
            if (row > 0)
                return true;
        } finally {
            closeConnection();
        }
        return false;
    }
    public boolean registerAccount(AccountDTO accountDTO) throws SQLException, NamingException {
        String url = "INSERT INTO "
                + "Account(userID, email, firstName, lastName, password, website, sendNotification, role) "
                + "VALUES(?,?,?,?,?,?,?,?)";
        try {
            openConnection();
            createPrepareStatement(url, accountDTO);
            int insert = preparedStatement.executeUpdate();
            if (insert > 0)
                return true;
        } finally {
            closeConnection();
        }
        return false;
    }
    public ArrayList<AccountDTO> search(String name) throws SQLException, NamingException {
        String url = "SELECT * FROM Account WHERE firstName like ? OR lastName like ?";
        accountDTOs = new ArrayList<>();
        try {
            openConnection();
            getResultSet(url, "%" + name + "%", "%" + name + "%");
            translateResultSetToArrayList();
        } finally {
            closeConnection();
        }
        return accountDTOs;
    }

    public AccountDTO getAccountDTO(String userId) throws SQLException, NamingException {
        String url = "SELECT email, firstName, lastName, website, password, sendNotification, role FROM Account WHERE userId = ?";
        AccountDTO accountDTO = null;
        try {
            openConnection();
            getResultSet(url, userId);
            if (resultSet != null) {
                accountDTO = getOneRowFromResultSet();
            }
        } finally {
            closeConnection();
        }
        return accountDTO;
    }
    private void createPrepareStatement(String sqlStatement, AccountDTO accountDTO) throws SQLException {
        preparedStatement = connection.prepareStatement(sqlStatement);
        preparedStatement.setString(1, accountDTO.getUserID());
        preparedStatement.setString(2, accountDTO.getEmail());
        preparedStatement.setString(3, accountDTO.getFirstName());
        preparedStatement.setString(4, accountDTO.getLastName());
        preparedStatement.setString(5, accountDTO.getPassword());
        preparedStatement.setString(6, accountDTO.getWebsite());
        preparedStatement.setBoolean(7, accountDTO.isSendNotification());
        preparedStatement.setInt(8, accountDTO.getRole());
    }
    private void translateResultSetToArrayList() throws SQLException {
        if (resultSet != null) {
            AccountDTO accountDTO = null;
            while (resultSet.next()) {
                accountDTO = getOneRowFromResultSet();
                accountDTOs.add(accountDTO);
            }
        }
    }

    private AccountDTO getOneRowFromResultSet() throws SQLException {
        String userId = resultSet.getString("userId");
        String email = resultSet.getString("email");
        String firstName = resultSet.getString("firstName");
        String lastName = resultSet.getString("lastName");
        String website = resultSet.getString("website");
        String password = resultSet.getString("password");
        boolean sendNotification = resultSet.getBoolean("sendNotification");
        int role = resultSet.getInt("role");
        
        AccountDTO accountDTO = 
                new AccountDTO
                        .Builder(userId, email)
                        .firstName(firstName)
                        .lastName(lastName)
                        .website(website)
                        .password(password)
                        .sendNotification(sendNotification)
                        .role(role)
                        .build();
        return accountDTO;
                
    }

    private void getResultSet(String sqlStatement, String... args) throws SQLException {
        preparedStatement = connection.prepareStatement(sqlStatement);
        preparedStatement.setString(1, args[0]);//firstName
        preparedStatement.setString(2, args[1]);//lastName
        resultSet = preparedStatement.executeQuery();
    }

    private void openConnection() throws SQLException, NamingException {
        connection = DBUtil.getConnection();
    }

    private void closeConnection() throws SQLException {
        if (resultSet != null) {
            resultSet.close();
        }
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }

    public ArrayList<AccountDTO> getAccountDTOs() {
        return accountDTOs;
        
    }
    
    
}

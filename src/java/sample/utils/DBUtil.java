/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author KHANHBQSE63463
 */
public class DBUtil {
    public static Connection getConnection() 
        throws NamingException, SQLException{
        
        Context currentContext = new InitialContext();
        Context tomcatContext = (Context) currentContext.lookup("java:comp/env");
        DataSource dataSource = (DataSource) tomcatContext.lookup("J3LP0038DS");
        Connection connection = dataSource.getConnection();
        return connection;
    }
}

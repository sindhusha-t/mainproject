/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kk.dic.action;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author java2
 */
public class Dbconnection {
    public static Connection getConnection()throws Exception{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/classified","root","root");
        return con;
    
    }
   
}

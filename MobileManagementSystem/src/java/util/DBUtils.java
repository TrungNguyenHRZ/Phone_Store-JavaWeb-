/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author MY PC
 */
public class DBUtils {
     public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection cn = null;
        String IP = "localhost";
        String instanceName = "TRUNGNGUYEN";
        String port = "1433";
        String uid = "sa";
        String pwd = "12345";
        String db = "PhoneStore";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;
    }
     
//     public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        Connection con = DBUtils.getConnection();
//        if(con!=null) {
//            System.out.println("success");
//        } else {
//            System.out.println("fail");
//        }
//    }
}

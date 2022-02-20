package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class ConnectionManager {
    static Connection con;
    private static final String DB_DRIVER = "com.mysql.jdbc.Driver"; 
    private static final String DB_CONNECTION = "jdbc:mysql://eu-cdbr-west-02.cleardb.net/heroku_7fab5d5a1f5a6b9";
    private static final String DB_USER = "b103e963bf8806";
    private static final String DB_PASSWORD = "1a371198";
                
    
    public static Connection getConnection() throws SQLException {
        try {
				
		Class.forName(DB_DRIVER);
				
		try {
			con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
            System.out.println("Connected");
		}catch(SQLException e){
			e.printStackTrace();
				}
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	}
	return con;
        
    }
}

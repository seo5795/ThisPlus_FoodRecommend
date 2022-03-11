
package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	static final String driverName="oracle.jdbc.driver.OracleDriver";
	static final String url="jdbc:oracle:thin:@localhost:1521:xe";
	static final String user="";
	static final String pwd="";
	
	public static Connection connect() { // DB에 연결==Connection 확보
		Connection conn=null;
		try {
			Class.forName(driverName);
			conn=DriverManager.getConnection(url,user,pwd);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void disconnect(Statement stmt,Connection conn) {
		try {
			stmt.close();
			conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
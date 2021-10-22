package cl.laPalmera.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class DriverConeccion {
	String login = "root";
	String password = "jochua";
	String url = "jdbc:mysql://localhost/lapalmera";
	Connection conn = null;
		
	public Connection conectarse() throws SQLException, Exception
       { 
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:distintec","","");
						
		return conn;
       } 
}

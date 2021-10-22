package cl.laPalmera.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class ConnectionLaPalmera {
	
	private static final Logger LOGGER = Logger.getLogger(ConnectionLaPalmera.class);
	
	String login = "root";
	//String password = "jochua";
	String password = "";
	String url = "jdbc:mysql://localhost/lapalmera";
	Connection conn = null;
	
	public Connection conectionMySql() {
		LOGGER.debug("ConnectionLaPalmera.conectionMySql");
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url,login,password);			
		} catch (InstantiationException e) {
			LOGGER.error(e,e);
		} catch (IllegalAccessException e) {
			LOGGER.error(e,e);
		} catch (ClassNotFoundException e) {
			LOGGER.error(e,e);
		} catch (SQLException e) {
			LOGGER.error(e,e);
		}
		return conn;
	}

}

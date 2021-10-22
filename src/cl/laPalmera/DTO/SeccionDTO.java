package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class SeccionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(SeccionDTO.class);
	
    private String secCodigo="";
    private String asiCodigo="";
    private String asiNombre="";
    private String proCodigo="";
    private String proNombre="";
    private String secHorario="";
      
    public void grabar() {
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	Statement stmt = conn.createStatement();
      		String sql = "insert into Seccion values (";
      		sql = sql + secCodigo +",";
      		sql = sql + asiCodigo +",";
      		sql = sql + "'"+asiNombre +"',";
      		sql = sql + proCodigo +",";
      		sql = sql + "'"+proNombre +"',";
      		sql = sql + "'"+secHorario +"')";
      		int i = stmt.executeUpdate(sql);
      		
      		if (i == 1)
				LOGGER.debug("OK");
      		
      		stmt.close();
      	    conn.close();
        } catch (Exception e) {
            LOGGER.error(e,e);
        }
    }
} 

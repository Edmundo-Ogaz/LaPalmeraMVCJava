package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class AsistenciaDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(AsistenciaDTO.class);
	
    private String asiDia="";
    private String secCodigo="";
    private String asiEstado="";
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		Statement stmt = conn.createStatement();
    		String sql = "insert into Asistencia values (";
    		sql = sql + asiDia +",";
    		sql = sql + secCodigo +",";
    		sql = sql + "'"+asiEstado +"')";
    		//LOGGER.debug(sql);    		
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

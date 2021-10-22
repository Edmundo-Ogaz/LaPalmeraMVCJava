package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class ProduccionFuncionarioDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(ProduccionFuncionarioDTO.class);
	
    private String correlativoProduccion="";
    private String rutFuncionario="";
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "insert into ProduccionFuncionario values (";
            	sql = sql + correlativoProduccion +",";
            	sql = sql + "'"+rutFuncionario +"')";
            	//LOGGER.debug(sql);
            	int i = stmt.executeUpdate(sql);
            	
            	if (i == 1)
            		LOGGER.debug("OK");
              
            	stmt.close();
                conn.close();
            }
        } catch (Exception e) {
            LOGGER.error(e,e);
        }
    }

	public String getCorrelativoProduccion() {
		return correlativoProduccion;
	}

	public void setCorrelativoProduccion(String correlativoProduccion) {
		this.correlativoProduccion = correlativoProduccion;
	}

	public String getRutFuncionario() {
		return rutFuncionario;
	}

	public void setRutFuncionario(String rutFuncionario) {
		this.rutFuncionario = rutFuncionario;
	}
} 

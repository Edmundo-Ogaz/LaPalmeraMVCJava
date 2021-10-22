package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class OtraCaracteristicaDTO {
	
	private static final Logger LOGGER = Logger.getLogger(OtraCaracteristicaDTO.class);
	
    private String codigoOtraCaracteristica="";
    private String nombreOtraCaracteristica="";
      
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "insert into otracaracteristica values (";
            	sql = sql + "'"+codigoOtraCaracteristica +"',";
            	sql = sql + "'"+nombreOtraCaracteristica +"')";
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
  
    public void modificar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "update otracaracteristica set ";
            	sql = sql + "codigootracaracteristica = "+"'"+codigoOtraCaracteristica +"', ";
                sql = sql + "nombreotracaracteristica = "+"'"+nombreOtraCaracteristica +"' where codigootracaracteristica = '"+codigoOtraCaracteristica+"'";
                LOGGER.debug(sql);
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
        
    public void eliminar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "delete from otracaracteristica where ";
            	sql = sql + "codigootracaracteristica = '"+codigoOtraCaracteristica +"'";
                LOGGER.debug(sql);
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
  
    public boolean buscar() {
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from otracaracteristica where codigootracaracteristica = '"+codigoOtraCaracteristica+"'";
            	LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	
            	if (rs.next()) {
            		LOGGER.debug("Lo encontro");
            		codigoOtraCaracteristica= rs.getString(1);
            		nombreOtraCaracteristica= rs.getString(2);
            		resultado = true;
            	}
            	rs.close();
            	stmt.close();
            	conn.close();
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return resultado;
	}

	public String getCodigoOtraCaracteristica() {
		return codigoOtraCaracteristica;
	}

	public void setCodigoOtraCaracteristica(String codigoOtraCaracteristica) {
		this.codigoOtraCaracteristica = codigoOtraCaracteristica;
	}

	public String getNombreOtraCaracteristica() {
		return nombreOtraCaracteristica;
	}

	public void setNombreOtraCaracteristica(String nombreOtraCaracteristica) {
		this.nombreOtraCaracteristica = nombreOtraCaracteristica;
	}
} 

package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class RegionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(RegionDTO.class);
	
	private String codigoRegion="";
    private String nombreRegion="";
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "insert into Region values (";
            	sql = sql + "'"+codigoRegion +"',";
            	sql = sql + "'"+nombreRegion +"')";
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
        		String sql = "update region set ";
        		sql = sql + "codigoregion = "+"'"+codigoRegion +"', ";
        		sql = sql + "nombreregion = "+"'"+nombreRegion +"' ";
        		sql = sql + "where codigoregion = "+"'"+codigoRegion+"'";
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
        		String sql = "delete from region where ";
        		sql = sql + "codigoregion = "+"'"+codigoRegion +"'";
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
    			String sql = "select * from region where codigoregion = "+"'"+codigoRegion+"'";
    			LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoRegion= rs.getString(1);
    				nombreRegion= rs.getString(2);
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

	public String getCodigoRegion() {
		return codigoRegion;
	}

	public void setCodigoRegion(String codigoRegion) {
		this.codigoRegion = codigoRegion;
	}

	public String getNombreRegion() {
		return nombreRegion;
	}

	public void setNombreRegion(String nombreRegion) {
		this.nombreRegion = nombreRegion;
	}
} 

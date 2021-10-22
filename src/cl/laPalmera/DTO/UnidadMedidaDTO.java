package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class UnidadMedidaDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(UnidadMedidaDTO.class);
	
    private String codigoUnidadMedida="";
    private String nombreUnidadMedida="";
        
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into unidadmedida values (";
    			sql = sql + "'"+codigoUnidadMedida +"',";
    			sql = sql + "'"+nombreUnidadMedida +"')";
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
            	String sql = "update UnidadMedida set ";
            	sql = sql + "codigounidadmedida = '"+codigoUnidadMedida +"', ";
            	sql = sql + "nombreunidadmedida = "+"'"+nombreUnidadMedida +"' where codigounidadmedida = '"+codigoUnidadMedida+"'";
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
        
    public void eliminar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "delete from unidadmedida where ";
    			sql = sql + "codigounidadmedida = '"+codigoUnidadMedida +"'";
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
  
    public boolean buscar() {
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "select * from unidadmedida where codigounidadmedida = '"+codigoUnidadMedida+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoUnidadMedida= rs.getString(1);
    				nombreUnidadMedida= rs.getString(2);
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

	public String getCodigoUnidadMedida() {
		return codigoUnidadMedida;
	}

	public void setCodigoUnidadMedida(String codigoUnidadMedida) {
		this.codigoUnidadMedida = codigoUnidadMedida;
	}

	public String getNombreUnidadMedida() {
		return nombreUnidadMedida;
	}

	public void setNombreUnidadMedida(String nombreUnidadMedida) {
		this.nombreUnidadMedida = nombreUnidadMedida;
	}
} 

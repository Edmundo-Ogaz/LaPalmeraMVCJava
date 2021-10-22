package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class LineaProduccionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(LineaProduccionDTO.class);
	
    private String codigoLineaProduccion="";
    private String nombreLineaProduccion="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into LineaProduccion values (";
    			sql = sql + "'"+codigoLineaProduccion +"',";
    			sql = sql + "'"+nombreLineaProduccion +"')";
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
    			String sql = "update lineaproduccion set ";
    			sql = sql + "codigolineaproduccion = "+"'"+codigoLineaProduccion +"', ";
    			sql = sql + "nombrelineaproduccion = "+"'"+nombreLineaProduccion +"' where codigolineaproduccion = '"+codigoLineaProduccion+"'";
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
        		String sql = "delete from lineaproduccion where ";
        		sql = sql + "codigolineaproduccion = '"+codigoLineaProduccion +"'";
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
    			String sql = "select * from lineaproduccion where codigolineaproduccion = '"+codigoLineaProduccion+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoLineaProduccion= rs.getString(1);
    				nombreLineaProduccion= rs.getString(2);
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

	public String getCodigoLineaProduccion() {
		return codigoLineaProduccion;
	}

	public void setCodigoLineaProduccion(String codigoLineaProduccion) {
		this.codigoLineaProduccion = codigoLineaProduccion;
	}

	public String getNombreLineaProduccion() {
		return nombreLineaProduccion;
	}

	public void setNombreLineaProduccion(String nombreLineaProduccion) {
		this.nombreLineaProduccion = nombreLineaProduccion;
	}
} 

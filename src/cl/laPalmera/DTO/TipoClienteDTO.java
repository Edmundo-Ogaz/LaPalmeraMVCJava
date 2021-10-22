package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class TipoClienteDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(TipoClienteDTO.class);
	
    private String codigoTipoCliente="";
    private String nombreTipoCliente="";
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "insert into TipoCliente values (";
        		sql = sql + "'"+codigoTipoCliente +"',";
        		sql = sql + "'"+nombreTipoCliente +"')";
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
    			String sql = "update tipocliente set ";
    			sql = sql + "codigotipocliente = '"+codigoTipoCliente +"', ";
    			sql = sql + "nombretipocliente = "+"'"+nombreTipoCliente +"' where codigotipocliente = '"+codigoTipoCliente+"'";
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
        		String sql = "delete from tipocliente where ";
        		sql = sql + "codigotipocliente = '"+codigoTipoCliente +"'";
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
	            String sql = "select * from tipocliente where codigotipocliente = '"+codigoTipoCliente+"'";
	            //LOGGER.debug(sql);
	            ResultSet rs = stmt.executeQuery(sql);
	            if (rs.next()) {
	            	LOGGER.debug("Lo encontro");
	            	codigoTipoCliente= rs.getString(1);
	            	nombreTipoCliente= rs.getString(2);
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

	public String getCodigoTipoCliente() {
		return codigoTipoCliente;
	}

	public void setCodigoTipoCliente(String codigoTipoCliente) {
		this.codigoTipoCliente = codigoTipoCliente;
	}

	public String getNombreTipoCliente() {
		return nombreTipoCliente;
	}

	public void setNombreTipoCliente(String nombreTipoCliente) {
		this.nombreTipoCliente = nombreTipoCliente;
	}
} 

package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class ConfirmacionPedidoDTO {
	
	private static final Logger LOGGER = Logger.getLogger(ConfirmacionPedidoDTO.class);
	
	private String numeroPedido="";
	private String nombreCliente="";
	private String apellidoCliente="";
	private String direccionCliente="";
	private String telefonoCliente="";
            
	public int grabar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "insert into ConfirmacionPedido values (";
        		sql = sql + numeroPedido +",";
        		sql = sql + "'"+nombreCliente +"',";
        		sql = sql + "'"+apellidoCliente+"',";
        		sql = sql + "'"+direccionCliente +"',";
        		sql = sql + telefonoCliente +")";
        		//LOGGER.debug(sql);
        		i = stmt.executeUpdate(sql);
              
        		if (i == 1)
        			LOGGER.debug("OK");
              
        		stmt.close();
        		conn.close();
            }
        } catch (Exception e) {
         	LOGGER.error(e,e);
         	return (i);
        }
        return (i);
    }
  
    public int modificar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "update confirmacionpedido set ";
        		sql = sql + "numeropedido = "+numeroPedido +", ";
        		sql = sql + "nombrecliente = "+"'"+nombreCliente +"', ";
        		sql = sql + "apellidocliente = "+"'"+apellidoCliente +"', ";
        		sql = sql + "direccioncliente = "+"'"+direccionCliente +"', ";
        		sql = sql + "telefonocliente = "+telefonoCliente +" ";
        		sql = sql + " where numeropedido = "+numeroPedido+"";
        		//LOGGER.debug(sql);
        		i = stmt.executeUpdate(sql);
        		
        		if (i == 1)
        			LOGGER.debug("OK");
              
        		stmt.close();
        		conn.close();
            }
        } catch (Exception e) {
         	LOGGER.error(e,e);
            return (i);
        }
        return (i);
    }
        
    public int eliminar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "delete from confirmacionpedido where ";
        		sql = sql + "numeropedido = "+numeroPedido +"";
        		//LOGGER.debug(sql);
        		i = stmt.executeUpdate(sql);
        		
        		if (i == 1)
        			LOGGER.debug("OK");
              
        		stmt.close();
        		conn.close();
            }
        } catch (Exception e) {
         	LOGGER.error(e,e);
         	return (i);
        }
        return (i);
    }
  
    public boolean buscar() {
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "select * from confirmacionpedido where numeropedido = "+numeroPedido+"";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				numeroPedido= rs.getString(1);
    				nombreCliente= rs.getString(2);
    				apellidoCliente=rs.getString(3);
    				direccionCliente=rs.getString(4);
    				telefonoCliente=rs.getString(5);
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

	public String getApellidoCliente() {
		return apellidoCliente;
	}

	public void setApellidoCliente(String apellidoCliente) {
		this.apellidoCliente = apellidoCliente;
	}

	public String getDireccionCliente() {
		return direccionCliente;
	}

	public void setDireccionCliente(String direccionCliente) {
		this.direccionCliente = direccionCliente;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}

	public String getTelefonoCliente() {
		return telefonoCliente;
	}

	public void setTelefonoCliente(String telefonoCliente) {
		this.telefonoCliente = telefonoCliente;
	}
}
  
   

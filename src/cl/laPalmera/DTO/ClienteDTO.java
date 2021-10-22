package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class ClienteDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(ClienteDTO.class);
	
    private String rutCliente="";
    private String nombreCliente="";
    private String direccionCliente="";
    private String codigoComuna="";
    private String fechaNacimientoCliente="";
    private String telefonoCliente="";
    private String emailCliente="";
    private String paginaWebCliente="";
    private String codigoTipoCliente="";
    private String observacionCliente="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into Cliente values (";
    			sql = sql + "'"+rutCliente +"',";
    			sql = sql + "'"+nombreCliente +"',";
    			sql = sql + "'"+direccionCliente +"',";
    			sql = sql + "'"+codigoComuna +"',";
    			sql = sql + "'"+fechaNacimientoCliente +"',";
    			sql = sql + telefonoCliente +",";
    			sql = sql + "'"+emailCliente +"',";
    			sql = sql + "'"+paginaWebCliente +"',";
    			sql = sql + "'"+codigoTipoCliente +"',";
    			sql = sql + "'"+observacionCliente +"')";
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
    			String sql = "update cliente set ";
    			sql = sql + "rutcliente = "+"'"+rutCliente +"', ";
    			sql = sql + "nombrecliente = "+"'"+nombreCliente +"', ";
    			sql = sql + "direccioncliente = "+"'"+direccionCliente +"', ";
    			sql = sql + "codigocomuna = "+"'"+codigoComuna +"', ";
    			sql = sql + "fechanacimientocliente = "+"'"+fechaNacimientoCliente +"', ";
    			sql = sql + "telefonocliente = "+telefonoCliente +", ";
    			sql = sql + "emailcliente = "+"'"+emailCliente +"', ";
    			sql = sql + "paginawebcliente = "+"'"+paginaWebCliente +"', ";
    			sql = sql + "codigotipocliente = "+"'"+codigoTipoCliente +"', ";
    			sql = sql + "observacion = "+"'"+observacionCliente +"' where rutcliente = '"+rutCliente+"'";
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
            	String sql = "delete from cliente where ";
            	sql = sql + "rutcliente = '"+rutCliente +"'";
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
    			String sql = "select * from cliente where rutcliente = '"+rutCliente+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				rutCliente= rs.getString(1);
    				nombreCliente= rs.getString(2);
    				direccionCliente= rs.getString(3);
    				codigoComuna= rs.getString(4);
    				fechaNacimientoCliente= rs.getString(5);
    				telefonoCliente= rs.getString(6);
    				emailCliente= rs.getString(7);
    				paginaWebCliente= rs.getString(8);
    				codigoTipoCliente= rs.getString(9);
    				observacionCliente= rs.getString(10);
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

	public String getCodigoComuna() {
		return codigoComuna;
	}

	public void setCodigoComuna(String codigoComuna) {
		this.codigoComuna = codigoComuna;
	}

	public String getCodigoTipoCliente() {
		return codigoTipoCliente;
	}

	public void setCodigoTipoCliente(String codigoTipoCliente) {
		this.codigoTipoCliente = codigoTipoCliente;
	}

	public String getDireccionCliente() {
		return direccionCliente;
	}

	public void setDireccionCliente(String direccionCliente) {
		this.direccionCliente = direccionCliente;
	}

	public String getEmailCliente() {
		return emailCliente;
	}

	public void setEmailCliente(String emailCliente) {
		this.emailCliente = emailCliente;
	}

	public String getFechaNacimientoCliente() {
		return fechaNacimientoCliente;
	}

	public void setFechaNacimientoCliente(String fechaNacimientoCliente) {
		this.fechaNacimientoCliente = fechaNacimientoCliente;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getObservacionCliente() {
		return observacionCliente;
	}

	public void setObservacionCliente(String observacionCliente) {
		this.observacionCliente = observacionCliente;
	}

	public String getPaginaWebCliente() {
		return paginaWebCliente;
	}

	public void setPaginaWebCliente(String paginaWebCliente) {
		this.paginaWebCliente = paginaWebCliente;
	}

	public String getRutCliente() {
		return rutCliente;
	}

	public void setRutCliente(String rutCliente) {
		this.rutCliente = rutCliente;
	}

	public String getTelefonoCliente() {
		return telefonoCliente;
	}

	public void setTelefonoCliente(String telefonoCliente) {
		this.telefonoCliente = telefonoCliente;
	}
} 

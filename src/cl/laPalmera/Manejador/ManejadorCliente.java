package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ClienteDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorCliente { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorCliente.class);
	
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
      
    public ArrayList consultar() {
        ArrayList<ClienteDTO> vec = new ArrayList<ClienteDTO>();
        try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String sql = "select * from Cliente where 1 = 1 ";
              
                if (!rutCliente.equals(""))
                	sql = sql +"     and rutCliente = '"+rutCliente+"'";
              
                if (!nombreCliente.equals(""))
                	sql = sql +"     and nombreCliente = '"+nombreCliente+"'";
              
                if (!direccionCliente.equals(""))
                	sql = sql +"     and direccionCliente = '"+direccionCliente+"'";
              
                if (!codigoComuna.equals(""))
                	sql = sql +"     and codigoComuna = '"+codigoComuna+"'";

                if (!fechaNacimientoCliente.equals(""))
                	sql = sql +"     and fechaNacimientoCliente = "+fechaNacimientoCliente;

                if (!telefonoCliente.equals(""))
                	sql = sql +"     and telefonoCliente = "+telefonoCliente;

                if (!emailCliente.equals(""))
                	sql = sql +"     and emailCliente = '"+emailCliente+"'";
              
                if (!paginaWebCliente.equals(""))
                	sql = sql +"     and paginaWebCliente = '"+paginaWebCliente+"'";
              
                if (!codigoTipoCliente.equals(""))
                	sql = sql +"     and codigoTipoCliente = '"+codigoTipoCliente+"'";

                if (!observacionCliente.equals(""))
                	sql = sql +"     and observacionCliente = '"+observacionCliente+"'";

                //LOGGER.debug(sql);
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                	ClienteDTO puntero = new ClienteDTO();
                	puntero.setRutCliente(rs.getString(1));
                	puntero.setNombreCliente(rs.getString(2));
                	puntero.setDireccionCliente(rs.getString(3));
                	puntero.setCodigoComuna(rs.getString(4));
                	puntero.setFechaNacimientoCliente(rs.getString(5));
                	puntero.setTelefonoCliente(rs.getString(6));
                	puntero.setEmailCliente(rs.getString(7));
                	puntero.setPaginaWebCliente(rs.getString(8));
                	puntero.setCodigoTipoCliente(rs.getString(9));
                	puntero.setObservacionCliente(rs.getString(10));
                    vec.add(puntero);
                }
                stmt.close();
                conn.close();
            }  
        } catch (Exception e) {
    	    LOGGER.error(e,e);
        }
        return vec;
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

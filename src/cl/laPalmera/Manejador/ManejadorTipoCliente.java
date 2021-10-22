package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.TipoClienteDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorTipoCliente {
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorTipoCliente.class);
	
    private String codigoTipoCliente="";
    private String nombreTipoCliente="";
    
    public ArrayList consultar() {
        ArrayList<TipoClienteDTO> vec = new ArrayList<TipoClienteDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from TipoCliente where 1 = 1 ";
            	
            	if (!codigoTipoCliente.equals(""))
            		sql = sql +"     and codigoTipoCliente = '"+codigoTipoCliente+"'";

            	if (!nombreTipoCliente.equals(""))
            		sql = sql +"     and nombreTipoCliente = '"+nombreTipoCliente+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		TipoClienteDTO puntero = new TipoClienteDTO();
            		puntero.setCodigoTipoCliente(rs.getString(1));
            		puntero.setNombreTipoCliente(rs.getString(2));
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

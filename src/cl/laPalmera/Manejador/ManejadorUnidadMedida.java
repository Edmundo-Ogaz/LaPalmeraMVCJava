package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.UnidadMedidaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorUnidadMedida { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorUnidadMedida.class);
	
    private String codigoUnidadMedida="";
    private String nombreUnidadMedida="";
    
    public ArrayList consultar() {
    	ArrayList<UnidadMedidaDTO> vec = new ArrayList<UnidadMedidaDTO>();
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from UnidadMedida where 1 = 1 ";
              
            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigoUnidadMedida = '"+codigoUnidadMedida+"'";

            	if (!nombreUnidadMedida.equals(""))
            		sql = sql +"     and nombreUnidadMedida = "+"'"+nombreUnidadMedida+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                	UnidadMedidaDTO puntero = new UnidadMedidaDTO();
                	puntero.setCodigoUnidadMedida(rs.getString(1));
                	puntero.setNombreUnidadMedida(rs.getString(2));
                	vec.add(puntero);
                }
            }
        } catch (Exception e) {
    	    LOGGER.error(e,e);
        }   
        return vec;
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

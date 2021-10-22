package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.OtraCaracteristicaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorOtraCaracteristica { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorOtraCaracteristica.class);
	
    private String codigoOtraCaracteristica="";
    private String nombreOtraCaracteristica="";
    
    public ArrayList consultar() {
        ArrayList<OtraCaracteristicaDTO> vec = new ArrayList<OtraCaracteristicaDTO>();
        try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
                Statement stmt = conn.createStatement();
            	String sql = "select * from OtraCaracteristica where 1 = 1 ";
              
            	if (!codigoOtraCaracteristica.equals(""))
            		sql = sql +"     and codigoOtraCaracteristica = '"+codigoOtraCaracteristica+"'";

            	if (!nombreOtraCaracteristica.equals(""))
            		sql = sql +"     and nombreOtraCaracteristica = '"+nombreOtraCaracteristica+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		OtraCaracteristicaDTO puntero = new OtraCaracteristicaDTO();
            		puntero.setCodigoOtraCaracteristica(rs.getString(1));
            		puntero.setNombreOtraCaracteristica(rs.getString(2));
            		vec.add(puntero);
                }
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return vec;
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

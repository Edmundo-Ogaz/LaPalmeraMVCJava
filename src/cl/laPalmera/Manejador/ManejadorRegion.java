package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.RegionDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorRegion { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorRegion.class);
	
    private String codigoRegion="";
    private String nombreRegion="";
    
    public ArrayList<RegionDTO> consultar() {
        ArrayList<RegionDTO> vec = new ArrayList<RegionDTO>();
      	try {
      	    ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Region where 1 = 1 ";
              
            	if (!codigoRegion.equals(""))
            		sql = sql +"     and codigoRegion = "+"'"+codigoRegion+"'";

            	if (!nombreRegion.equals(""))
            		sql = sql +"     and nombreRegion = '"+nombreRegion+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		RegionDTO puntero = new RegionDTO();
            		puntero.setCodigoRegion(rs.getString(1));
            		puntero.setNombreRegion(rs.getString(2));
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

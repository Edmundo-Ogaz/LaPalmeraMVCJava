package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.CiudadDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorCiudad {
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorCiudad.class);
	
    private String codigoCiudad="";
    private String nombreCiudad="";
	private String codigoRegion="";
    
	public ArrayList consultar() {
        ArrayList<CiudadDTO> vec = new ArrayList<CiudadDTO>();
	  	try {   
	  	    ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
	  		Connection conn = connLaPalmera.conectionMySql();
	    	if (conn != null) {
	  	        Statement stmt = conn.createStatement();
		        String sql = "select * from Ciudad where 1 = 1 ";
	            
	            if (!codigoCiudad.equals(""))
	                sql = sql +"     and codigoCiudad = '"+codigoCiudad+"'";
	
	            if (!nombreCiudad.equals(""))
	                sql = sql +"     and nombreCiudad = '"+nombreCiudad+"'";
	            
	            if (!codigoRegion.equals(""))
	                sql = sql +"     and codigoRegion = '"+codigoRegion+"'";
	
	            //LOGGER.debug(sql);
	            ResultSet rs = stmt.executeQuery(sql);
	            while (rs.next()) {
	                CiudadDTO puntero = new CiudadDTO();
	                puntero.setCodigoCiudad(rs.getString(1));
	                puntero.setNombreCiudad(rs.getString(2));
	                puntero.setCodigoRegion(rs.getString(3));
	                vec.add(puntero);
	            }
	            stmt.close();
	            conn.close();
	  		}        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	    
        return vec;
    }
	  
    public String getCodigoCiudad() {
		return codigoCiudad;
	}

	public void setCodigoCiudad(String codigoCiudad) {
		this.codigoCiudad = codigoCiudad;
	}

	public String getCodigoRegion() {
		return codigoRegion;
	}

	public void setCodigoRegion(String codigoRegion) {
		this.codigoRegion = codigoRegion;
	}

	public String getNombreCiudad() {
		return nombreCiudad;
	}

	public void setNombreCiudad(String nombreCiudad) {
		this.nombreCiudad = nombreCiudad;
	}
} 

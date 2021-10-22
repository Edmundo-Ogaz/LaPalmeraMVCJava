package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ComunaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorComuna { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorComuna.class);
	
    private String codigoComuna="";
    private String nombreComuna="";
    private String codigoCiudad="";
    
    public ArrayList consultar() {        
        ArrayList<ComunaDTO> vec = new ArrayList<ComunaDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Comuna where 1 = 1 ";
            	
            	if (!codigoComuna.equals(""))
            		sql = sql +"     and codigoComuna = '"+codigoComuna+"'";

            	if (!nombreComuna.equals(""))
            		sql = sql +"     and nombreComuna = '"+nombreComuna+"'";
            	
            	if (!codigoCiudad.equals(""))
            		sql = sql +"     and codigoCiudad = '"+codigoCiudad+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		ComunaDTO puntero = new ComunaDTO();
            		puntero.setCodigoComuna(rs.getString(1));
            		puntero.setNombreComuna(rs.getString(2));
            		puntero.setCodigoCiudad(rs.getString(3));
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

	public String getCodigoCiudad() {
		return codigoCiudad;
	}

	public void setCodigoCiudad(String codigoCiudad) {
		this.codigoCiudad = codigoCiudad;
	}

	public String getCodigoComuna() {
		return codigoComuna;
	}

	public void setCodigoComuna(String codigoComuna) {
		this.codigoComuna = codigoComuna;
	}

	public String getNombreComuna() {
		return nombreComuna;
	}

	public void setNombreComuna(String nombreComuna) {
		this.nombreComuna = nombreComuna;
	}
} 

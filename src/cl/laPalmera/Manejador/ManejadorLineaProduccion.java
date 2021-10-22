package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.LineaProduccionDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorLineaProduccion { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorLineaProduccion.class);
	
    private String codigoLineaProduccion="";
    private String nombreLineaProduccion="";
    
    public ArrayList consultar() {
        ArrayList<LineaProduccionDTO> vec = new ArrayList<LineaProduccionDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from LineaProduccion where 1 = 1 ";
              
            	if (!codigoLineaProduccion.equals(""))
            		sql = sql +"     and codigoLineaProduccion = '"+codigoLineaProduccion+"'";

            	if (!nombreLineaProduccion.equals(""))
            		sql = sql +"     and nombreLineaProduccion = '"+nombreLineaProduccion+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		LineaProduccionDTO puntero = new LineaProduccionDTO();
            		puntero.setCodigoLineaProduccion(rs.getString(1));
            		puntero.setNombreLineaProduccion(rs.getString(2));
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

	public String getCodigoLineaProduccion() {
		return codigoLineaProduccion;
	}

	public void setCodigoLineaProduccion(String codigoLineaProduccion) {
		this.codigoLineaProduccion = codigoLineaProduccion;
	}

	public String getNombreLineaProduccion() {
		return nombreLineaProduccion;
	}

	public void setNombreLineaProduccion(String nombreLineaProduccion) {
		this.nombreLineaProduccion = nombreLineaProduccion;
	}
} 

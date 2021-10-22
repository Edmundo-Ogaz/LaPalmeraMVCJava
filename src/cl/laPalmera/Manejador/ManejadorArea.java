package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.AreaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorArea { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorArea.class);
	
	private String codigoArea="";
    private String nombreArea="";
      
    public ArrayList consultar() {        
      	ArrayList<AreaDTO> vec = new ArrayList<AreaDTO>();
      	try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
      	    if (conn != null) {
                Statement stmt = conn.createStatement();
                String sql = "select * from Area where 1 = 1 ";
              
                if (!codigoArea.equals(""))
                    sql = sql +"     and codigoArea = '"+codigoArea+"'";

                if (!nombreArea.equals(""))
                    sql = sql +"     and nombreArea = '"+nombreArea+"'";

                //LOGGER.debug(sql);
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    AreaDTO puntero = new AreaDTO();
                    puntero.setCodigoArea(rs.getString(1));
                    puntero.setNombreArea(rs.getString(2));
                    vec.add(puntero);
                }
            stmt.close();
            conn.close();
        }
    } catch (Exception e) {LOGGER.error(e,e);}
        return vec;
    }

	public String getCodigoArea() {
		return codigoArea;
	}

	public void setCodigoArea(String codigoArea) {
		this.codigoArea = codigoArea;
	}

	public String getNombreArea() {
		return nombreArea;
	}

	public void setNombreArea(String nombreArea) {
		this.nombreArea = nombreArea;
	}
}   

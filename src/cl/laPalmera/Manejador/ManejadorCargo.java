package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.CargoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorCargo { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorCargo.class);
	
    private String codigoCargo="";
    private String nombreCargo="";
      
    public ArrayList consultar() {
        ArrayList<CargoDTO> vec = new ArrayList<CargoDTO>();
      	try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String sql = "select * from Cargo where 1 = 1 ";
                
                if (!codigoCargo.equals(""))
                	sql = sql +"     and codigoCargo = '"+codigoCargo+"'";

                if (!nombreCargo.equals(""))
                	sql = sql +"     and nombreCargo = '"+nombreCargo+"'";

                //LOGGER.debug(sql);
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                	CargoDTO puntero = new CargoDTO();
                	puntero.setCodigoCargo(rs.getString(1));
                	puntero.setNombreCargo(rs.getString(2));
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

	public String getCodigoCargo() {
		return codigoCargo;
	}

	public void setCodigoCargo(String codigoCargo) {
		this.codigoCargo = codigoCargo;
	}

	public String getNombreCargo() {
		return nombreCargo;
	}

	public void setNombreCargo(String nombreCargo) {
		this.nombreCargo = nombreCargo;
	}
} 

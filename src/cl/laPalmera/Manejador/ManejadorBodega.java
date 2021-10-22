package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.BodegaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorBodega { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorBodega.class);
	
    private String codigoBodega="";
    private String nombreBodega="";
      
    public ArrayList consultar() {
        ArrayList<BodegaDTO> vec = new ArrayList<BodegaDTO>();
        try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
	        if (conn != null) {
	            Statement stmt = conn.createStatement();
	            String sql = "select * from Bodega where 1 = 1 ";
	            
	            if (!codigoBodega.equals(""))
	                sql = sql +"     and codigoBodega = '"+codigoBodega+"'";
	
	            if (!nombreBodega.equals(""))
	            	sql = sql +"     and nombreBodega = '"+nombreBodega+"'";
	
	            //LOGGER.debug(sql);
	            ResultSet rs = stmt.executeQuery(sql);
	            while (rs.next()) {
	            	BodegaDTO puntero = new BodegaDTO();
	            	puntero.setCodigoBodega(rs.getString(1));
	            	puntero.setNombreBodega(rs.getString(2));
	            	vec.add(puntero);
	            }
	            stmt.close();
	            conn.close();
	        }
        } catch (Exception e) {LOGGER.error(e,e);
    
        }
        return vec;
    }

	public String getCodigoBodega() {
		return codigoBodega;
	}

	public void setCodigoBodega(String codigoBodega) {
		this.codigoBodega = codigoBodega;
	}

	public String getNombreBodega() {
		return nombreBodega;
	}

	public void setNombreBodega(String nombreBodega) {
		this.nombreBodega = nombreBodega;
	}
} 

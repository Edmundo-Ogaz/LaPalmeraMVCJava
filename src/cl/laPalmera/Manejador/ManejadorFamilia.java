package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.FamiliaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorFamilia {
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorFamilia.class);
	
    private String codigoFamilia="";
    private String nombreFamilia="";
      
    public ArrayList consultar() {
		ArrayList<FamiliaDTO> vec = new ArrayList<FamiliaDTO>();
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
                String sql = "select * from familia where 1 = 1 ";
            
                if (!codigoFamilia.equals(""))
                	sql = sql +"     and codigofamilia = '"+codigoFamilia+"'";

                if (!nombreFamilia.equals(""))
                	sql = sql +"     and nombrefamilia = '"+nombreFamilia+"'";
           
                //LOGGER.debug(sql);
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                	FamiliaDTO puntero = new FamiliaDTO();
                	puntero.setCodigoFamilia(rs.getString(1));
                	puntero.setNombreFamilia(rs.getString(2));
                    vec.add(puntero);
                }
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return vec;
    }

	public String getCodigoFamilia() {
		return codigoFamilia;
	}

	public void setCodigoFamilia(String codigoFamilia) {
		this.codigoFamilia = codigoFamilia;
	}

	public String getNombreFamilia() {
		return nombreFamilia;
	}

	public void setNombreFamilia(String nombreFamilia) {
		this.nombreFamilia = nombreFamilia;
	}
} 

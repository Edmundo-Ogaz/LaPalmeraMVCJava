package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.SubfamiliaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorSubfamilia { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorSubfamilia.class);
	
    private String codigoSubfamilia="";
    private String nombreSubfamilia="";
    private String codigoFamilia="";
    
    public ArrayList consultar() {
        ArrayList<SubfamiliaDTO> vec = new ArrayList<SubfamiliaDTO>();
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Subfamilia where 1 = 1 ";
              
            	if (!codigoSubfamilia.equals(""))
            		sql = sql +"     and codigoSubfamilia = '"+codigoSubfamilia+"'";

            	if (!nombreSubfamilia.equals(""))
            		sql = sql +"     and nombreSubfamilia = '"+nombreSubfamilia+"'";
            	
            	if (!codigoFamilia.equals(""))
            		sql = sql +"     and codigoFamilia = '"+codigoFamilia+"'";
                
            	LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		SubfamiliaDTO puntero = new SubfamiliaDTO();
            		puntero.setCodigoSubfamilia(rs.getString(1));
            		puntero.setNombreSubfamilia(rs.getString(2));
            		puntero.setCodigoFamilia(rs.getString(3));
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

	public String getCodigoSubfamilia() {
		return codigoSubfamilia;
	}

	public void setCodigoSubfamilia(String codigoSubfamilia) {
		this.codigoSubfamilia = codigoSubfamilia;
	}

	public String getNombreSubfamilia() {
		return nombreSubfamilia;
	}

	public void setNombreSubfamilia(String nombreSubfamilia) {
		this.nombreSubfamilia = nombreSubfamilia;
	}
} 

package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ConceptoTecnicoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorConceptoTecnico { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorConceptoTecnico.class);
	
    private String codigoConceptoTecnico="";
    private String nombreConceptoTecnico="";
      
    public ArrayList consultar() {        
    	ArrayList<ConceptoTecnicoDTO> vec = new ArrayList<ConceptoTecnicoDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from ConceptoTecnico where 1 = 1 ";
            	
            	if (!codigoConceptoTecnico.equals(""))
            		sql = sql +"     and codigoConceptoTecnico = "+codigoConceptoTecnico;

            	if (!nombreConceptoTecnico.equals(""))
            		sql = sql +"     and nombreConceptoTecnico = '"+nombreConceptoTecnico+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		ConceptoTecnicoDTO puntero = new ConceptoTecnicoDTO();
            		puntero.setCodigoConceptoTecnico(rs.getString(1));
            		puntero.setNombreConceptoTecnico(rs.getString(2));
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

	public String getCodigoConceptoTecnico() {
		return codigoConceptoTecnico;
	}

	public void setCodigoConceptoTecnico(String codigoConceptoTecnico) {
		this.codigoConceptoTecnico = codigoConceptoTecnico;
	}

	public String getNombreConceptoTecnico() {
		return nombreConceptoTecnico;
	}

	public void setNombreConceptoTecnico(String nombreConceptoTecnico) {
		this.nombreConceptoTecnico = nombreConceptoTecnico;
	}
} 

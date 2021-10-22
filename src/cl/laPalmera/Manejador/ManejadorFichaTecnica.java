package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.FichaTecnicaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorFichaTecnica { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorFichaTecnica.class);
	
    private String codigoProducto="";
    private String codigoConceptoTecnico="";
    private String descripcionFichaTecnica="";
      
    public ArrayList consultar() {
        ArrayList<FichaTecnicaDTO> vec = new ArrayList<FichaTecnicaDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from FichaTecnica where 1 = 1 ";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";

            	if (!codigoConceptoTecnico.equals(""))
            		sql = sql +"     and codigoConceptoTecnico = '"+codigoConceptoTecnico+"'";

            	if (!descripcionFichaTecnica.equals(""))
            		sql = sql +"     and descripcionFichaTecnica = '"+descripcionFichaTecnica+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		FichaTecnicaDTO puntero = new FichaTecnicaDTO();
            		puntero.setCodigoProducto(rs.getString(1));
            		puntero.setCodigoConceptoTecnico(rs.getString(2));
            		puntero.setDescripcionFichaTecnica(rs.getString(3));
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

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getDescripcionFichaTecnica() {
		return descripcionFichaTecnica;
	}

	public void setDescripcionFichaTecnica(String descripcionFichaTecnica) {
		this.descripcionFichaTecnica = descripcionFichaTecnica;
	}
} 

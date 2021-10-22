package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.InsumoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorInsumo { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorInsumo.class);
	
    private String codigoInsumo="";
    private String nombreInsumo="";
    private String codigoUnidadMedida="";
    private String stockCriticoInsumo="";
    private String pesoInsumo="";
    private String observacionInsumo="";
    
    public ArrayList consultar() {
        ArrayList<InsumoDTO> vec = new ArrayList<InsumoDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Insumo where 1 = 1 ";
              
            	if (!codigoInsumo.equals(""))
            		sql = sql +"     and codigoInsumo = '"+codigoInsumo+"'";

            	if (!nombreInsumo.equals(""))
            		sql = sql +"     and nombreInsumo = '"+nombreInsumo+"'";
              
            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigoUnidadMedida = '"+codigoUnidadMedida+"'";

            	if (!stockCriticoInsumo.equals(""))
            		sql = sql +"     and stockCriticoInsumo = "+stockCriticoInsumo;
              
            	if (!pesoInsumo.equals(""))
            		sql = sql +"     and pesoInsumo = "+pesoInsumo;

            	if (!observacionInsumo.equals(""))
            		sql = sql +"     and observacionInsumo = '"+observacionInsumo+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		InsumoDTO puntero = new InsumoDTO();
            		puntero.setCodigoInsumo(rs.getString(1));
            		puntero.setNombreInsumo(rs.getString(2));
            		puntero.setCodigoUnidadMedida(rs.getString(3));
            		puntero.setStockCriticoInsumo(rs.getString(4));
            		puntero.setPesoInsumo(rs.getString(5));
            		puntero.setObservacionInsumo(rs.getString(10));
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

	public String getCodigoInsumo() {
		return codigoInsumo;
	}

	public void setCodigoInsumo(String codigoInsumo) {
		this.codigoInsumo = codigoInsumo;
	}

	public String getCodigoUnidadMedida() {
		return codigoUnidadMedida;
	}

	public void setCodigoUnidadMedida(String codigoUnidadMedida) {
		this.codigoUnidadMedida = codigoUnidadMedida;
	}

	public String getNombreInsumo() {
		return nombreInsumo;
	}

	public void setNombreInsumo(String nombreInsumo) {
		this.nombreInsumo = nombreInsumo;
	}

	public String getObservacionInsumo() {
		return observacionInsumo;
	}

	public void setObservacionInsumo(String observacionInsumo) {
		this.observacionInsumo = observacionInsumo;
	}

	public String getPesoInsumo() {
		return pesoInsumo;
	}

	public void setPesoInsumo(String pesoInsumo) {
		this.pesoInsumo = pesoInsumo;
	}

	public String getStockCriticoInsumo() {
		return stockCriticoInsumo;
	}

	public void setStockCriticoInsumo(String stockCriticoInsumo) {
		this.stockCriticoInsumo = stockCriticoInsumo;
	}
} 

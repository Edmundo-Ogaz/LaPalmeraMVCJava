package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class DetalleDevolucionInsumoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(DetalleDevolucionInsumoDTO.class);
	
    private String correlativoDevolucionInsumo="";
    private String codigoInsumo="";
    private String cantidadDevolucionInsumo="";
    private String codigoUnidadMedida="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into DetalleDevolucionInsumo values (";
    			sql = sql + correlativoDevolucionInsumo +",";
    			sql = sql + "'"+codigoInsumo +"',";
    			sql = sql + cantidadDevolucionInsumo +",";
    			sql = sql + "'"+codigoUnidadMedida +"')";
    			//LOGGER.debug(sql);
    			int i = stmt.executeUpdate(sql);
               
    			if (i == 1)
    				LOGGER.debug("OK");
    			
    			stmt.close();
    			conn.close();
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
    }

	public String getCantidadDevolucionInsumo() {
		return cantidadDevolucionInsumo;
	}

	public void setCantidadDevolucionInsumo(String cantidadDevolucionInsumo) {
		this.cantidadDevolucionInsumo = cantidadDevolucionInsumo;
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

	public String getCorrelativoDevolucionInsumo() {
		return correlativoDevolucionInsumo;
	}

	public void setCorrelativoDevolucionInsumo(String correlativoDevolucionInsumo) {
		this.correlativoDevolucionInsumo = correlativoDevolucionInsumo;
	}
} 

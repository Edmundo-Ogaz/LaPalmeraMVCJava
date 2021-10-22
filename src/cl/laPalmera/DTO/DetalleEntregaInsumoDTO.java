package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class DetalleEntregaInsumoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(DetalleEntregaInsumoDTO.class);
	
    private String correlativoEntregaInsumo="";
    private String codigoInsumo="";
    private String cantidadEntregaInsumo="";
    private String codigoUnidadMedida="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into DetalleEntregaInsumo values (";
    			sql = sql + correlativoEntregaInsumo +",";
    			sql = sql + "'"+codigoInsumo +"',";
    			sql = sql + cantidadEntregaInsumo +",";
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

	public String getCantidadEntregaInsumo() {
		return cantidadEntregaInsumo;
	}

	public void setCantidadEntregaInsumo(String cantidadEntregaInsumo) {
		this.cantidadEntregaInsumo = cantidadEntregaInsumo;
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

	public String getCorrelativoEntregaInsumo() {
		return correlativoEntregaInsumo;
	}

	public void setCorrelativoEntregaInsumo(String correlativoEntregaInsumo) {
		this.correlativoEntregaInsumo = correlativoEntregaInsumo;
	}
} 

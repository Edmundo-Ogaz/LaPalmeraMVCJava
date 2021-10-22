package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.DetalleDevolucionInsumoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorDetalleDevolucionInsumo { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorDetalleDevolucionInsumo.class);
	
    private String correlativoDevolucionInsumo="";
    private String codigoInsumo="";
    private String cantidadDevolucionInsumo="";
    private String codigoUnidadMedida="";
      
    public ArrayList consultar() {
    	ArrayList<DetalleDevolucionInsumoDTO> vec = new ArrayList<DetalleDevolucionInsumoDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) { 
            	Statement stmt = conn.createStatement();
            	String sql = "select * from DetalleDevolucionInsumo where 1 = 1 ";
              
            	if (!correlativoDevolucionInsumo.equals(""))
            		sql = sql +"     and correlativoDevolucionInsumo = "+correlativoDevolucionInsumo;

            	if (!codigoInsumo.equals(""))
            		sql = sql +"     and codigoInsumo = '"+codigoInsumo+"'";
            	
            	if (!cantidadDevolucionInsumo.equals(""))
            		sql = sql +"     and cantidadDevolucionInsumo = "+cantidadDevolucionInsumo;

            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigoUnidadMedida = '"+codigoUnidadMedida+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		DetalleDevolucionInsumoDTO puntero = new DetalleDevolucionInsumoDTO();
            		puntero.setCorrelativoDevolucionInsumo(rs.getString(1));
            		puntero.setCodigoInsumo(rs.getString(2));
            		puntero.setCantidadDevolucionInsumo(rs.getString(3));
            		puntero.setCodigoUnidadMedida(rs.getString(4));
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

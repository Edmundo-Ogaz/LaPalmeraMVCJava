package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.DetalleEntregaInsumoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorDetalleEntregaInsumo { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorDetalleEntregaInsumo.class);
	
    private String correlativoEntregaInsumo="";
    private String codigoInsumo="";
    private String cantidadEntregaInsumo="";
    private String codigoUnidadMedida="";
      
    public ArrayList consultar() {
        ArrayList<DetalleEntregaInsumoDTO> vec = new ArrayList<DetalleEntregaInsumoDTO>();
      	try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from DetalleEntregaInsumo where 1 = 1 ";
            	
            	if (!correlativoEntregaInsumo.equals(""))
            		sql = sql +"     and correlativoEntregaInsumo = "+correlativoEntregaInsumo;
              
            	if (!codigoInsumo.equals(""))
            		sql = sql +"     and codigoInsumo = '"+codigoInsumo+"'";
              
            	if (!cantidadEntregaInsumo.equals(""))
            		sql = sql +"     and cantidadEntregaInsumo = "+cantidadEntregaInsumo;

            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigoUnidadMedida = '"+codigoUnidadMedida+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		DetalleEntregaInsumoDTO puntero = new DetalleEntregaInsumoDTO();
            		puntero.setCorrelativoEntregaInsumo(rs.getString(1));
            		puntero.setCodigoInsumo(rs.getString(2));
            		puntero.setCantidadEntregaInsumo(rs.getString(3));
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

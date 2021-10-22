package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.StockDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorStock { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorStock.class);
	
    private String codigoProducto="";
    private String stockDisponible="";
    private String stockComprometido="";
    private String codigoUnidadMedida="";
    
    public ArrayList consultar() {
        ArrayList<StockDTO> vec = new ArrayList<StockDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Stock where 1 = 1 ";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";
              
            	if (!stockDisponible.equals(""))
            		sql = sql +"     and stockdisponible = "+stockDisponible;

            	if (!stockComprometido.equals(""))
            		sql = sql +"     and stockComprometido = "+stockComprometido;

            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigoUnidadMedida = '"+codigoUnidadMedida+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		StockDTO puntero = new StockDTO();
            		puntero.setCodigoProducto(rs.getString(1));
            		puntero.setStockDisponible(rs.getString(2));
            		puntero.setStockComprometido(rs.getString(3));
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

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getCodigoUnidadMedida() {
		return codigoUnidadMedida;
	}

	public void setCodigoUnidadMedida(String codigoUnidadMedida) {
		this.codigoUnidadMedida = codigoUnidadMedida;
	}

	public String getStockComprometido() {
		return stockComprometido;
	}

	public void setStockComprometido(String stockComprometido) {
		this.stockComprometido = stockComprometido;
	}

	public String getStockDisponible() {
		return stockDisponible;
	}

	public void setStockDisponible(String stockDisponible) {
		this.stockDisponible = stockDisponible;
	}
} 

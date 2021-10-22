package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ProductoLineaDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorProductoLinea { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorProductoLinea.class);
	
    private String codigoProducto="";
    private String codigoLineaProduccion="";
    
    public ArrayList consultar() {
        ArrayList<ProductoLineaDTO> vec = new ArrayList<ProductoLineaDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from ProductoLinea where 1 = 1 ";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";

            	if (!codigoLineaProduccion.equals(""))
            		sql = sql +"     and codigolineaProduccion = '"+codigoLineaProduccion+"'";
              
            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		ProductoLineaDTO puntero = new ProductoLineaDTO();
            		puntero.setCodigoProducto(rs.getString(1));
            		puntero.setCodigoLineaProduccion(rs.getString(2));
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

	public String getCodigoLineaProduccion() {
		return codigoLineaProduccion;
	}

	public void setCodigoLineaProduccion(String codigoLineaProduccion) {
		this.codigoLineaProduccion = codigoLineaProduccion;
	}

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}
} 

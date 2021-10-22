package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.DetallePedidoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorDetallePedido { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorDetallePedido.class);
	
    private String numeroPedido="";
    private String codigoProducto="";
    private String precioProducto="";
    private String cantidadProducto="";
      
    public ArrayList consultar() {
        ArrayList<DetallePedidoDTO> vec = new ArrayList<DetallePedidoDTO>();
      	try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from DetallePedido where 1 = 1 ";
              
            	if (!numeroPedido.equals(""))
            		sql = sql +"     and numeroPedido = "+numeroPedido;

            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = "+codigoProducto;

            	if (!precioProducto.equals(""))
            		sql = sql +"     and precioProducto = "+precioProducto;

            	if (!cantidadProducto.equals(""))
            		sql = sql +"     and cantidadProducto = "+cantidadProducto;

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		DetallePedidoDTO puntero = new DetallePedidoDTO();
            		puntero.setNumeroPedido(rs.getString(1));
            		puntero.setCodigoProducto(rs.getString(2));
            		puntero.setPrecioProducto(rs.getString(3));
            		puntero.setCantidadProducto(rs.getString(4));
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

	public String getCantidadProducto() {
		return cantidadProducto;
	}

	public void setCantidadProducto(String cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}

	public String getPrecioProducto() {
		return precioProducto;
	}

	public void setPrecioProducto(String precioProducto) {
		this.precioProducto = precioProducto;
	}
} 

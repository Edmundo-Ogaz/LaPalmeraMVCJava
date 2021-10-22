package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.OrdenFabricacionDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorOrdenFabricacion { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorOrdenFabricacion.class);
	
    private String codigoOrdenFabricacion="";
    private String fechaIngresoOrdenFabricacion="";
    private String horaIngresoOrdenFabricacion="";
    private String numeroPedido="";
    private String codigoProducto="";
    private String cantidadProducto="";
    
    public ArrayList consultar() {
        ArrayList<OrdenFabricacionDTO> vec = new ArrayList<OrdenFabricacionDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from OrdenFabricacion where 1 = 1 ";
              
            	if (!codigoOrdenFabricacion.equals(""))
            		sql = sql +"     and codigoOrdenFabricacion = '"+codigoOrdenFabricacion+"'";

            	if (!fechaIngresoOrdenFabricacion.equals(""))
            		sql = sql +"     and fechaIngresoOrdenFabricacion = '"+fechaIngresoOrdenFabricacion+"'";

            	if (!horaIngresoOrdenFabricacion.equals(""))
            		sql = sql +"     and horaIngresoOrdenFabricacion = '"+horaIngresoOrdenFabricacion+"'";
              
            	if (!numeroPedido.equals(""))
            		sql = sql +"     and numeroPedido = "+numeroPedido;

            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";
              
            	if (!cantidadProducto.equals(""))
            		sql = sql +"     and cantidadProducto = "+cantidadProducto;

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		OrdenFabricacionDTO puntero = new OrdenFabricacionDTO();
            		puntero.setCodigoOrdenFabricacion(rs.getString(1));
            		puntero.setFechaIngresoOrdenFabricacion(rs.getString(2));
            		puntero.setHoraIngresoOrdenFabricacion(rs.getString(3));
            		puntero.setNumeroPedido(rs.getString(4));
            		puntero.setCodigoProducto(rs.getString(5));
            		puntero.setCantidadProducto(rs.getString(6));
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

	public String getCodigoOrdenFabricacion() {
		return codigoOrdenFabricacion;
	}

	public void setCodigoOrdenFabricacion(String codigoOrdenFabricacion) {
		this.codigoOrdenFabricacion = codigoOrdenFabricacion;
	}

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getFechaIngresoOrdenFabricacion() {
		return fechaIngresoOrdenFabricacion;
	}

	public void setFechaIngresoOrdenFabricacion(String fechaIngresoOrdenFabricacion) {
		this.fechaIngresoOrdenFabricacion = fechaIngresoOrdenFabricacion;
	}

	public String getHoraIngresoOrdenFabricacion() {
		return horaIngresoOrdenFabricacion;
	}

	public void setHoraIngresoOrdenFabricacion(String horaIngresoOrdenFabricacion) {
		this.horaIngresoOrdenFabricacion = horaIngresoOrdenFabricacion;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}
} 

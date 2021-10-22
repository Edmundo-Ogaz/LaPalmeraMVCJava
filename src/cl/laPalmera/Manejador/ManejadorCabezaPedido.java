package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.CabezaPedidoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorCabezaPedido { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorCabezaPedido.class);
	
    private String numeroPedido="";
    private String nombreCliente="";
    private String fechaPedido="";
    private String horaPedido="";
    private String precioTotalPedido="";
    private String confirmacionPedido="";
    private String dedicatoriaPedido="";
    private String observacionPedido="";
    private String fechaInicio="";
    private String fechaTermino="";
      
    public ArrayList consultar() {
        ArrayList<CabezaPedidoDTO> vec = new ArrayList<CabezaPedidoDTO>();
        try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
	      	if (conn != null) {
	            Statement stmt = conn.createStatement();
	            String sql = "select * from CabezaPedido where 1 = 1 ";
	            
	            if (!numeroPedido.equals(""))
	                sql = sql +"     and numeroPedido = "+numeroPedido;
	
	            if (!nombreCliente.equals(""))
	                sql = sql +"     and nombreCliente = '"+nombreCliente+"'";
	
	            if (!fechaPedido.equals(""))
	                sql = sql +"     and fechaPedido = "+fechaPedido;
	
	            if (!horaPedido.equals(""))
	                sql = sql +"     and horaPedido = "+horaPedido;
	
	            if (!precioTotalPedido.equals(""))
	                sql = sql +"     and precioTotalPedido = "+precioTotalPedido;
	
	            if (!confirmacionPedido.equals(""))
	                sql = sql +"     and confirmacionPedido = '"+confirmacionPedido+"'";
	
				if (!observacionPedido.equals(""))
	                sql = sql +"     and observacionPedido = '"+observacionPedido+"'";
	
	            if (!observacionPedido.equals(""))
	                sql = sql +"     and observacionPedido = '"+observacionPedido+"'";
	
	            if ((!fechaInicio.equals("")) || (!fechaTermino.equals("")))
	                sql = sql +"     and fechaPedido >= '"+fechaInicio+"' and fechaPedido <= '"+fechaTermino+"'";
	                           
	            //LOGGER.debug(sql);
	            ResultSet rs = stmt.executeQuery(sql);
	            while (rs.next()) {
	                CabezaPedidoDTO puntero = new CabezaPedidoDTO();
	                puntero.setNumeroPedido(rs.getString(1));
	                puntero.setNombreCliente(rs.getString(2));
	                puntero.setFechaPedido(rs.getString(3));
	                puntero.setHoraPedido(rs.getString(4));
	                puntero.setPrecioTotalPedido(rs.getString(5));
	                puntero.setConfirmacionPedido(rs.getString(6));
	                puntero.setDedicatoriaPedido(rs.getString(7));
	                puntero.setObservacionPedido(rs.getString(8));
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

	public String getConfirmacionPedido() {
		return confirmacionPedido;
	}

	public void setConfirmacionPedido(String confirmacionPedido) {
		this.confirmacionPedido = confirmacionPedido;
	}

	public String getDedicatoriaPedido() {
		return dedicatoriaPedido;
	}

	public void setDedicatoriaPedido(String dedicatoriaPedido) {
		this.dedicatoriaPedido = dedicatoriaPedido;
	}

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public String getFechaPedido() {
		return fechaPedido;
	}

	public void setFechaPedido(String fechaPedido) {
		this.fechaPedido = fechaPedido;
	}

	public String getFechaTermino() {
		return fechaTermino;
	}

	public void setFechaTermino(String fechaTermino) {
		this.fechaTermino = fechaTermino;
	}

	public String getHoraPedido() {
		return horaPedido;
	}

	public void setHoraPedido(String horaPedido) {
		this.horaPedido = horaPedido;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}

	public String getObservacionPedido() {
		return observacionPedido;
	}

	public void setObservacionPedido(String observacionPedido) {
		this.observacionPedido = observacionPedido;
	}

	public String getPrecioTotalPedido() {
		return precioTotalPedido;
	}

	public void setPrecioTotalPedido(String precioTotalPedido) {
		this.precioTotalPedido = precioTotalPedido;
	}
} 

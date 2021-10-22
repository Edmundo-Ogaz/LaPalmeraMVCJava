package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.DespachoPedidoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorDespachoPedido { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorDespachoPedido.class);
	
    private String numeroPedido="";
    private String direccionDespacho="";
    private String fechaEntregaDespacho="";
    private String horaEntregaDespacho="";
      
    public ArrayList consultar() {
        ArrayList<DespachoPedidoDTO> vec = new ArrayList<DespachoPedidoDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from DespachoPedido where 1 = 1 ";
              
            	if (!numeroPedido.equals(""))
            		sql = sql +"     and numeroPedido = "+numeroPedido;

              
            	if (!direccionDespacho.equals(""))
            		sql = sql +"     and direccionDespacho = '"+direccionDespacho+"'";
              
              
            	if (!fechaEntregaDespacho.equals(""))
            		sql = sql +"     and fechaEntregaDespacho = "+fechaEntregaDespacho;

              
            	if (!horaEntregaDespacho.equals(""))
            		sql = sql +"     and horaEntregaDespacho = "+horaEntregaDespacho;

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		DespachoPedidoDTO puntero = new DespachoPedidoDTO();
            		puntero.setNumeroPedido(rs.getString(1));
            		puntero.setDireccionDespacho(rs.getString(2));
            		puntero.setFechaEntregaDespacho(rs.getString(3));
            		puntero.setHoraEntregaDespacho(rs.getString(4));
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

	public String getDireccionDespacho() {
		return direccionDespacho;
	}

	public void setDireccionDespacho(String direccionDespacho) {
		this.direccionDespacho = direccionDespacho;
	}

	public String getFechaEntregaDespacho() {
		return fechaEntregaDespacho;
	}

	public void setFechaEntregaDespacho(String fechaEntregaDespacho) {
		this.fechaEntregaDespacho = fechaEntregaDespacho;
	}

	public String getHoraEntregaDespacho() {
		return horaEntregaDespacho;
	}

	public void setHoraEntregaDespacho(String horaEntregaDespacho) {
		this.horaEntregaDespacho = horaEntregaDespacho;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}
} 

package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class CapturaProduccionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(CapturaProduccionDTO.class);
	
    private String correlativoProduccion="";
    private String codigoOrdenFabricacion="";
    private String fechaCapturaProduccion="";
    private String horaCapturaProduccion="";
    private String codigoProducto="";
    private String cantidadProducto="";
    private String observacion="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into CapturaProduccion(codigoOrdenFabricacion,fechaCapturaProduccion,horaCapturaProduccion,codigoProducto,cantidadProducto,observacion) values (";
    			sql = sql + "'"+codigoOrdenFabricacion +"',";
    			sql = sql + "'"+fechaCapturaProduccion +"',";
    			sql = sql + "'"+horaCapturaProduccion +"',";
    			sql = sql + "'"+codigoProducto +"',";
    			sql = sql + "'"+cantidadProducto +"',";
    			sql = sql + "'"+observacion +"')";
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
        
    public boolean buscar() {
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "select * from CapturaProduccion where correlativoProduccion = "+correlativoProduccion+"";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				correlativoProduccion= rs.getString(1);
    				codigoOrdenFabricacion= rs.getString(2);
    				fechaCapturaProduccion= rs.getString(3);
    				horaCapturaProduccion= rs.getString(4);
    				codigoProducto= rs.getString(5);
    				cantidadProducto= rs.getString(6);
    				observacion= rs.getString(7);
    				resultado = true;
    			}
    			rs.close();
    			stmt.close();
    			conn.close();
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return resultado;
	}    
        
    public String buscarUltimo() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "select * from capturaproduccion";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			while (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				correlativoProduccion=rs.getString(1);
    				LOGGER.debug(correlativoProduccion);
    			}
    			rs.close();
    			stmt.close();
    			conn.close();
    		}
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return correlativoProduccion;
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

	public String getCorrelativoProduccion() {
		return correlativoProduccion;
	}

	public void setCorrelativoProduccion(String correlativoProduccion) {
		this.correlativoProduccion = correlativoProduccion;
	}

	public String getFechaCapturaProduccion() {
		return fechaCapturaProduccion;
	}

	public void setFechaCapturaProduccion(String fechaCapturaProduccion) {
		this.fechaCapturaProduccion = fechaCapturaProduccion;
	}

	public String getHoraCapturaProduccion() {
		return horaCapturaProduccion;
	}

	public void setHoraCapturaProduccion(String horaCapturaProduccion) {
		this.horaCapturaProduccion = horaCapturaProduccion;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
} 

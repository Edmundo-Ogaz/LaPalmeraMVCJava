package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.CapturaProduccionDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorCapturaProduccion { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorCapturaProduccion.class);
	
    private String correlativoProduccion="";
    private String codigoOrdenFabricacion="";
    private String fechaCapturaProduccion="";
    private String horaCapturaProduccion="";
    private String codigoProducto="";
    private String cantidadProducto="";
    private String observacion="";
      
    public ArrayList consultar() {
        ArrayList<CapturaProduccionDTO> vec = new ArrayList<CapturaProduccionDTO>();
      	try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String sql = "select * from CapturaProduccion where 1 = 1 ";
              
                if (!correlativoProduccion.equals(""))
                	sql = sql +"     and correlativoProduccion = "+correlativoProduccion;

                if (!codigoOrdenFabricacion.equals(""))
                	sql = sql +"     and codigoOrdenFabricacion = '"+codigoOrdenFabricacion+"'";

                if (!fechaCapturaProduccion.equals(""))
                	sql = sql +"     and fechaCapturaProduccion = '"+fechaCapturaProduccion+"'";

                if (!horaCapturaProduccion.equals(""))
                	sql = sql +"     and horaCapturaProduccion = '"+horaCapturaProduccion+"'";
                
                if (!codigoProducto.equals(""))
                	sql = sql +"     and codigoProducto = '"+codigoProducto+"'";
                
                if (!cantidadProducto.equals(""))
                	sql = sql +"     and cantidadProducto = '"+cantidadProducto+"'";
                
                if (!observacion.equals(""))
                	sql = sql +"     and observacion = '"+observacion+"'";

                //LOGGER.debug(sql);
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                	CapturaProduccionDTO puntero = new CapturaProduccionDTO();
                	puntero.setCorrelativoProduccion(rs.getString(1));
                	puntero.setCodigoOrdenFabricacion(rs.getString(2));
                	puntero.setFechaCapturaProduccion(rs.getString(3));
                	puntero.setHoraCapturaProduccion(rs.getString(4));
                	puntero.setCodigoProducto(rs.getString(5));
                	puntero.setCantidadProducto(rs.getString(6));
                	puntero.setObservacion(rs.getString(7));
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

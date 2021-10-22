package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.UbicacionDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorUbicacion { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorUbicacion.class);
	
    private String codigoProducto="";
    private String codigoBodega="";
    private String fechaIngreso="";
    private String horaIngreso="";
    private String fechaVencimiento="";
    private String tipoProducto="";
    private String cantidad="";
    private String codigoUnidadMedida="";
    private String observacion="";
    private String fechaIngresoInicio="";
    private String fechaIngresoTermino="";
    private String fechaVencimientoInicio="";
    private String fechaVencimientoTermino="";
    	  
	public ArrayList consultar() {
        ArrayList<UbicacionDTO> vec = new ArrayList<UbicacionDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Ubicacion where 1 = 1 ";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";

            	if (!codigoBodega.equals(""))
            		sql = sql +"     and codigoBodega = '"+codigoBodega+"'";

            	if (!fechaIngreso.equals(""))
            		sql = sql +"     and fechaIngreso = '"+fechaIngreso+"'";
              
            	if (!horaIngreso.equals(""))
            		sql = sql +"     and horaIngreso = '"+horaIngreso+"'";
              
            	if (!fechaVencimiento.equals(""))
            		sql = sql +"     and fechaVencimiento = '"+fechaVencimiento+"'";
              
            	if (!tipoProducto.equals(""))
            		sql = sql +"     and tipoProducto= '"+tipoProducto+"'";

            	if (!cantidad.equals(""))
            		sql = sql +"     and cantidad = "+cantidad+"'";

            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigounidadmedida = '"+codigoUnidadMedida+"'";
              
            	if (!observacion.equals(""))
            		sql = sql +"     and observacionubicacion = '"+observacion+"'";

            	if ((!fechaIngresoInicio.equals("")) || (!fechaIngresoTermino.equals(""))) {
            		sql = sql +"     and fechaingreso >= '"+fechaIngresoInicio+"' "; 
            		sql = sql + "and fechaingreso <= '"+fechaIngresoTermino+"'";  	
			    }   
              
            	if ((!fechaVencimientoInicio.equals("")) || (!fechaVencimientoTermino.equals(""))) {
            		sql = sql + "and fechaVencimiento >= '"+fechaVencimientoInicio+"' "; 
            		sql = sql + "and fechaVencimiento <= '"+fechaVencimientoTermino+"'";  	
			    }
			  
            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		UbicacionDTO puntero = new UbicacionDTO();
            		puntero.setCodigoProducto(rs.getString(1));
            		puntero.setCodigoBodega(rs.getString(2));
            		puntero.setFechaIngreso(rs.getString(3));
            		puntero.setHoraIngreso(rs.getString(4));
            		puntero.setFechaVencimiento(rs.getString(5));
            		puntero.setTipoProducto(rs.getString(6));
            		puntero.setCantidad(rs.getString(7));
            		puntero.setCodigoUnidadMedida(rs.getString(8));
            		puntero.setObservacion(rs.getString(9));
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
        
	public ArrayList consultarPorFechaVencimiento() {
        ArrayList<UbicacionDTO> vec = new ArrayList<UbicacionDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Ubicacion where 1 = 1 ";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";

            	if (!codigoBodega.equals(""))
            		sql = sql +"     and codigoBodega = '"+codigoBodega+"'";

            	if (!fechaIngreso.equals(""))
            		sql = sql +"     and fechaIngreso = '"+fechaIngreso+"'";
              
            	if (!fechaVencimiento.equals(""))
            		sql = sql +"     and fechaVencimiento = '"+fechaVencimiento+"'";
            	
            	if (!tipoProducto.equals(""))
            		sql = sql +"     and tipoProducto= '"+tipoProducto+"'";

            	if (!cantidad.equals(""))
            		sql = sql +"     and cantidad = "+cantidad+"'";

            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigounidadmedida = '"+codigoUnidadMedida+"'";
              
            	if (!observacion.equals(""))
            		sql = sql +"     and observacionubicacion = '"+observacion+"'";

            	if ((!fechaIngresoInicio.equals("")) || (!fechaIngresoTermino.equals(""))) {
            		sql = sql +"     and fechaingreso >= '"+fechaIngresoInicio+"' "; 
            		sql = sql + "and fechaingreso <= '"+fechaIngresoTermino+"'";  	
			    }   
              
            	if ((!fechaVencimientoInicio.equals("")) || (!fechaVencimientoTermino.equals(""))) {
            		sql = sql + "and fechaVencimiento >= '"+fechaVencimientoInicio+"' "; 
            		sql = sql + "and fechaVencimiento <= '"+fechaVencimientoTermino+"'";  	
			    }
			  
            	sql = sql +"     order by fechaVencimiento";
            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		UbicacionDTO puntero = new UbicacionDTO();
            		puntero.setCodigoProducto(rs.getString(1));
            		puntero.setCodigoBodega(rs.getString(2));
            		puntero.setFechaIngreso(rs.getString(3));
            		puntero.setHoraIngreso(rs.getString(4));
            		puntero.setFechaVencimiento(rs.getString(5));
            		puntero.setTipoProducto(rs.getString(6));
            		puntero.setCantidad(rs.getString(7));
            		puntero.setCodigoUnidadMedida(rs.getString(8));
            		puntero.setObservacion(rs.getString(9));
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

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}

	public String getCodigoBodega() {
		return codigoBodega;
	}

	public void setCodigoBodega(String codigoBodega) {
		this.codigoBodega = codigoBodega;
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

	public String getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(String fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public String getFechaIngresoInicio() {
		return fechaIngresoInicio;
	}

	public void setFechaIngresoInicio(String fechaIngresoInicio) {
		this.fechaIngresoInicio = fechaIngresoInicio;
	}

	public String getFechaIngresoTermino() {
		return fechaIngresoTermino;
	}

	public void setFechaIngresoTermino(String fechaIngresoTermino) {
		this.fechaIngresoTermino = fechaIngresoTermino;
	}

	public String getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getFechaVencimientoInicio() {
		return fechaVencimientoInicio;
	}

	public void setFechaVencimientoInicio(String fechaVencimientoInicio) {
		this.fechaVencimientoInicio = fechaVencimientoInicio;
	}

	public String getFechaVencimientoTermino() {
		return fechaVencimientoTermino;
	}

	public void setFechaVencimientoTermino(String fechaVencimientoTermino) {
		this.fechaVencimientoTermino = fechaVencimientoTermino;
	}

	public String getHoraIngreso() {
		return horaIngreso;
	}

	public void setHoraIngreso(String horaIngreso) {
		this.horaIngreso = horaIngreso;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(String tipoProducto) {
		this.tipoProducto = tipoProducto;
	}   
} 

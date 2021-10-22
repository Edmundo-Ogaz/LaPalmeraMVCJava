package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ProgramaProduccionDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorProgramaProduccion { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorProgramaProduccion.class);
	
    private String codigoOrdenFabricacion="";
    private String fechaProgramaProduccion="";
    private String horaProgramaProduccion="";
    private String codigoProducto="";
    private String codigoLineaProduccion="";
    private String cantidadProgramada="";
    private String cantidadFabricada="";
    private String saldoPorFabricar="";
    private String estadoOrdenFabricacion="";
    private String numeroPedido="";
    private String fechaPedido="";
    private String fechaInicio="";
    private String fechaTermino="";
    
    public ArrayList consultar() {
        ArrayList<ProgramaProduccionDTO> vec = new ArrayList<ProgramaProduccionDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from ProgramaProduccion where 1 = 1 ";
              
            	if (!codigoOrdenFabricacion.equals(""))
            		sql = sql +"     and codigoOrdenFabricacion = '"+codigoOrdenFabricacion+"'";

            	if (!fechaProgramaProduccion.equals(""))
            		sql = sql +"     and fechaProgramaProduccion = '"+fechaProgramaProduccion+"'";

            	if (!horaProgramaProduccion.equals(""))
            		sql = sql +"     and horaProgramaProduccion = '"+horaProgramaProduccion+"'";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";
              
            	if (!codigoLineaProduccion.equals(""))
            		sql = sql +"     and codigoLineaProduccion = '"+codigoLineaProduccion+"'";
              
            	if (!cantidadProgramada.equals(""))
            		sql = sql +"     and cantidadProgramada = "+cantidadProgramada;

            	if (!cantidadFabricada.equals(""))
            		sql = sql +"     and cantidadFabricada = "+cantidadFabricada;

            	if (!saldoPorFabricar.equals(""))
            		sql = sql +"     and saldoPorFabricar = "+saldoPorFabricar;

            	if (!estadoOrdenFabricacion.equals(""))
            		sql = sql +"     and estadoOrdenFabricacion = '"+estadoOrdenFabricacion+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		ProgramaProduccionDTO puntero = new ProgramaProduccionDTO();
            		puntero.setCodigoOrdenFabricacion(rs.getString(1));
            		puntero.setFechaProgramaProduccion(rs.getString(2));
            		puntero.setHoraProgramaProduccion(rs.getString(3));
            		puntero.setCodigoProducto(rs.getString(4));
            		puntero.setCodigoLineaProduccion(rs.getString(5));
               		puntero.setCantidadProgramada(rs.getString(6));
            		puntero.setCantidadFabricada(rs.getString(7));
            		puntero.setSaldoPorFabricar(rs.getString(8));
            		puntero.setEstadoOrdenFabricacion(rs.getString(9));
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
        
    public ArrayList listarPorFecha() {
        ArrayList<ProgramaProduccionDTO> vec = new ArrayList<ProgramaProduccionDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "   select";
            	sql = sql +"     programaproduccion.codigoOrdenFabricacion,";
            	sql = sql +"     despachopedido.fechaProgramaProduccion,";
            	sql = sql +"     despachopedido.horaProgramaProduccion,";
            	sql = sql +"     programaproduccion.codigoProducto,";
            	sql = sql +"     programaproduccion.codigoLineaProduccion,";
            	sql = sql +"     programaproduccion.cantidadProgramada,";
            	sql = sql +"     programaproduccion.cantidadFabricada,";
            	sql = sql +"     programaproduccion.saldoPorFabricar,";
            	sql = sql +"     programaproduccion.estadoOrdenFabricacion";
            	sql = sql +"     from ProgramaProduccion, OrdenFabricacion, DespachoPedido where ";
            	sql = sql +"     ProgramaProduccion.codigoOrdenFabricacion = OrdenFabricacion.codigoOrdenFabricacion";
            	sql = sql +"     and OrdenFabricacion.numeropedido = Despachopedido.numeropedido";
			  
            	if (!codigoOrdenFabricacion.equals(""))
            		sql = sql +"     and ProgramaProduccion.codigoOrdenFabricacion = '"+codigoOrdenFabricacion+"'";

            	if (!fechaProgramaProduccion.equals(""))
            		sql = sql +"     and ProgramaProduccion.fechaProgramaProduccion = '"+fechaProgramaProduccion+"'";

            	if (!horaProgramaProduccion.equals(""))
            		sql = sql +"     and ProgramaProduccion.horaProgramaProduccion = '"+horaProgramaProduccion+"'";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";
              
            	if (!codigoLineaProduccion.equals(""))
            		sql = sql +"     and ProgramaProduccion.codigoLineaProduccion = '"+codigoLineaProduccion+"'";
              
            	if (!cantidadProgramada.equals(""))
            		sql = sql +"     and ProgramaProduccion.cantidadProgramada = "+cantidadProgramada;

            	if (!cantidadFabricada.equals(""))
            		sql = sql +"     and ProgramaProduccion.cantidadFabricada = "+cantidadFabricada;

            	if (!saldoPorFabricar.equals(""))
            		sql = sql +"     and ProgramaProduccion.saldoPorFabricar = "+saldoPorFabricar;

            	if (!estadoOrdenFabricacion.equals(""))
            		sql = sql +"     and ProgramaProduccion.estadoOrdenFabricacion = '"+estadoOrdenFabricacion+"'";
			  
            	if ((!fechaInicio.equals("")) || (!fechaTermino.equals("")))
            		sql = sql +"     and despachopedido.fechaentregadespacho >= '"+fechaInicio+"' and despachopedido.fechaentregadespacho <= '"+fechaTermino+"'";
			  
            	sql = sql +"     order by despachopedido.fechaentregadespacho";
               	sql = sql +"     , programaproduccion.horaprogramaproduccion";
               	//LOGGER.debug(sql);
               	ResultSet rs = stmt.executeQuery(sql);
               	while (rs.next()) {
               		ProgramaProduccionDTO puntero = new ProgramaProduccionDTO();
               		puntero.setCodigoOrdenFabricacion(rs.getString(1));
               		puntero.setFechaProgramaProduccion(rs.getString(2));
               		puntero.setHoraProgramaProduccion(rs.getString(3));
               		puntero.setCodigoProducto(rs.getString(4));
               		puntero.setCodigoLineaProduccion(rs.getString(5));
               		puntero.setCantidadProgramada(rs.getString(6));
               		puntero.setCantidadFabricada(rs.getString(7));
               		puntero.setSaldoPorFabricar(rs.getString(8));
               		puntero.setEstadoOrdenFabricacion(rs.getString(9));
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

	public String getCantidadFabricada() {
		return cantidadFabricada;
	}

	public void setCantidadFabricada(String cantidadFabricada) {
		this.cantidadFabricada = cantidadFabricada;
	}

	public String getCantidadProgramada() {
		return cantidadProgramada;
	}

	public void setCantidadProgramada(String cantidadProgramada) {
		this.cantidadProgramada = cantidadProgramada;
	}

	public String getCodigoLineaProduccion() {
		return codigoLineaProduccion;
	}

	public void setCodigoLineaProduccion(String codigoLineaProduccion) {
		this.codigoLineaProduccion = codigoLineaProduccion;
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

	public String getEstadoOrdenFabricacion() {
		return estadoOrdenFabricacion;
	}

	public void setEstadoOrdenFabricacion(String estadoOrdenFabricacion) {
		this.estadoOrdenFabricacion = estadoOrdenFabricacion;
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

	public String getFechaProgramaProduccion() {
		return fechaProgramaProduccion;
	}

	public void setFechaProgramaProduccion(String fechaProgramaProduccion) {
		this.fechaProgramaProduccion = fechaProgramaProduccion;
	}

	public String getFechaTermino() {
		return fechaTermino;
	}

	public void setFechaTermino(String fechaTermino) {
		this.fechaTermino = fechaTermino;
	}

	public String getHoraProgramaProduccion() {
		return horaProgramaProduccion;
	}

	public void setHoraProgramaProduccion(String horaProgramaProduccion) {
		this.horaProgramaProduccion = horaProgramaProduccion;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}

	public String getSaldoPorFabricar() {
		return saldoPorFabricar;
	}

	public void setSaldoPorFabricar(String saldoPorFabricar) {
		this.saldoPorFabricar = saldoPorFabricar;
	}
} 

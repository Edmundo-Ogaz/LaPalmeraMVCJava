package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.EspecificarProduccionDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorEspecificarProduccion { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorEspecificarProduccion.class);
	
    private String codigoOrdenFabricacion="";
    private String rutFuncionario="";
    private String codigoProducto="";
    private String codigoLineaProduccion="";
    private String fechaEspecificarProduccion="";
    private String horaEspecificarProduccion="";
    
    public ArrayList consultar() {
        ArrayList<EspecificarProduccionDTO> vec = new ArrayList<EspecificarProduccionDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from EspecificarProduccion where 1 = 1 ";
            	
            	if (!codigoOrdenFabricacion.equals(""))
            		sql = sql +"     and codigoOrdenFabricacion = "+codigoOrdenFabricacion;

            	if (!rutFuncionario.equals(""))
            		sql = sql +"     and rutFuncionario = '"+rutFuncionario+"'";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";
              
            	if (!codigoLineaProduccion.equals(""))
            		sql = sql +"     and codigoLineaProduccion = '"+codigoLineaProduccion+"'";
              
            	if (!fechaEspecificarProduccion.equals(""))
            		sql = sql +"     and fechaEspecificarProduccion = "+fechaEspecificarProduccion;

            	if (!horaEspecificarProduccion.equals(""))
            		sql = sql +"     and horaEspecificarProduccion = '"+horaEspecificarProduccion+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		EspecificarProduccionDTO puntero = new EspecificarProduccionDTO();
            		puntero.setCodigoOrdenFabricacion(rs.getString(1));
            		puntero.setRutFuncionario(rs.getString(2));
            		puntero.setCodigoProducto(rs.getString(3));
            		puntero.setCodigoLineaProduccion(rs.getString(4));
            		puntero.setFechaEspecificarProduccion(rs.getString(5));
            		puntero.setHoraEspecificarProduccion(rs.getString(6));
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

	public String getFechaEspecificarProduccion() {
		return fechaEspecificarProduccion;
	}

	public void setFechaEspecificarProduccion(String fechaEspecificarProduccion) {
		this.fechaEspecificarProduccion = fechaEspecificarProduccion;
	}

	public String getHoraEspecificarProduccion() {
		return horaEspecificarProduccion;
	}

	public void setHoraEspecificarProduccion(String horaEspecificarProduccion) {
		this.horaEspecificarProduccion = horaEspecificarProduccion;
	}

	public String getRutFuncionario() {
		return rutFuncionario;
	}

	public void setRutFuncionario(String rutFuncionario) {
		this.rutFuncionario = rutFuncionario;
	}
} 

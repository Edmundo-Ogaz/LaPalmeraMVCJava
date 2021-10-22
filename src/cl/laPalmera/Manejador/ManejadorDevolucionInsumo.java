package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.DevolucionInsumoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;
  
public class ManejadorDevolucionInsumo { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorDevolucionInsumo.class);
	
    private String correlativoDevolucionInsumo="";
    private String codigoOrdenFabricacion="";
    private String fechaDevolucionInsumo="";
    private String horaDevolucionInsumo="";
    private String rutFuncionario="";
    private String observacion="";
    
    public ArrayList consultar() {
    	ArrayList<DevolucionInsumoDTO> vec = new ArrayList<DevolucionInsumoDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from DevolucionInsumo where 1 = 1 ";
              
            	if (!correlativoDevolucionInsumo.equals(""))
            		sql = sql +"     and correlativoDevolucionInsumo = "+correlativoDevolucionInsumo;

            	if (!codigoOrdenFabricacion.equals(""))
            		sql = sql +"     and codigoOrdenFabricacion = '"+codigoOrdenFabricacion+"'";
              
            	if (!fechaDevolucionInsumo.equals(""))
            		sql = sql +"     and fechaDevolucionInsumo = '"+fechaDevolucionInsumo+"'";

               	if (!horaDevolucionInsumo.equals(""))
               		sql = sql +"     and horaDevolucionInsumo = '"+horaDevolucionInsumo+"'";
              
               	if (!rutFuncionario.equals(""))
               		sql = sql +"     and rutFuncionario = '"+rutFuncionario+"'";
              
               	if (!observacion.equals(""))
               		sql = sql +"     and observacion = '"+observacion+"'";

               	//LOGGER.debug(sql);
               	ResultSet rs = stmt.executeQuery(sql);
               	while (rs.next()) {
               		DevolucionInsumoDTO puntero = new DevolucionInsumoDTO();
               		puntero.setCorrelativoDevolucionInsumo(rs.getString(1));
               		puntero.setCodigoOrdenFabricacion(rs.getString(2));
               		puntero.setFechaDevolucionInsumo(rs.getString(3));
               		puntero.setHoraDevolucionInsumo(rs.getString(4));
               		puntero.setRutFuncionario(rs.getString(5));
               		puntero.setObservacion(rs.getString(6));
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

	public String getCodigoOrdenFabricacion() {
		return codigoOrdenFabricacion;
	}

	public void setCodigoOrdenFabricacion(String codigoOrdenFabricacion) {
		this.codigoOrdenFabricacion = codigoOrdenFabricacion;
	}

	public String getCorrelativoDevolucionInsumo() {
		return correlativoDevolucionInsumo;
	}

	public void setCorrelativoDevolucionInsumo(String correlativoDevolucionInsumo) {
		this.correlativoDevolucionInsumo = correlativoDevolucionInsumo;
	}

	public String getFechaDevolucionInsumo() {
		return fechaDevolucionInsumo;
	}

	public void setFechaDevolucionInsumo(String fechaDevolucionInsumo) {
		this.fechaDevolucionInsumo = fechaDevolucionInsumo;
	}

	public String getHoraDevolucionInsumo() {
		return horaDevolucionInsumo;
	}

	public void setHoraDevolucionInsumo(String horaDevolucionInsumo) {
		this.horaDevolucionInsumo = horaDevolucionInsumo;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getRutFuncionario() {
		return rutFuncionario;
	}

	public void setRutFuncionario(String rutFuncionario) {
		this.rutFuncionario = rutFuncionario;
	}
} 

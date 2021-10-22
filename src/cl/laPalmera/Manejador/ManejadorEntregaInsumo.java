package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.EntregaInsumoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorEntregaInsumo { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorEntregaInsumo.class);
	
    private String correlativoEntregaInsumo="";
    private String codigoOrdenFabricacion="";
    private String fechaEntregaInsumo="";
    private String horaEntregaInsumo="";
    private String rutFuncionario="";
    private String observacion="";
      
    public ArrayList consultar() {
        ArrayList<EntregaInsumoDTO> vec = new ArrayList<EntregaInsumoDTO>();
      	try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from EntregaInsumo where 1 = 1 ";
              
            	if (!correlativoEntregaInsumo.equals(""))
            		sql = sql +"     and correlativoEntregaInsumo = '"+correlativoEntregaInsumo+"'";
              
            	if (!codigoOrdenFabricacion.equals(""))
            		sql = sql +"     and codigoOrdenFabricacion = '"+codigoOrdenFabricacion+"'";
                            
            	if (!fechaEntregaInsumo.equals(""))
            		sql = sql +"     and fechaEntregaInsumo = '"+fechaEntregaInsumo+"'";

            	if (!horaEntregaInsumo.equals(""))
            		sql = sql +"     and horaEntregaInsumo = '"+horaEntregaInsumo+"'";
              
            	if (!rutFuncionario.equals(""))
            		sql = sql +"     and rutFuncionario = '"+rutFuncionario+"'";
                            
            	if (!observacion.equals(""))
            		sql = sql +"     and observacion = '"+observacion+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		EntregaInsumoDTO puntero = new EntregaInsumoDTO();
            		puntero.setCorrelativoEntregaInsumo(rs.getString(1));
            		puntero.setCodigoOrdenFabricacion(rs.getString(2));
            		puntero.setFechaEntregaInsumo(rs.getString(3));
            		puntero.setHoraEntregaInsumo(rs.getString(4));
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

	public String getCorrelativoEntregaInsumo() {
		return correlativoEntregaInsumo;
	}

	public void setCorrelativoEntregaInsumo(String correlativoEntregaInsumo) {
		this.correlativoEntregaInsumo = correlativoEntregaInsumo;
	}

	public String getFechaEntregaInsumo() {
		return fechaEntregaInsumo;
	}

	public void setFechaEntregaInsumo(String fechaEntregaInsumo) {
		this.fechaEntregaInsumo = fechaEntregaInsumo;
	}

	public String getHoraEntregaInsumo() {
		return horaEntregaInsumo;
	}

	public void setHoraEntregaInsumo(String horaEntregaInsumo) {
		this.horaEntregaInsumo = horaEntregaInsumo;
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

package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class DevolucionInsumoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(DevolucionInsumoDTO.class);
	
    private String correlativoDevolucionInsumo="";
    private String codigoOrdenFabricacion="";
    private String fechaDevolucionInsumo="";
    private String horaDevolucionInsumo="";
    private String rutFuncionario="";
    private String observacion="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into DevolucionInsumo(codigoOrdenFabricacion,fechaDevolucionInsumo,horaDevolucionInsumo,rutFuncionario,observacion) values (";
    			sql = sql + "'"+codigoOrdenFabricacion +"',";
    			sql = sql + "'"+fechaDevolucionInsumo +"',";
    			sql = sql + "'"+horaDevolucionInsumo +"',";
    			sql = sql + "'"+rutFuncionario +"',";
    			sql = sql + "'"+observacion +"')";
    			//LOGGER.debug(sql);
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
  
    public String buscarUltimo() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "select * from DevolucionInsumo";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			while (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				correlativoDevolucionInsumo=rs.getString(1);
    				LOGGER.debug(correlativoDevolucionInsumo);
    			}
    			rs.close();
    			stmt.close();
    			conn.close();
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return correlativoDevolucionInsumo;
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

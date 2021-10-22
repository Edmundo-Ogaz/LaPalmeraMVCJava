package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class EntregaInsumoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(EntregaInsumoDTO.class);
	
    private String correlativoEntregaInsumo="";
    private String codigoOrdenFabricacion="";
    private String fechaEntregaInsumo="";
    private String horaEntregaInsumo="";
    private String rutFuncionario="";
    private String observacion="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into EntregaInsumo(codigoOrdenFabricacion,fechaEntregaInsumo,horaEntregaInsumo,rutFuncionario,observacion) values (";
    			sql = sql + "'"+codigoOrdenFabricacion +"',";
    			sql = sql + "'"+fechaEntregaInsumo +"',";
    			sql = sql + "'"+horaEntregaInsumo +"',";
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
  
    public boolean buscar() { 
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "select * from EntregaInsumo where codigoOrdenFabricacion = '"+codigoOrdenFabricacion+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				correlativoEntregaInsumo= rs.getString(1);
    				codigoOrdenFabricacion= rs.getString(2);
    				fechaEntregaInsumo= rs.getString(3);
    				horaEntregaInsumo= rs.getString(4);
    				rutFuncionario= rs.getString(5);
    				observacion= rs.getString(6);
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
    			String sql = "select * from EntregaInsumo";
    			LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			while (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				correlativoEntregaInsumo=rs.getString(1);
    				LOGGER.debug(correlativoEntregaInsumo);
    			}
    			rs.close();
    			stmt.close();
    			conn.close();
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return correlativoEntregaInsumo;
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

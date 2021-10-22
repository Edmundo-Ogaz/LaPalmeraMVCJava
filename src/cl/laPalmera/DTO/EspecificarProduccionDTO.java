package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class EspecificarProduccionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(EspecificarProduccionDTO.class);
	
    private String codigoOrdenFabricacion="";
    private String rutFuncionario="";
    private String codigoProducto="";
    private String codigoLineaProduccion="";
    private String fechaEspecificarProduccion="";
    private String horaEspecificarProduccion="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into EspecificarProduccion values (";
    			sql = sql + codigoOrdenFabricacion +",";
    			sql = sql + "'"+rutFuncionario +"',";
    			sql = sql + "'"+codigoProducto +"',";
    			sql = sql + "'"+codigoLineaProduccion +"',";
    			sql = sql + "'"+fechaEspecificarProduccion +"',";
    			sql = sql + "'"+horaEspecificarProduccion +"')";
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
    			String sql = "select * from especificarproduccion where codigoordenfabricacion = "+codigoOrdenFabricacion+"";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoOrdenFabricacion = rs.getString(1);
    				rutFuncionario = rs.getString(2);
    				codigoProducto = rs.getString(3);
    				codigoLineaProduccion = rs.getString(4);
    				fechaEspecificarProduccion = rs.getString(5);
    				horaEspecificarProduccion = rs.getString(6);
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

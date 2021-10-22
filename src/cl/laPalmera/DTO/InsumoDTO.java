package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class InsumoDTO {
	
	private static final Logger LOGGER = Logger.getLogger(InsumoDTO.class);
	
    private String codigoInsumo="";
    private String nombreInsumo="";
    private String codigoUnidadMedida="";
    private String stockCriticoInsumo="";
    private String pesoInsumo="";
    private String observacionInsumo="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into Insumo values (";
    			sql = sql + "'"+codigoInsumo +"',";
    			sql = sql + "'"+nombreInsumo +"',";
    			sql = sql + "'"+codigoUnidadMedida +"',";
    			sql = sql + stockCriticoInsumo +",";
    			sql = sql + pesoInsumo +",";
    			sql = sql + " null"+",";
    			sql = sql + " null"+",";
    			sql = sql + " null"+",";
    			sql = sql + " null"+",";
    			sql = sql + " null"+",";
    			sql = sql + "'"+observacionInsumo +"')";
    			//LOGGER.debug(sql);
    			int i = stmt.executeUpdate(sql);
               
    			if (i == 1)
    				//LOGGER.debug("OK");
              
    			stmt.close();
    			conn.close();
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
    }
        
    public void modificar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "update insumo set ";
    			sql = sql + "codigoinsumo = "+"'"+codigoInsumo +"', ";
    			sql = sql + "nombreinsumo = "+"'"+nombreInsumo +"', ";
    			sql = sql + "codigounidadmedida = "+"'"+codigoUnidadMedida +"', ";
    			sql = sql + "stockcriticoinsumo = "+stockCriticoInsumo +", ";
    			sql = sql + "pesoinsumo = "+pesoInsumo +", ";
    			sql = sql + "observacion = "+"'"+observacionInsumo +"' where codigoinsumo = '"+codigoInsumo+"'";
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
        
    public void eliminar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "delete from insumo where ";
    			sql = sql + "codigoinsumo = "+"'"+codigoInsumo +"'";
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
    			String sql = "select * from insumo where codigoinsumo = '"+codigoInsumo+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoInsumo= rs.getString(1);
    				nombreInsumo= rs.getString(2);
    				codigoUnidadMedida= rs.getString(3);
    				stockCriticoInsumo= rs.getString(4);
    				pesoInsumo= rs.getString(5);
    				observacionInsumo= rs.getString(10);
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

	public String getCodigoInsumo() {
		return codigoInsumo;
	}

	public void setCodigoInsumo(String codigoInsumo) {
		this.codigoInsumo = codigoInsumo;
	}

	public String getCodigoUnidadMedida() {
		return codigoUnidadMedida;
	}

	public void setCodigoUnidadMedida(String codigoUnidadMedida) {
		this.codigoUnidadMedida = codigoUnidadMedida;
	}

	public String getNombreInsumo() {
		return nombreInsumo;
	}

	public void setNombreInsumo(String nombreInsumo) {
		this.nombreInsumo = nombreInsumo;
	}

	public String getObservacionInsumo() {
		return observacionInsumo;
	}

	public void setObservacionInsumo(String observacionInsumo) {
		this.observacionInsumo = observacionInsumo;
	}

	public String getPesoInsumo() {
		return pesoInsumo;
	}

	public void setPesoInsumo(String pesoInsumo) {
		this.pesoInsumo = pesoInsumo;
	}

	public String getStockCriticoInsumo() {
		return stockCriticoInsumo;
	}

	public void setStockCriticoInsumo(String stockCriticoInsumo) {
		this.stockCriticoInsumo = stockCriticoInsumo;
	}
} 
  
  

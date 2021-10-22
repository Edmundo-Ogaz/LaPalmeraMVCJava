package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class IngredienteDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(IngredienteDTO.class);
	
    private String codigoProducto="";
    private String codigoInsumo="";
    private String carga="";
    private String cantidadInsumo="";
    private String codigoUnidadMedida="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into Ingrediente values (";
    			sql = sql + "'"+codigoProducto +"',";
    			sql = sql + "'"+codigoInsumo +"',";
    			sql = sql + carga +",";
    			sql = sql + cantidadInsumo +",";
    			sql = sql + "'"+codigoUnidadMedida +"')";
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
  
    public void modificar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "update Ingrediente set ";
    			sql = sql + "codigoproducto = "+"'"+codigoProducto +"', ";
    			sql = sql + "codigoinsumo = "+"'"+codigoInsumo +"', ";
    			sql = sql + "carga = "+carga +", ";
    			sql = sql + "cantidadinsumo = "+cantidadInsumo +", ";
    			sql = sql + "codigounidadmedida = "+"'"+codigoUnidadMedida +"'";
    			sql = sql + " where codigoproducto = '"+codigoProducto+"'";
    			sql = sql + " and codigoinsumo = '"+codigoInsumo+"'";
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
        		String sql = "delete from Ingrediente where ";
        		sql = sql + "codigoproducto = '"+codigoProducto +"'";
        		sql = sql + " and codigoinsumo = '"+codigoInsumo+"'";
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
    			String sql = "select * from ingrediente where ";
    			sql = sql + " codigoproducto = '"+codigoProducto+"'";
    			sql = sql + " and codigoinsumo = '"+codigoInsumo+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoProducto= rs.getString(1);
    				codigoInsumo= rs.getString(2);
    				carga= rs.getString(3);
    				cantidadInsumo= rs.getString(4);
    				codigoUnidadMedida=rs.getString(5);
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

	public String getCantidadInsumo() {
		return cantidadInsumo;
	}

	public void setCantidadInsumo(String cantidadInsumo) {
		this.cantidadInsumo = cantidadInsumo;
	}

	public String getCarga() {
		return carga;
	}

	public void setCarga(String carga) {
		this.carga = carga;
	}

	public String getCodigoInsumo() {
		return codigoInsumo;
	}

	public void setCodigoInsumo(String codigoInsumo) {
		this.codigoInsumo = codigoInsumo;
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
} 

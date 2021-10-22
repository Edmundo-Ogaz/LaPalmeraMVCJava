package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class StockDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(StockDTO.class);
	
    int i = 0;
    private String codigoProducto="";
    private String stockDisponible="";
    private String stockComprometido="";
    private String codigoUnidadMedida="";
    
    public int grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into Stock values (";
    			sql = sql + "'"+codigoProducto +"',";
    			sql = sql + stockDisponible +",";
    			sql = sql + stockComprometido +",";
    			sql = sql + "'"+codigoUnidadMedida +"')";
    			LOGGER.debug(sql);
    			i = stmt.executeUpdate(sql);
               
    			if (i == 1)
    				LOGGER.debug("OK");
              
    			stmt.close();
    			conn.close();
            }
        } catch (Exception e) {
            LOGGER.error(e,e);
         	return (i);
        }
        return (i);
    }
    
    public int modificar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "update stock set ";
        		sql = sql + "codigoproducto = '"+codigoProducto +"', ";
        		sql = sql + "stockdisponible = "+stockDisponible +", ";
        		sql = sql + "stockComprometido = "+stockComprometido +", ";
        		sql = sql + "codigoUnidadMedida = "+"'"+codigoUnidadMedida +"' ";
        		sql = sql + "where codigoproducto = '"+codigoProducto+"'";
        		LOGGER.debug(sql);
        		i = stmt.executeUpdate(sql);
              
        		if (i == 1)
        			LOGGER.debug("OK");
              
        		stmt.close();
        		conn.close();
            }
        } catch (Exception e) {
         	LOGGER.error(e,e);
         	return (i);
        }
        return (i);
    }
        
    public int eliminar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "delete from stock where ";
        		sql = sql + "codigoproducto = '"+codigoProducto +"'";
        		//LOGGER.debug(sql);
        		i = stmt.executeUpdate(sql);
              
        		if (i == 1)
        			LOGGER.debug("OK");
              
        		stmt.close();
        		conn.close();
            }
        } catch (Exception e) {
         	LOGGER.error(e,e);
         	return (i);
        }
        return (i);
    }    
        
    public boolean buscar() {
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
         	if (conn != null) {
         		Statement stmt = conn.createStatement();
         		String sql = "select * from stock where codigoproducto = '"+codigoProducto+"'";
         		//LOGGER.debug(sql);
         		ResultSet rs = stmt.executeQuery(sql);
         		if (rs.next()) {
         			LOGGER.debug("Lo encontro");
         			codigoProducto= rs.getString(1);
         			stockDisponible= rs.getString(2);
         			stockComprometido= rs.getString(3);
         			codigoUnidadMedida= rs.getString(4);
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

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public String getStockComprometido() {
		return stockComprometido;
	}

	public void setStockComprometido(String stockComprometido) {
		this.stockComprometido = stockComprometido;
	}

	public String getStockDisponible() {
		return stockDisponible;
	}

	public void setStockDisponible(String stockDisponible) {
		this.stockDisponible = stockDisponible;
	}  
} 

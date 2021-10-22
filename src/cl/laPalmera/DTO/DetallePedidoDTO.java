package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class DetallePedidoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(DetallePedidoDTO.class);
	
	private String numeroPedido="";
	private String codigoProducto="";
	private String precioProducto="";
	private String cantidadProducto="";
        
	public int grabar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "insert into DetallePedido values (";
        		sql = sql + numeroPedido +",";
        		sql = sql + "'"+codigoProducto +"',";
        		sql = sql + precioProducto +",";
        		sql = sql + cantidadProducto +")";
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
  
    public int modificar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "update detallepedido set ";
        		sql = sql + "numeropedido = "+numeroPedido +", ";
        		sql = sql + "codigoProducto = '"+codigoProducto +"', ";
        		sql = sql + "precioProducto = "+precioProducto +", ";
        		sql = sql + "cantidadProducto = "+cantidadProducto +" "; 
        		sql = sql + "where numeropedido = "+numeroPedido +" "; 
        		sql = sql + "and codigoproducto = '"+codigoProducto+"'";
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
        
    public int eliminar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "delete from detallepedido where ";
        		sql = sql + "numeropedido = "+numeroPedido +"";
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
    			String sql = "select * from detallepedido where numeropedido = "+numeroPedido+"";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				numeroPedido= rs.getString(1);
    				codigoProducto= rs.getString(2);
    				precioProducto=rs.getString(3);
    				cantidadProducto=rs.getString(4);
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

	public String getCantidadProducto() {
		return cantidadProducto;
	}

	public void setCantidadProducto(String cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}

	public String getPrecioProducto() {
		return precioProducto;
	}

	public void setPrecioProducto(String precioProducto) {
		this.precioProducto = precioProducto;
	}
} 

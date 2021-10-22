package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class ProductoLineaDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(ProductoLineaDTO.class);
	
    private String codigoProducto="";
    private String codigoLineaProduccion="";
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "insert into ProductoLinea values (";
            	sql = sql + "'"+codigoProducto +"',";
            	sql = sql + "'"+codigoLineaProduccion +"')";
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
            	String sql = "update ProductoLinea set ";
            	sql = sql + "codigoproducto = "+"'"+codigoProducto +"', ";
            	sql = sql + "codigoLineaProduccion = "+"'"+codigoLineaProduccion +"' ";
            	sql = sql + "where codigoproducto = "+"'"+codigoProducto+"'";
            	LOGGER.debug(sql);
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
            	String sql = "delete from ProductoLinea where ";
            	sql = sql + "codigoProducto = "+"'"+codigoProducto +"'";
            	LOGGER.debug(sql);
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
            	String sql = "select * from productolinea";
            	sql = sql + " where codigoproducto = '"+ codigoProducto+"'";
            	LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		LOGGER.debug("Lo encontro");
                    codigoProducto= rs.getString(1);
                    codigoLineaProduccion= rs.getString(2);
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

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}
} 

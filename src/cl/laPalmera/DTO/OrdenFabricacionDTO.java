package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class OrdenFabricacionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(OrdenFabricacionDTO.class);
	
    private String codigoOrdenFabricacion="";
    private String fechaIngresoOrdenFabricacion="";
    private String horaIngresoOrdenFabricacion="";
    private String numeroPedido="";
    private String codigoProducto="";
    private String cantidadProducto="";
      
    public int grabar() {
        int i = 0;
        try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
                String sql = "insert into OrdenFabricacion values (";
                sql = sql + "'"+codigoOrdenFabricacion +"',";
                sql = sql + "'"+fechaIngresoOrdenFabricacion +"',";
                sql = sql + "'"+horaIngresoOrdenFabricacion +"',";
                sql = sql + numeroPedido +",";
                sql = sql + "'"+codigoProducto +"',";
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
            	String sql = "update OrdenFabricacion set ";
            	sql = sql + "codigoordenfabricacion = "+"'"+codigoOrdenFabricacion +"', ";
            	sql = sql + "fechaIngresoOrdenFabricacion = "+"'"+fechaIngresoOrdenFabricacion +"', ";
            	sql = sql + "horaIngresoOrdenFabricacion = "+"'"+horaIngresoOrdenFabricacion +"', ";
            	sql = sql + "numeroPedido = "+""+numeroPedido +", ";
            	sql = sql + "codigoProducto = "+"'"+codigoProducto +"', ";
            	sql = sql + "cantidadProducto = "+""+cantidadProducto +", ";
            	sql = sql + " where codigoordenfabricacion = '"+codigoOrdenFabricacion+"'";
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
            	String sql = "delete from OrdenFabricacion where ";
            	sql = sql + "codigoordenfabricacion = '"+codigoOrdenFabricacion +"'";
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
  
    public boolean buscar() {
	    boolean resultado = false;
	    try {
	    	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from ordenfabricacion where codigoordenfabricacion = '"+codigoOrdenFabricacion+"'";
            	LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);

            	if (rs.next()) {
            		//LOGGER.debug("Lo encontro");
               		codigoOrdenFabricacion= rs.getString(1);
               		fechaIngresoOrdenFabricacion= rs.getString(2);
               		horaIngresoOrdenFabricacion= rs.getString(3);
               		numeroPedido= rs.getString(4);
               		codigoProducto=rs.getString(5);
               		cantidadProducto= rs.getString(6);
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

	public String getFechaIngresoOrdenFabricacion() {
		return fechaIngresoOrdenFabricacion;
	}

	public void setFechaIngresoOrdenFabricacion(String fechaIngresoOrdenFabricacion) {
		this.fechaIngresoOrdenFabricacion = fechaIngresoOrdenFabricacion;
	}

	public String getHoraIngresoOrdenFabricacion() {
		return horaIngresoOrdenFabricacion;
	}

	public void setHoraIngresoOrdenFabricacion(String horaIngresoOrdenFabricacion) {
		this.horaIngresoOrdenFabricacion = horaIngresoOrdenFabricacion;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}
} 

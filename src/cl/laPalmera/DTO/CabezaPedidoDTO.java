package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class CabezaPedidoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(CabezaPedidoDTO.class);
	
	private String numeroPedido="";
	private String nombreCliente="";
	private String fechaPedido="";
	private String horaPedido="";
	private String precioTotalPedido="";
	private String confirmacionPedido="";
	private String dedicatoriaPedido="";
	private String observacionPedido="";
      
    
	public int grabar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "insert into CabezaPedido(nombrecliente,fechapedido,horapedido,preciototalpedido,confirmacionpedido,dedicatoriapedido,observacionpedido) values (";
        		sql = sql + "'"+nombreCliente +"',";
        		sql = sql + "'"+fechaPedido +"',";
        		sql = sql + "'"+horaPedido +"',";
        		sql = sql + precioTotalPedido +",";
        		sql = sql + "'"+confirmacionPedido +"',";
        		sql = sql + "'"+dedicatoriaPedido +"',";
        		sql = sql + "'"+observacionPedido +"')";
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
        		String sql = "update cabezapedido set ";
        		sql = sql + "numeropedido = "+numeroPedido +", ";
        		sql = sql + "nombrecliente = "+"'"+nombreCliente +"', ";
        		sql = sql + "fechapedido = "+"'"+fechaPedido +"', ";
        		sql = sql + "horapedido = "+"'"+horaPedido +"', ";
        		sql = sql + "preciototalpedido = "+precioTotalPedido +", ";
        		sql = sql + "confirmacionPedido = "+"'"+confirmacionPedido +"', ";
        		sql = sql + "dedicatoriaPedido = "+"'"+dedicatoriaPedido +"', ";
        		sql = sql + "observacionPedido = "+"'"+observacionPedido +"' where numeropedido = "+numeroPedido+"";
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
        		String sql = "delete from cabezapedido where ";
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
        
    public String buscarUltimo() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "select * from cabezapedido";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			while (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				numeroPedido=rs.getString(1);
    				LOGGER.debug(numeroPedido);
    			}
    			rs.close();
    			stmt.close();
    			conn.close();
    		}
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return numeroPedido;
	}
	
	public boolean buscar() {
		boolean resultado = false;
		try {
			ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
			Connection conn = connLaPalmera.conectionMySql();
			if (conn != null) {
				Statement stmt = conn.createStatement();
				String sql = "select * from cabezapedido where numeropedido = "+numeroPedido+"";
				//LOGGER.debug(sql);
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
					LOGGER.debug("Lo encontro");
					numeroPedido= rs.getString(1);
					nombreCliente= rs.getString(2);
					fechaPedido=rs.getString(3);
					horaPedido=rs.getString(4);
					precioTotalPedido=rs.getString(5);
					confirmacionPedido=rs.getString(6);
					dedicatoriaPedido=rs.getString(7);
					observacionPedido=rs.getString(8);
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

	public String getConfirmacionPedido() {
		return confirmacionPedido;
	}

	public void setConfirmacionPedido(String confirmacionPedido) {
		this.confirmacionPedido = confirmacionPedido;
	}

	public String getDedicatoriaPedido() {
		return dedicatoriaPedido;
	}

	public void setDedicatoriaPedido(String dedicatoriaPedido) {
		this.dedicatoriaPedido = dedicatoriaPedido;
	}

	public String getFechaPedido() {
		return fechaPedido;
	}

	public void setFechaPedido(String fechaPedido) {
		this.fechaPedido = fechaPedido;
	}

	public String getHoraPedido() {
		return horaPedido;
	}

	public void setHoraPedido(String horaPedido) {
		this.horaPedido = horaPedido;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}

	public String getObservacionPedido() {
		return observacionPedido;
	}

	public void setObservacionPedido(String observacionPedido) {
		this.observacionPedido = observacionPedido;
	}

	public String getPrecioTotalPedido() {
		return precioTotalPedido;
	}

	public void setPrecioTotalPedido(String precioTotalPedido) {
		this.precioTotalPedido = precioTotalPedido;
	}
} 

package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class DespachoPedidoDTO {
	
	private static final Logger LOGGER = Logger.getLogger(DespachoPedidoDTO.class);
	
	private String numeroPedido="";
	private String direccionDespacho="";
	private String fechaEntregaDespacho="";
	private String horaEntregaDespacho="";
        
	public int grabar() {
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "insert into DespachoPedido values (";
        		sql = sql + numeroPedido +",";
        		sql = sql + "'"+direccionDespacho +"',";
        		sql = sql + "'"+fechaEntregaDespacho +"',";
        		sql = sql + "'"+horaEntregaDespacho +"')";
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
        		String sql = "update despachopedido set ";
        		sql = sql + "numeropedido = "+numeroPedido +", ";
        		sql = sql + "direccionDespacho = "+"'"+direccionDespacho +"', ";
        		sql = sql + "fechaentregadespacho = "+"'"+fechaEntregaDespacho +"', ";
        		sql = sql + "horaentregadespacho = "+"'"+horaEntregaDespacho +"' where numeropedido = "+numeroPedido+"";
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
        		String sql = "delete from despachopedido where ";
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
    			String sql = "select * from despachopedido where numeropedido = "+numeroPedido+"";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				numeroPedido= rs.getString(1);
    				direccionDespacho=rs.getString(2);
    				fechaEntregaDespacho=rs.getString(3);
    				horaEntregaDespacho=rs.getString(4);
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

	public String getDireccionDespacho() {
		return direccionDespacho;
	}

	public void setDireccionDespacho(String direccionDespacho) {
		this.direccionDespacho = direccionDespacho;
	}

	public String getFechaEntregaDespacho() {
		return fechaEntregaDespacho;
	}

	public void setFechaEntregaDespacho(String fechaEntregaDespacho) {
		this.fechaEntregaDespacho = fechaEntregaDespacho;
	}

	public String getHoraEntregaDespacho() {
		return horaEntregaDespacho;
	}

	public void setHoraEntregaDespacho(String horaEntregaDespacho) {
		this.horaEntregaDespacho = horaEntregaDespacho;
	}

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}
} 

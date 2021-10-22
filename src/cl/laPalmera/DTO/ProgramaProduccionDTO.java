package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class ProgramaProduccionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(ProgramaProduccionDTO.class);
	
    private String codigoOrdenFabricacion="";
    private String fechaProgramaProduccion="";
    private String horaProgramaProduccion="";
    private String codigoProducto="";
    private String codigoLineaProduccion="";
    private String cantidadProgramada="";
    private String cantidadFabricada="";
    private String saldoPorFabricar="";
    private String estadoOrdenFabricacion="";
            
    public int grabar() {
        int i = 0;
        	try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
                String sql = "insert into ProgramaProduccion values (";
                sql = sql + "'"+codigoOrdenFabricacion +"',";
                sql = sql + "'"+fechaProgramaProduccion +"',";
                sql = sql + "'"+horaProgramaProduccion +"',";
                sql = sql + "'"+codigoProducto +"',";
                sql = sql + "'"+codigoLineaProduccion +"',";
                sql = sql + cantidadProgramada +",";
                sql = sql + cantidadFabricada +",";
                sql = sql + saldoPorFabricar +",";
                sql = sql + "'"+estadoOrdenFabricacion +"')";
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
        int i = 0;
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "update programaproduccion set ";
            	sql = sql + "codigoordenfabricacion = "+"'"+codigoOrdenFabricacion +"', ";
            	sql = sql + "fechaprogramaproduccion = "+"'"+fechaProgramaProduccion +"', ";
            	sql = sql + "horaprogramaproduccion = "+"'"+horaProgramaProduccion +"', ";
            	sql = sql + "codigoproducto = "+"'"+codigoProducto +"', ";
            	sql = sql + "codigolineaproduccion = "+"'"+codigoLineaProduccion +"', ";
            	sql = sql + "cantidadprogramada = "+""+cantidadProgramada +", ";
            	sql = sql + "cantidadfabricada = "+""+cantidadFabricada +", ";
            	sql = sql + "saldoporfabricar = "+""+saldoPorFabricar +", ";
            	sql = sql + "estadoordenfabricacion = "+"'"+estadoOrdenFabricacion +"' ";
            	sql = sql + " where codigoordenfabricacion = '"+codigoOrdenFabricacion+"'";
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
        int i = 0;
        try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "delete from programaproduccion where ";
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
         		String sql = "select * from programaproduccion where codigoordenfabricacion = '"+codigoOrdenFabricacion+"'";
         		LOGGER.debug(sql);
         		ResultSet rs = stmt.executeQuery(sql);
         		if (rs.next()) {
         			LOGGER.debug("Lo encontro");
         			codigoOrdenFabricacion = rs.getString(1);
         			fechaProgramaProduccion = rs.getString(2);
         			horaProgramaProduccion = rs.getString(3);
         			codigoProducto = rs.getString(4);
         			codigoLineaProduccion = rs.getString(5);
         			cantidadProgramada = rs.getString(6);
         			cantidadFabricada = rs.getString(7);
         			saldoPorFabricar = rs.getString(8);
         			estadoOrdenFabricacion = rs.getString(9);
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

	public String getCantidadFabricada() {
		return cantidadFabricada;
	}

	public void setCantidadFabricada(String cantidadFabricada) {
		this.cantidadFabricada = cantidadFabricada;
	}

	public String getCantidadProgramada() {
		return cantidadProgramada;
	}

	public void setCantidadProgramada(String cantidadProgramada) {
		this.cantidadProgramada = cantidadProgramada;
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

	public String getEstadoOrdenFabricacion() {
		return estadoOrdenFabricacion;
	}

	public void setEstadoOrdenFabricacion(String estadoOrdenFabricacion) {
		this.estadoOrdenFabricacion = estadoOrdenFabricacion;
	}

	public String getFechaProgramaProduccion() {
		return fechaProgramaProduccion;
	}

	public void setFechaProgramaProduccion(String fechaProgramaProduccion) {
		this.fechaProgramaProduccion = fechaProgramaProduccion;
	}

	public String getHoraProgramaProduccion() {
		return horaProgramaProduccion;
	}

	public void setHoraProgramaProduccion(String horaProgramaProduccion) {
		this.horaProgramaProduccion = horaProgramaProduccion;
	}

	public String getSaldoPorFabricar() {
		return saldoPorFabricar;
	}

	public void setSaldoPorFabricar(String saldoPorFabricar) {
		this.saldoPorFabricar = saldoPorFabricar;
	}
} 

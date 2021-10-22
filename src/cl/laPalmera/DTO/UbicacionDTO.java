package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class UbicacionDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(UbicacionDTO.class);
	
    private String codigoProducto="";
    private String codigoBodega="";
    private String fechaVencimiento="";
    private String tipoProducto="";
    private String fechaIngreso="";
    private String horaIngreso="";
    private String cantidad="";
    private String codigoUnidadMedida="";
    private String observacion="";
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "insert into Ubicacion values (";
            	sql = sql + "'"+codigoProducto +"',";
            	sql = sql + "'"+codigoBodega +"',";
            	sql = sql + "'"+fechaIngreso +"',";
            	sql = sql + "'"+horaIngreso +"',";
            	sql = sql + "'"+fechaVencimiento +"',";
            	sql = sql + "'"+tipoProducto+"',";
            	sql = sql + cantidad +",";
            	sql = sql + "'"+codigoUnidadMedida +"',";
            	sql = sql + "'"+observacion +"')";
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
            	String sql = "update Ubicacion set ";
            	sql = sql + "codigoproducto = '"+codigoProducto +"', ";
            	sql = sql + "codigobodega = '"+codigoBodega +"', ";
            	sql = sql + "fechaingreso = "+"'"+fechaIngreso +"', ";
            	sql = sql + "horaingreso = "+"'"+horaIngreso +"', ";
            	sql = sql + "fechavencimiento = "+"'"+fechaVencimiento +"', ";
            	sql = sql + "tipoProducto= "+"'"+tipoProducto+"', ";
            	sql = sql + "cantidad = "+cantidad +", ";
            	sql = sql + "codigoUnidadMedida = "+"'"+codigoUnidadMedida +"', ";
            	sql = sql + "observacionubicacion = "+"'"+observacion +"' ";
            	sql = sql + "where codigoproducto = '"+codigoProducto+"'";
            	sql = sql + " and codigobodega = '"+codigoBodega+"'";
            	sql = sql + " and fechaingreso ='"+fechaIngreso+"'";
            	sql = sql + " and horaingreso ='"+horaIngreso+"'";
            	sql = sql + " and fechavencimiento ='"+fechaVencimiento+"'";
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
        		String sql = "delete from ubicacion where ";
        		sql = sql + "codigoproducto = '"+codigoProducto +"'";
        		sql = sql + "and codigobodega = '"+codigoBodega +"'";
        		sql = sql + "and fechaIngreso = '"+fechaIngreso +"'";
        		sql = sql + "and horaIngreso = '"+horaIngreso +"'";
        		sql = sql + "and fechaVencimiento = '"+fechaVencimiento +"'";
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
    			String sql = "select * from ubicacion where "; 
    			sql = sql + "codigoproducto = '"+codigoProducto+"'";
    			sql = sql + "and codigobodega = '"+codigoBodega+"'";
    			sql = sql + "and fechaIngreso = '"+fechaIngreso+"'";
    			sql = sql + "and horaIngreso = '"+horaIngreso+"'";
    			sql = sql + "and fechavencimiento = '"+fechaVencimiento+"'"; 
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoProducto= rs.getString(1);
    				codigoBodega= rs.getString(2);
    				fechaIngreso= rs.getString(3);
    				horaIngreso= rs.getString(4);
    				fechaVencimiento= rs.getString(5);
    				tipoProducto= rs.getString(6);
    				cantidad= rs.getString(7);
    				codigoUnidadMedida= rs.getString(8);
    				observacion= rs.getString(9);
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

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}

	public String getCodigoBodega() {
		return codigoBodega;
	}

	public void setCodigoBodega(String codigoBodega) {
		this.codigoBodega = codigoBodega;
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

	public String getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(String fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public String getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getHoraIngreso() {
		return horaIngreso;
	}

	public void setHoraIngreso(String horaIngreso) {
		this.horaIngreso = horaIngreso;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(String tipoProducto) {
		this.tipoProducto = tipoProducto;
	}
} 

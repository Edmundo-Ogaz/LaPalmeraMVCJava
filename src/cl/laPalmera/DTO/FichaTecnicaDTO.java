package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class FichaTecnicaDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(FichaTecnicaDTO.class);
	
    private String codigoProducto="";
    private String codigoConceptoTecnico="";
    private String descripcionFichaTecnica="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into FichaTecnica values (";
    			sql = sql + "'"+codigoProducto +"',";
    			sql = sql + "'"+codigoConceptoTecnico +"',";
    			sql = sql + "'"+descripcionFichaTecnica +"')";
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
    			String sql = "update fichatecnica set ";
    			sql = sql + "codigoproducto = "+"'"+codigoProducto +"', ";
    			sql = sql + "codigoconceptotecnico = "+"'"+codigoConceptoTecnico +"', ";
    			sql = sql + "descripcion = "+"'"+descripcionFichaTecnica +"'";
    			sql = sql + " where codigoproducto = '"+codigoProducto+"'";
    			sql = sql + "and codigoconceptotecnico = '"+codigoConceptoTecnico+"'";
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
    			String sql = "delete from fichatecnica where ";
    			sql = sql + "codigoproducto = '"+codigoProducto +"'";
    			sql = sql + "and codigoconceptotecnico = '"+codigoConceptoTecnico+"'";
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
    			String sql = "select * from fichatecnica where";
    			sql = sql + " codigoproducto = '"+codigoProducto+"'";
    			sql = sql + " and codigoconceptotecnico = '"+codigoConceptoTecnico+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoProducto= rs.getString(1);
    				codigoConceptoTecnico= rs.getString(2);
    				descripcionFichaTecnica= rs.getString(3);
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

	public String getCodigoConceptoTecnico() {
		return codigoConceptoTecnico;
	}

	public void setCodigoConceptoTecnico(String codigoConceptoTecnico) {
		this.codigoConceptoTecnico = codigoConceptoTecnico;
	}

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getDescripcionFichaTecnica() {
		return descripcionFichaTecnica;
	}

	public void setDescripcionFichaTecnica(String descripcionFichaTecnica) {
		this.descripcionFichaTecnica = descripcionFichaTecnica;
	}
} 

package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class ConceptoTecnicoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(ConceptoTecnicoDTO.class);
	
    private String codigoConceptoTecnico="";
    private String nombreConceptoTecnico="";
    
    public void grabar() {
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    		Connection conn = connLaPalmera.conectionMySql();
    		if (conn != null) {
    			Statement stmt = conn.createStatement();
    			String sql = "insert into ConceptoTecnico values (";
    			sql = sql + "'"+codigoConceptoTecnico +"',";
    			sql = sql + "'"+nombreConceptoTecnico +"')";
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
    			String sql = "update conceptotecnico set ";
    			sql = sql + "codigoconceptotecnico = "+"'"+codigoConceptoTecnico +"', ";
    			sql = sql + "nombreconceptotecnico = "+"'"+nombreConceptoTecnico +"' "; 
    			sql = sql + "where codigoconceptotecnico = '"+codigoConceptoTecnico+"'";
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
    			String sql = "delete from conceptotecnico where ";
    			sql = sql + "codigoconceptotecnico = '"+codigoConceptoTecnico +"'";
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
    			String sql = "select * from conceptotecnico where codigoconceptotecnico = '"+codigoConceptoTecnico+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoConceptoTecnico= rs.getString(1);
    				nombreConceptoTecnico= rs.getString(2);
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

	public String getNombreConceptoTecnico() {
		return nombreConceptoTecnico;
	}

	public void setNombreConceptoTecnico(String nombreConceptoTecnico) {
		this.nombreConceptoTecnico = nombreConceptoTecnico;
	}
} 

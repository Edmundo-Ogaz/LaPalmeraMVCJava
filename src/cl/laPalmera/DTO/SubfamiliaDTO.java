package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class SubfamiliaDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(SubfamiliaDTO.class);
	
    private String codigoSubfamilia="";
    private String nombreSubfamilia="";
    private String codigoFamilia="";

    public void grabar() {
        try {
    	    ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
    	    Connection conn = connLaPalmera.conectionMySql();
    	    if (conn != null) {
    		    Statement stmt = conn.createStatement();
    		    String sql = "insert into subfamilia values (";
    		    sql = sql + "'"+codigoSubfamilia +"',";
    		    sql = sql + "'"+nombreSubfamilia +"',";
    		    sql = sql + "'"+codigoFamilia +"')";
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
        		String sql = "update subfamilia set ";
        		sql = sql + "codigosubfamilia = "+"'"+codigoSubfamilia +"', ";
        		sql = sql + "nombresubfamilia = "+"'"+nombreSubfamilia +"', ";
        		sql = sql + "codigofamilia = "+"'"+codigoFamilia +"' where codigosubfamilia = '"+codigoSubfamilia+"'";
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
            	String sql = "delete from subfamilia where ";
            	sql = sql + "codigosubfamilia = '"+codigoSubfamilia +"'";
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
    			String sql = "select * from subfamilia where codigosubfamilia = '"+codigoSubfamilia+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				codigoSubfamilia= rs.getString(1);
    				nombreSubfamilia= rs.getString(2);
    				codigoFamilia= rs.getString(3);
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

	public String getCodigoFamilia() {
		return codigoFamilia;
	}

	public void setCodigoFamilia(String codigoFamilia) {
		this.codigoFamilia = codigoFamilia;
	}

	public String getCodigoSubfamilia() {
		return codigoSubfamilia;
	}

	public void setCodigoSubfamilia(String codigoSubfamilia) {
		this.codigoSubfamilia = codigoSubfamilia;
	}

	public String getNombreSubfamilia() {
		return nombreSubfamilia;
	}

	public void setNombreSubfamilia(String nombreSubfamilia) {
		this.nombreSubfamilia = nombreSubfamilia;
	}
} 
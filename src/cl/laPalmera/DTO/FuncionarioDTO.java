package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class FuncionarioDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(FuncionarioDTO.class);
	
    private String rutFuncionario="";
    private String nombreFuncionario="";
    private String apellidoPaternoFuncionario="";
    private String apellidoMaternoFuncionario="";
    private String codigoCargo="";
    private String codigoArea="";
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
        	if (conn != null) {
        		Statement stmt = conn.createStatement();
        		String sql = "insert into Funcionario values (";
        		sql = sql + "'"+rutFuncionario +"',";
        		sql = sql + "'"+nombreFuncionario +"',";
              	sql = sql + "'"+apellidoPaternoFuncionario +"',";
              	sql = sql + "'"+apellidoMaternoFuncionario +"',";
              	sql = sql + "'"+codigoCargo +"',";
              	sql = sql + "'"+codigoArea +"')";
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
    			String sql = "update funcionario set ";
    			sql = sql + "rutfuncionario = "+"'"+rutFuncionario +"', ";
    			sql = sql + "nombrefuncionario = "+"'"+nombreFuncionario +"', ";
    			sql = sql + "apellidopaternofuncionario = "+"'"+apellidoPaternoFuncionario +"', ";
    			sql = sql + "apellidomaternofuncionario = "+"'"+apellidoMaternoFuncionario +"', ";
    			sql = sql + "codigoCargo = '"+codigoCargo +"', ";
    			sql = sql + "codigoarea = '"+codigoArea +"' where rutfuncionario = '"+rutFuncionario+"'";
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
        		String sql = "delete from funcionario where ";
        		sql = sql + "rutfuncionario = '"+rutFuncionario +"'";
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
    			String sql = "select * from funcionario where rutfuncionario = '"+rutFuncionario+"'";
    			//LOGGER.debug(sql);
    			ResultSet rs = stmt.executeQuery(sql);
    			if (rs.next()) {
    				LOGGER.debug("Lo encontro");
    				rutFuncionario= rs.getString(1);
    				nombreFuncionario= rs.getString(2);
    				apellidoPaternoFuncionario= rs.getString(3);
    				apellidoMaternoFuncionario= rs.getString(4);
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

	public String getApellidoMaternoFuncionario() {
		return apellidoMaternoFuncionario;
	}

	public void setApellidoMaternoFuncionario(String apellidoMaternoFuncionario) {
		this.apellidoMaternoFuncionario = apellidoMaternoFuncionario;
	}

	public String getApellidoPaternoFuncionario() {
		return apellidoPaternoFuncionario;
	}

	public void setApellidoPaternoFuncionario(String apellidoPaternoFuncionario) {
		this.apellidoPaternoFuncionario = apellidoPaternoFuncionario;
	}

	public String getCodigoArea() {
		return codigoArea;
	}

	public void setCodigoArea(String codigoArea) {
		this.codigoArea = codigoArea;
	}

	public String getCodigoCargo() {
		return codigoCargo;
	}

	public void setCodigoCargo(String codigoCargo) {
		this.codigoCargo = codigoCargo;
	}

	public String getNombreFuncionario() {
		return nombreFuncionario;
	}

	public void setNombreFuncionario(String nombreFuncionario) {
		this.nombreFuncionario = nombreFuncionario;
	}

	public String getRutFuncionario() {
		return rutFuncionario;
	}

	public void setRutFuncionario(String rutFuncionario) {
		this.rutFuncionario = rutFuncionario;
	}
} 

package cl.laPalmera.DTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class UsuarioDTO {
	
	private static final Logger LOGGER = Logger.getLogger(UsuarioDTO.class);
	
    String loginUsuario = "";
    String rutFuncionario = "";
    String codigoGrupo = "";
    String passwordUsuario = "";
    
    public void grabar() {
	    try {
            ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();

            	String sql = "insert into usuario values (";
            	sql = sql + "'"+loginUsuario+"',";
            	sql = sql + "'"+rutFuncionario+"',";
            	sql = sql + "'"+codigoGrupo+"',";
            	sql = sql + "'"+passwordUsuario+"',";
            	LOGGER.debug(sql);
               	int i = stmt.executeUpdate(sql);
            	if (i == 1)
            		//LOGGER.debug("OK");
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

            	String sql = "select * from usuario where loginusuario = "+loginUsuario+"";
            	LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		LOGGER.debug("Lo encontro");
            		loginUsuario = rs.getString(1);
            		rutFuncionario = rs.getString(2);
            		codigoGrupo = rs.getString(3);
            		passwordUsuario = rs.getString(4);
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

    public boolean buscar(String rutbuscar) {
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from usuario where loginusuario = '"+loginUsuario+"'";
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		loginUsuario = rs.getString(1);
            		rutFuncionario = rs.getString(2);
            		codigoGrupo = rs.getString(3);
            		passwordUsuario = rs.getString(4);
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

    public boolean validaUsuario() {
    	boolean resultado = false;
    	try {
    		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from usuario where loginusuario = '"+loginUsuario+"' and passwordUsuario = '"+passwordUsuario+"'";
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		loginUsuario = rs.getString(1);
            		rutFuncionario = rs.getString(2);
            		codigoGrupo = rs.getString(3);
            		passwordUsuario = rs.getString(4);
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

	public String getCodigoGrupo() {
		return codigoGrupo;
	}

	public void setCodigoGrupo(String codigoGrupo) {
		this.codigoGrupo = codigoGrupo;
	}

	public String getLoginUsuario() {
		return loginUsuario;
	}

	public void setLoginUsuario(String loginUsuario) {
		this.loginUsuario = loginUsuario;
	}

	public String getPasswordUsuario() {
		return passwordUsuario;
	}

	public void setPasswordUsuario(String passwordUsuario) {
		this.passwordUsuario = passwordUsuario;
	}

	public String getRutFuncionario() {
		return rutFuncionario;
	}

	public void setRutFuncionario(String rutFuncionario) {
		this.rutFuncionario = rutFuncionario;
	}   
}


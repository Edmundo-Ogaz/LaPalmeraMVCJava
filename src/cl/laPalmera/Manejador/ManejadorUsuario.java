package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.UsuarioDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorUsuario { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorUsuario.class);
	
    private String loginUsuario="";
    private String rutFuncionario="";
    private String codigoGrupo = "";
    private String passwordUsuario="";
            
    public ArrayList<UsuarioDTO> consultar() {
		ArrayList<UsuarioDTO> vec = new ArrayList<UsuarioDTO>();
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
        	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
               	String sql = "select * from Usuario where 1 = 1 ";
            
               	if (!loginUsuario.equals(""))
               		sql = sql +"     and loginusuario = '"+loginUsuario+"'";

               	if (!rutFuncionario.equals(""))
               		sql = sql +"     and rutfuncionario = '"+rutFuncionario+"'";
               	
               	if (!codigoGrupo.equals(""))
               		sql = sql +"     and codigoGrupo = '"+codigoGrupo+"'";
               	
               	if (!passwordUsuario.equals(""))
               		sql = sql +"     and passwordUsuario = '"+passwordUsuario+"'";
                          
               	//LOGGER.debug(sql);
               	ResultSet rs = stmt.executeQuery(sql);
               	while (rs.next()) {
               		UsuarioDTO puntero = new UsuarioDTO();
               		puntero.setLoginUsuario(rs.getString(1));
               		puntero.setRutFuncionario(rs.getString(2));
               		puntero.setCodigoGrupo(rs.getString(3));
               		puntero.setPasswordUsuario(rs.getString(3));
                    vec.add(puntero);                    
                }
            }
        } catch (Exception e) {
    	    LOGGER.error(e,e);
        }
        return vec;
    }
} 

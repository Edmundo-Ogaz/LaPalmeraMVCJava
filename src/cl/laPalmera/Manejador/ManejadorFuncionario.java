package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.FuncionarioDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorFuncionario { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorFuncionario.class);
	
    private String rutFuncionario="";
    private String nombreFuncionario="";
    private String apellidoPaternoFuncionario="";
    private String apellidoMaternoFuncionario="";
    private String codigoCargo="";
    private String codigoArea="";
    
    public ArrayList consultar() {
        ArrayList<FuncionarioDTO> vec = new ArrayList<FuncionarioDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from funcionario where 1 = 1 ";
              
            	if (!rutFuncionario.equals(""))
            		sql = sql +"     and rutFuncionario = '"+rutFuncionario+"'";
              
            	if (!nombreFuncionario.equals(""))
            		sql = sql +"     and nombreFuncionario = '"+nombreFuncionario+"'";
              
            	if (!apellidoPaternoFuncionario.equals(""))
            		sql = sql +"     and apellidoPaternoFuncionario = '"+apellidoPaternoFuncionario+"'";
              
            	if (!apellidoMaternoFuncionario.equals(""))
            		sql = sql +"     and apellidoMaternoFuncionario = '"+apellidoMaternoFuncionario+"'";
              
            	if (!codigoCargo.equals(""))
            		sql = sql +"     and codigoCargo = '"+codigoCargo+"'";

            	if (!codigoArea.equals(""))
            		sql = sql +"     and codigoArea = '"+codigoArea+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		FuncionarioDTO puntero = new FuncionarioDTO();
            		puntero.setRutFuncionario(rs.getString(1));
            		puntero.setNombreFuncionario(rs.getString(2));
            		puntero.setApellidoPaternoFuncionario(rs.getString(3));
            		puntero.setApellidoMaternoFuncionario(rs.getString(4));
                    puntero.setCodigoCargo(rs.getString(5));
                    puntero.setCodigoArea(rs.getString(6));
                    vec.add(puntero);
            	}
            	stmt.close();
            	conn.close();
            }
        } catch (Exception e) {
        	LOGGER.error(e,e);
        }
        return vec;
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

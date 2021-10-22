package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ProduccionFuncionarioDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorProduccionFuncionario { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorProduccionFuncionario.class);
	
    private String correlativoProduccion="";
    private String rutFuncionario="";
    
    public ArrayList consultar() {
        ArrayList<ProduccionFuncionarioDTO> vec = new ArrayList<ProduccionFuncionarioDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from ProduccionFuncionario where 1 = 1 ";
              
            	if (!correlativoProduccion.equals(""))
            		sql = sql +"     and correlativoProduccion = "+correlativoProduccion;

            	if (!rutFuncionario.equals(""))
            		sql = sql +"     and rutFuncionario = '"+rutFuncionario+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		ProduccionFuncionarioDTO puntero = new ProduccionFuncionarioDTO();
            		puntero.setCorrelativoProduccion(rs.getString(1));
            		puntero.setRutFuncionario(rs.getString(2));
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

	public String getCorrelativoProduccion() {
		return correlativoProduccion;
	}

	public void setCorrelativoProduccion(String correlativoProduccion) {
		this.correlativoProduccion = correlativoProduccion;
	}

	public String getRutFuncionario() {
		return rutFuncionario;
	}

	public void setRutFuncionario(String rutFuncionario) {
		this.rutFuncionario = rutFuncionario;
	}
} 

package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ConfirmacionPedidoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorConfirmacionPedido { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorConfirmacionPedido.class);
	
    private String numeroPedido="";
    private String nombreCliente="";
    private String apellidoCliente="";
    private String DireccionCliente="";
    private String telefonoCliente="";
     
    public ArrayList consultar() {
        ArrayList<ConfirmacionPedidoDTO> vec = new ArrayList<ConfirmacionPedidoDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from ConfirmacionPedido where 1 = 1 ";
            	
            	if (!numeroPedido.equals(""))
            		sql = sql +"     and numeroPedido = "+numeroPedido;

            	if (!nombreCliente.equals(""))
            		sql = sql +"     and nombreCliente = '"+nombreCliente+"'";
              
            	if (!apellidoCliente.equals(""))
            		sql = sql +"     and apellidoCliente = '"+apellidoCliente+"'";
              
            	if (!DireccionCliente.equals(""))
            		sql = sql +"     and DireccionCliente = '"+DireccionCliente+"'";
             
            	if (!telefonoCliente.equals(""))
            		sql = sql +"     and telefonoCliente = "+telefonoCliente;
                            
            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		ConfirmacionPedidoDTO puntero = new ConfirmacionPedidoDTO();
            		puntero.setNumeroPedido(rs.getString(1));
            		puntero.setNombreCliente(rs.getString(2));
            		puntero.setApellidoCliente(rs.getString(3));
            		puntero.setDireccionCliente(rs.getString(4));
            		puntero.setTelefonoCliente(rs.getString(5));
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
} 

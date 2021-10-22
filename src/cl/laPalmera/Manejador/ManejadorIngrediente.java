package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.IngredienteDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorIngrediente { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorIngrediente.class);
	
    private String codigoProducto="";
    private String codigoInsumo="";
    private String carga="";
    private String cantidadInsumo="";
    private String codigoUnidadMedida="";
    
    public ArrayList consultar() {
        ArrayList<IngredienteDTO> vec = new ArrayList<IngredienteDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Ingrediente where 1 = 1 ";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = "+"'"+codigoProducto+"'";

            	if (!codigoInsumo.equals(""))
            		sql = sql +"     and codigoInsumo = "+"'"+codigoInsumo+"'";

            	if (!carga.equals(""))
            		sql = sql +"     and carga = "+carga;

            	if (!cantidadInsumo.equals(""))
            		sql = sql +"     and cantidadInsumo = "+cantidadInsumo;

            	if (!cantidadInsumo.equals(""))
            		sql = sql +"     and codigounidadmedida = "+"'"+codigoUnidadMedida+"'";	

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		IngredienteDTO puntero = new IngredienteDTO();
            		puntero.setCodigoProducto(rs.getString(1));
            		puntero.setCodigoInsumo(rs.getString(2));
            		puntero.setCarga(rs.getString(3));
            		puntero.setCantidadInsumo(rs.getString(4));
            		puntero.setCodigoUnidadMedida(rs.getString(5));
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

	public String getCantidadInsumo() {
		return cantidadInsumo;
	}

	public void setCantidadInsumo(String cantidadInsumo) {
		this.cantidadInsumo = cantidadInsumo;
	}

	public String getCarga() {
		return carga;
	}

	public void setCarga(String carga) {
		this.carga = carga;
	}

	public String getCodigoInsumo() {
		return codigoInsumo;
	}

	public void setCodigoInsumo(String codigoInsumo) {
		this.codigoInsumo = codigoInsumo;
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
} 

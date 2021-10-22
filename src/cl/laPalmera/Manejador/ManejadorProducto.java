package cl.laPalmera.Manejador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cl.laPalmera.DTO.ProductoDTO;
import cl.laPalmera.connection.ConnectionLaPalmera;

public class ManejadorProducto { 
	
	private static final Logger LOGGER = Logger.getLogger(ManejadorProducto.class);
	
    private String codigoProducto="";
    private String nombreProducto="";
    private String codigoFamilia="";
    private String codigoSubfamilia="";
	private String codigoOtraCaracteristica="";
	private String stockCriticoProducto="";
	private String codigoUnidadMedida="";
	private String tipoProducto="";
	private String valorCostoProducto="";
	private String valorVentaProducto="";
	private String preparacionProducto="";
	private String fotoProducto="";
	private String observacionProducto="";
    
    public ArrayList consultar() {
        ArrayList<ProductoDTO> vec = new ArrayList<ProductoDTO>();
      	try {
      		ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "select * from Producto where 1 = 1 ";
              
            	if (!codigoProducto.equals(""))
            		sql = sql +"     and codigoProducto = '"+codigoProducto+"'";

            	if (!nombreProducto.equals(""))
            		sql = sql +"     and nombreProducto = '"+nombreProducto+"'";
              
            	if (!codigoFamilia.equals(""))
            		sql = sql +"     and codigoFamilia = '"+codigoFamilia+"'";

            	if (!codigoSubfamilia.equals(""))
              
            		sql = sql +"     and codigoSubfamilia = '"+codigoSubfamilia+"'";

            	if (!codigoOtraCaracteristica.equals(""))
            		sql = sql +"     and codigoOtraCaracteristica = '"+codigoOtraCaracteristica+"'";

            	if (!stockCriticoProducto.equals(""))
            		sql = sql +"     and stockCriticoProducto = "+stockCriticoProducto;

            	if (!codigoUnidadMedida.equals(""))
            		sql = sql +"     and codigoUnidadMedida = '"+codigoUnidadMedida+"'";

            	if (!tipoProducto.equals(""))
            		sql = sql +"     and tipoproducto = '"+tipoProducto+"'";
              
            	if (!valorCostoProducto.equals(""))
            		sql = sql +"     and valorCostoProducto = "+valorCostoProducto;

            	if (!valorVentaProducto.equals(""))
            		sql = sql +"     and valorVentaProducto = "+valorVentaProducto;

            	if (!preparacionProducto.equals(""))
            		sql = sql +"     and preparacionProducto = '"+preparacionProducto+"'";
              
            	if (!fotoProducto.equals(""))
            		sql = sql +"     and fotoProducto = '"+fotoProducto+"'";
              
            	if (!observacionProducto.equals(""))
            		sql = sql +"     and observacionProducto = '"+observacionProducto+"'";

            	//LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	while (rs.next()) {
            		ProductoDTO puntero = new ProductoDTO();
            		puntero.setCodigoProducto(rs.getString(1));
            		puntero.setNombreProducto(rs.getString(2));
            		puntero.setCodigoFamilia(rs.getString(3));
            		puntero.setCodigoSubfamilia(rs.getString(4));
            		puntero.setCodigoOtraCaracteristica(rs.getString(5));
            		puntero.setCodigoUnidadMedida(rs.getString(6));
            		puntero.setStockCriticoProducto(rs.getString(7));
            		puntero.setValorCostoProducto(rs.getString(8));
            		puntero.setValorVentaProducto(rs.getString(9));
            		puntero.setPreparacionProducto(rs.getString(10));
            		puntero.setTipoProducto(rs.getString(11));
            		puntero.setFotoProducto(rs.getString(12));
            		puntero.setObservacionProducto(rs.getString(13));
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

	public String getCodigoFamilia() {
		return codigoFamilia;
	}

	public void setCodigoFamilia(String codigoFamilia) {
		this.codigoFamilia = codigoFamilia;
	}

	public String getCodigoOtraCaracteristica() {
		return codigoOtraCaracteristica;
	}

	public void setCodigoOtraCaracteristica(String codigoOtraCaracteristica) {
		this.codigoOtraCaracteristica = codigoOtraCaracteristica;
	}

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getCodigoSubfamilia() {
		return codigoSubfamilia;
	}

	public void setCodigoSubfamilia(String codigoSubfamilia) {
		this.codigoSubfamilia = codigoSubfamilia;
	}

	public String getCodigoUnidadMedida() {
		return codigoUnidadMedida;
	}

	public void setCodigoUnidadMedida(String codigoUnidadMedida) {
		this.codigoUnidadMedida = codigoUnidadMedida;
	}

	public String getFotoProducto() {
		return fotoProducto;
	}

	public void setFotoProducto(String fotoProducto) {
		this.fotoProducto = fotoProducto;
	}

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}

	public String getObservacionProducto() {
		return observacionProducto;
	}

	public void setObservacionProducto(String observacionProducto) {
		this.observacionProducto = observacionProducto;
	}

	public String getPreparacionProducto() {
		return preparacionProducto;
	}

	public void setPreparacionProducto(String preparacionProducto) {
		this.preparacionProducto = preparacionProducto;
	}

	public String getStockCriticoProducto() {
		return stockCriticoProducto;
	}

	public void setStockCriticoProducto(String stockCriticoProducto) {
		this.stockCriticoProducto = stockCriticoProducto;
	}

	public String getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(String tipoProducto) {
		this.tipoProducto = tipoProducto;
	}

	public String getValorCostoProducto() {
		return valorCostoProducto;
	}

	public void setValorCostoProducto(String valorCostoProducto) {
		this.valorCostoProducto = valorCostoProducto;
	}

	public String getValorVentaProducto() {
		return valorVentaProducto;
	}

	public void setValorVentaProducto(String valorVentaProducto) {
		this.valorVentaProducto = valorVentaProducto;
	}
} 

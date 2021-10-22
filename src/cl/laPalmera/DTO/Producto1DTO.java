package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class Producto1DTO {
	
	private static final Logger LOGGER = Logger.getLogger(Producto1DTO.class);
	
    String codigoProducto ="xxx";
    String nombreProducto = "xxx";
    String codigoFamilia = "xxx";
    String codigoSubfamilia = "xxx";
    String codigootraCaracteristica = "xxx";
    String codigoUnidadmedida = "xxx";
    String stockcriticoProducto = "xxx";
    String valorcostoProducto = "xxx";
    String valorventaProducto = "xxx";
    String preparacionProducto = "xxx";
    String productoSemielaborado = "xxx";
    String fotoProducto = "xxx";
    String observacion = "xxx";
        
    public void grabar() {
	    try {
	    	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         	Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "insert into producto values (";
            	sql = sql + "'"+codigoProducto+"',";
            	sql = sql + "'"+nombreProducto+"',";
            	sql = sql + "'"+codigoFamilia+"',";
            	sql = sql + "'"+codigoSubfamilia+"',";
            	sql = sql + "'"+codigootraCaracteristica+"',";
            	sql = sql + "'"+codigoUnidadmedida+"',";
            	sql = sql + "'"+stockcriticoProducto+"',";
            	sql = sql + "'"+valorcostoProducto+"',";
            	sql = sql + "'"+valorventaProducto+"',";
            	sql = sql + "'"+preparacionProducto+"',";
            	sql = sql + "'"+productoSemielaborado+"',";
            	sql = sql + "'"+fotoProducto+"',";
            	sql = sql + "'"+observacion+"',";
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
            	String sql = "select * from producto where codigoproducto = "+codigoProducto+"";
            	LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		LOGGER.debug("Lo encontro");
            		codigoProducto = rs.getString(1);
            		nombreProducto = rs.getString(2);
            		codigoFamilia = rs.getString(3);
            		codigoSubfamilia = rs.getString(4);
            		codigootraCaracteristica = rs.getString(5);
            		codigoUnidadmedida = rs.getString(6);
            		stockcriticoProducto = rs.getString(7);
            		valorcostoProducto = rs.getString(8);
            		valorventaProducto = rs.getString(9);
            		preparacionProducto = rs.getString(10);
            		productoSemielaborado = rs.getString(11);
            		fotoProducto = rs.getString(12);
            		observacion = rs.getString(13);
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
            	String sql = "select * from producto where codigoproducto = '"+codigoProducto+"'";
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		codigoProducto = rs.getString(1);
            		nombreProducto = rs.getString(2);
            		codigoFamilia = rs.getString(3);
            		codigoSubfamilia = rs.getString(4);
            		codigootraCaracteristica = rs.getString(5);
            		codigoUnidadmedida = rs.getString(6);
            		stockcriticoProducto = rs.getString(7);
            		valorcostoProducto = rs.getString(8);
            		valorventaProducto = rs.getString(9);
            		preparacionProducto = rs.getString(10);
            		productoSemielaborado = rs.getString(11);
            		fotoProducto = rs.getString(12);
            		observacion = rs.getString(13);
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
            	String sql = "select * from producto where codigoproducto = '"+codigoProducto+"' and nombreproducto = '"+nombreProducto+"'";
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		codigoProducto = rs.getString(1);
            		nombreProducto = rs.getString(2);
            		codigoFamilia = rs.getString(3);
            		codigoSubfamilia = rs.getString(4);
            		codigootraCaracteristica = rs.getString(5);
            		codigoUnidadmedida = rs.getString(6);
            		stockcriticoProducto = rs.getString(7);
            		valorcostoProducto = rs.getString(8);
            		valorventaProducto = rs.getString(9);
            		preparacionProducto = rs.getString(10);
            		productoSemielaborado = rs.getString(11);
            		fotoProducto = rs.getString(12);
            		observacion = rs.getString(13);
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

	public String getCodigootraCaracteristica() {
		return codigootraCaracteristica;
	}

	public void setCodigootraCaracteristica(String codigootraCaracteristica) {
		this.codigootraCaracteristica = codigootraCaracteristica;
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

	public String getCodigoUnidadmedida() {
		return codigoUnidadmedida;
	}

	public void setCodigoUnidadmedida(String codigoUnidadmedida) {
		this.codigoUnidadmedida = codigoUnidadmedida;
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

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getPreparacionProducto() {
		return preparacionProducto;
	}

	public void setPreparacionProducto(String preparacionProducto) {
		this.preparacionProducto = preparacionProducto;
	}

	public String getProductoSemielaborado() {
		return productoSemielaborado;
	}

	public void setProductoSemielaborado(String productoSemielaborado) {
		this.productoSemielaborado = productoSemielaborado;
	}

	public String getStockcriticoProducto() {
		return stockcriticoProducto;
	}

	public void setStockcriticoProducto(String stockcriticoProducto) {
		this.stockcriticoProducto = stockcriticoProducto;
	}

	public String getValorcostoProducto() {
		return valorcostoProducto;
	}

	public void setValorcostoProducto(String valorcostoProducto) {
		this.valorcostoProducto = valorcostoProducto;
	}

	public String getValorventaProducto() {
		return valorventaProducto;
	}

	public void setValorventaProducto(String valorventaProducto) {
		this.valorventaProducto = valorventaProducto;
	}
}


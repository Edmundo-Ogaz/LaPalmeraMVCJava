package cl.laPalmera.DTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import cl.laPalmera.connection.ConnectionLaPalmera;

public class ProductoDTO { 
	
	private static final Logger LOGGER = Logger.getLogger(ProductoDTO.class);
	
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
    
    public void grabar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "insert into producto values (";
            	sql = sql + "'"+codigoProducto +"',";
            	sql = sql + "'"+nombreProducto +"',";
            	sql = sql + "'"+codigoFamilia +"',";
            	sql = sql + "'"+codigoSubfamilia +"',";
            	sql = sql + "'"+codigoOtraCaracteristica +"',";
            	sql = sql + "'"+codigoUnidadMedida +"',";
            	sql = sql + stockCriticoProducto +",";
            	sql = sql + valorCostoProducto +",";
            	sql = sql + valorVentaProducto +",";
            	sql = sql + "'"+preparacionProducto +"',";
            	sql = sql + "'"+tipoProducto +"',";
            	sql = sql + "'"+fotoProducto +"',";
            	sql = sql + "'"+observacionProducto +"')";
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
            	String sql = "update producto set ";
            	sql = sql + "codigoproducto = "+"'"+codigoProducto +"', ";
            	sql = sql + "nombreproducto = "+"'"+nombreProducto +"', ";
            	sql = sql + "codigofamilia = "+"'"+codigoFamilia +"', ";
            	sql = sql + "codigosubfamilia = "+"'"+codigoSubfamilia +"', ";
            	sql = sql + "codigootracaracteristica = "+"'"+codigoOtraCaracteristica +"', ";
            	sql = sql + "codigounidadmedida = "+"'"+codigoUnidadMedida +"', ";
            	sql = sql + "stockcriticoproducto = "+stockCriticoProducto +", ";
            	sql = sql + "valorcosto = "+valorCostoProducto +", ";
            	sql = sql + "valorventa = "+valorVentaProducto +", ";
            	sql = sql + "preparacion = "+"'"+preparacionProducto +"', ";
            	sql = sql + "tipoproducto = "+"'"+tipoProducto +"', ";
            	sql = sql + "fotoproducto = "+"'"+fotoProducto +"', ";
            	sql = sql + "observacion = "+"'"+observacionProducto +"' where codigoproducto = '"+codigoProducto+"'";
            	LOGGER.debug(sql);
            	int i = stmt.executeUpdate(sql);
               
            	if (i == 1)
            		LOGGER.debug("OK");
            	
            	stmt.close();
            	conn.close();
            }
        } catch (Exception e) {LOGGER.error(e,e);}
    }
    
    public void eliminar() {
        try {
        	ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
            Connection conn = connLaPalmera.conectionMySql();
            if (conn != null) {
            	Statement stmt = conn.createStatement();
            	String sql = "delete from producto where ";
            	sql = sql + "codigoproducto = "+"'"+codigoProducto +"'";
            	LOGGER.debug(sql);
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
            	String sql = "select * from producto where codigoproducto = "+"'"+codigoProducto+"'";
            	LOGGER.debug(sql);
            	ResultSet rs = stmt.executeQuery(sql);
            	if (rs.next()) {
            		LOGGER.debug("Lo encontro");
            		codigoProducto= rs.getString(1);
            		nombreProducto= rs.getString(2);
            		codigoFamilia= rs.getString(3);
            		codigoSubfamilia= rs.getString(4);
            		codigoOtraCaracteristica= rs.getString(5);
            		codigoUnidadMedida= rs.getString(6);
            		stockCriticoProducto= rs.getString(7);
            		valorCostoProducto= rs.getString(8);
            		valorVentaProducto= rs.getString(9);
            		preparacionProducto= rs.getString(10);
            		tipoProducto= rs.getString(11);
            		fotoProducto= rs.getString(12);
            		observacionProducto= rs.getString(13);
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
  
  

package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.InsumoDTO;
import cl.laPalmera.DTO.StockDTO;
import cl.laPalmera.DTO.UbicacionDTO;

public class GrabaIngresoInsumo extends HttpServlet
{

    public GrabaIngresoInsumo()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filinsumo = httpservletrequest.getParameter("insumo");
      	String cantidad = "";
      	String stockdisponible = "";
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaIngresoInsumo.jsp&titulo=Listado Ingreso Insumo";
          enviara = enviara + "&filproducto="+filinsumo;
          
          UbicacionDTO ubicacion = new UbicacionDTO();
          StockDTO stock = new StockDTO();
          InsumoDTO insumo = new InsumoDTO();
          
          ubicacion.setCodigoProducto(httpservletrequest.getParameter("insumo"));
          ubicacion.setCodigoBodega(httpservletrequest.getParameter("bodega"));
          ubicacion.setFechaIngreso(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
          ubicacion.setHoraIngreso(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
          ubicacion.setFechaVencimiento(httpservletrequest.getParameter("fechavencimiento"));
          ubicacion.setTipoProducto("I");
		  ubicacion.setCantidad(httpservletrequest.getParameter("cantidad"));
          ubicacion.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));
		  ubicacion.setObservacion(httpservletrequest.getParameter("observacion"));    
		  ubicacion.grabar();
		  
		  stock.setCodigoProducto(httpservletrequest.getParameter("insumo"));
		  if (stock.buscar())
		  {
		    stockdisponible = String.valueOf(Float.parseFloat(stock.getStockDisponible())+Float.parseFloat(httpservletrequest.getParameter("cantidad")));
		    stock.setStockDisponible(stockdisponible);
		    stock.modificar();
		  }else{
		    stock.setStockDisponible(httpservletrequest.getParameter("cantidad"));
		    stock.setStockComprometido("0");
		    stock.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));
			stock.grabar();
	      }
        } 
	            
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=FilUbicacion.jsp&titulo=Filtrado de Ubicacion");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
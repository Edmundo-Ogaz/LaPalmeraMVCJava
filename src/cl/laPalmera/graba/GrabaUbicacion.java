package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.UbicacionDTO;

public class GrabaUbicacion extends HttpServlet
{

    public GrabaUbicacion()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filproducto= httpservletrequest.getParameter("filproducto");
        String filbodega= httpservletrequest.getParameter("filbodega");
        String filtipoproducto= httpservletrequest.getParameter("filtipoproducto");
        String filfechaingresoinicio= httpservletrequest.getParameter("filfechaingresoinicio");
        String filfechaingresotermino= httpservletrequest.getParameter("filfechaingresotermino");
        String filfechavencimientoinicio= httpservletrequest.getParameter("filfechavencimientoinicio");
        String filfechavencimientotermino= httpservletrequest.getParameter("filfechavencimientotermino");
        String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaUbicacion.jsp&titulo=Listado Ubicacion";
          enviara = enviara + "&filproducto="+filproducto;
          enviara = enviara + "&filbodega="+filbodega; 
          enviara = enviara + "&filtipoproducto="+filtipoproducto;
          enviara = enviara + "&filfechaingresoinicio="+filfechaingresoinicio; 
          enviara = enviara + "&filfechaingresotermino="+filfechaingresotermino;
          enviara = enviara + "&filfechavencimientoinicio="+filfechavencimientoinicio; 
          enviara = enviara + "&filfechavencimientotermino="+filfechavencimientotermino; 
            
          UbicacionDTO ubicacion = new UbicacionDTO();
          ubicacion.setCodigoProducto(httpservletrequest.getParameter("producto"));
          ubicacion.setCodigoBodega(httpservletrequest.getParameter("bodega"));
          ubicacion.setFechaIngreso(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
		  ubicacion.setHoraIngreso(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
          ubicacion.setFechaVencimiento(httpservletrequest.getParameter("fechavencimiento"));
          ubicacion.setTipoProducto(httpservletrequest.getParameter("tipoproducto"));
		  ubicacion.setCantidad(httpservletrequest.getParameter("cantidad"));
		  ubicacion.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));            	
          ubicacion.setObservacion(httpservletrequest.getParameter("observacion"));            
          ubicacion.grabar();
          
          /*Stock stock = new Stock();
          stock.setCodigoProducto(httpservletrequest.getParameter("producto"));
		  if (stock.buscar())
		  {
		    String stockdisponible = String.valueOf(Integer.parseInt(stock.getStockDisponible())+Integer.parseInt(httpservletrequest.getParameter("cantidad")));
			stock.setStockDisponible(stockdisponible);
			stock.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));
			stock.modificar();
		  }else{
		    //stock.setCodigoProducto(httpservletrequest.getParameter("producto"));
		    stock.setStockDisponible(httpservletrequest.getParameter("cantidad"));
		    stock.setStockComprometido("0");
		    stock.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));	
		    stock.grabar();		  
		  }*/   
          } 
	            
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=FilUbicacion.jsp&titulo=Filtrado de Ubicacion");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.StockDTO;

public class GrabaStock extends HttpServlet
{

    public GrabaStock()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filproducto= httpservletrequest.getParameter("filproducto");
        //String filnombre= httpservletrequest.getParameter("filnombre");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	    { 
	    enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaStock.jsp&titulo=Listado Stock";
        enviara = enviara + "&filproducto="+filproducto;
        //enviara = enviara + "&filnombre="+filnombre;     
        
        StockDTO stock = new StockDTO();
        stock.setCodigoProducto(httpservletrequest.getParameter("producto"));
        stock.setStockDisponible(httpservletrequest.getParameter("stockdisponible"));
        stock.setStockComprometido(httpservletrequest.getParameter("stockcomprometido"));
        stock.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));
		stock.grabar();
        } 
	     
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=FilUbicacion.jsp&titulo=Filtrado de Ubicacion");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
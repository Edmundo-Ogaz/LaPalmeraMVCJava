package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ProductoLineaDTO;

public class ModificaProductoLinea extends HttpServlet
{

    public ModificaProductoLinea()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filproducto = httpservletrequest.getParameter("filproducto");
        String fillineaproduccion = httpservletrequest.getParameter("fillineaproduccion");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProductoLinea.jsp&titulo=Listado Porducto por Linea";
	      enviara = enviara + "&filproducto="+filproducto;
          enviara = enviara + "&fillineaproduccion="+fillineaproduccion; 
              
          ProductoLineaDTO productoLinea = new ProductoLineaDTO();
          productoLinea.setCodigoLineaProduccion(httpservletrequest.getParameter("lineaproduccion"));
          productoLinea.setCodigoProducto(httpservletrequest.getParameter("producto"));
          productoLinea.modificar();
          } 
	                   
            
            						       
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/area.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
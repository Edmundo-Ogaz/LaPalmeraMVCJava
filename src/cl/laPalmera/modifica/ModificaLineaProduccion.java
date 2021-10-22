package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.LineaProduccionDTO;

public class ModificaLineaProduccion extends HttpServlet
{

    public ModificaLineaProduccion()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filcodigo = httpservletrequest.getParameter("filcodigo");
        String filnombre = httpservletrequest.getParameter("filnombre");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	    enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaLineaProduccion.jsp&titulo=Listado Linea de Produccion";
          enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre;
          
          LineaProduccionDTO lineaProduccion = new LineaProduccionDTO();
          lineaProduccion.setCodigoLineaProduccion(httpservletrequest.getParameter("codigo"));
          lineaProduccion.setNombreLineaProduccion(httpservletrequest.getParameter("nombre"));
          lineaProduccion.modificar();
          } 
	       
		httpservletresponse.sendRedirect(enviara);
        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/lineaproduccion.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
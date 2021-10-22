package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.OtraCaracteristicaDTO;

public class GrabaOtraCaracteristica extends HttpServlet
{

    public GrabaOtraCaracteristica()
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
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaOtraCaracteristica.jsp&titulo=Listado Otra Caracteristica";
          enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre; 
          
          OtraCaracteristicaDTO otracaracteristica = new OtraCaracteristicaDTO();
          otracaracteristica.setCodigoOtraCaracteristica(httpservletrequest.getParameter("codigo"));
          otracaracteristica.setNombreOtraCaracteristica(httpservletrequest.getParameter("nombre"));
          otracaracteristica.grabar();
          } 
	            
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/otracaracteristica.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.OtraCaracteristicaDTO;

public class EliminaOtraCaracteristica extends HttpServlet
{

    public EliminaOtraCaracteristica()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filcodigo = httpservletrequest.getParameter("filcodigo");
        String filnombre = httpservletrequest.getParameter("filnombre");
      	String enviara = "";
	    if (opcion.equals("Eliminar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaOtraCaracteristica.jsp&titulo=Listado OtraCaracteristica";
          enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre; 
          
          OtraCaracteristicaDTO otraCaracteristica = new OtraCaracteristicaDTO();
          otraCaracteristica.setCodigoOtraCaracteristica(httpservletrequest.getParameter("seleccion"));
          otraCaracteristica.eliminar();
               } 
	                   
        httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/otracaracteristica.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
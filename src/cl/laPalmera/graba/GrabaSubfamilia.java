package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.SubfamiliaDTO;

public class GrabaSubfamilia extends HttpServlet
{

    public GrabaSubfamilia()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filcodigo = httpservletrequest.getParameter("filcodigo");
        String filnombre = httpservletrequest.getParameter("filnombre");
        String filfamilia = httpservletrequest.getParameter("filfamilia");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaSubfamilia.jsp&titulo=Listado Subfamilia";
          enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre; 
          enviara = enviara + "&filfamilia="+filfamilia; 
          
          SubfamiliaDTO subfamilia = new SubfamiliaDTO();
          subfamilia.setCodigoSubfamilia(httpservletrequest.getParameter("codigo"));
          subfamilia.setNombreSubfamilia(httpservletrequest.getParameter("nombre"));
          subfamilia.setCodigoFamilia(httpservletrequest.getParameter("familia"));
          subfamilia.grabar();
          } 
	       
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/familia.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
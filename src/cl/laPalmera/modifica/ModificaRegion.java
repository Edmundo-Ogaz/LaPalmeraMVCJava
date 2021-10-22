package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.RegionDTO;

public class ModificaRegion extends HttpServlet
{

    public ModificaRegion()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filregion = httpservletrequest.getParameter("filregion");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaRegion.jsp&titulo=Listado Regi&oacute;n";
          enviara = enviara + "&filregion="+filregion;  
          
          RegionDTO region = new RegionDTO();
          region.setCodigoRegion(httpservletrequest.getParameter("codigo"));
          region.setNombreRegion(httpservletrequest.getParameter("nombre"));
          region.modificar();
          } 
	          
		httpservletresponse.sendRedirect(enviara);
        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/region.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
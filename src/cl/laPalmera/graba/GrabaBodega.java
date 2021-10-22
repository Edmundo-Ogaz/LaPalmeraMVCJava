package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.BodegaDTO;

public class GrabaBodega extends HttpServlet
{

    public GrabaBodega()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
        String filcodigo= httpservletrequest.getParameter("filcodigo");
        String filnombre= httpservletrequest.getParameter("filnombre");
        String enviara = "";
        
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaBodega.jsp&titulo=Listado Bodega";
	      enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre; 
          
          BodegaDTO bodega = new BodegaDTO();
          bodega.setCodigoBodega(httpservletrequest.getParameter("codigo"));
          bodega.setNombreBodega(httpservletrequest.getParameter("nombre"));
          bodega.grabar();
           } 
	                               						       
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/bodega.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
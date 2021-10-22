package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.BodegaDTO;

public class EliminaBodega extends HttpServlet
{

    public EliminaBodega()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
       String opcion = httpservletrequest.getParameter("Enviar");
        String filcodigo= httpservletrequest.getParameter("filcodigo");
        String filnombre= httpservletrequest.getParameter("filnombre");
        String enviara = "";
        
	    if (opcion.equals("Eliminar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaBodega.jsp&titulo=Listado Bodega";
	      enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre; 
          
          BodegaDTO bodega = new BodegaDTO();
          bodega.setCodigoBodega(httpservletrequest.getParameter("seleccion"));
          bodega.eliminar();
          } 
	                   
        httpservletresponse.sendRedirect(enviara);
    }
}
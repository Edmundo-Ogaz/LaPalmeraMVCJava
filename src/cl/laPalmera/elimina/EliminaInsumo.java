package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.InsumoDTO;

public class EliminaInsumo extends HttpServlet
{

    public EliminaInsumo()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filcodigo = httpservletrequest.getParameter("filcodigo");
        String filnombre = httpservletrequest.getParameter("filnombre");
        String filunidadmedida = httpservletrequest.getParameter("filunidadmedida");
      	String enviara = "";
      	
	    if (opcion.equals("Eliminar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaInsumo.jsp&titulo=Listado Insumo";
          enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre; 
          enviara = enviara + "&filunidadmedida="+filunidadmedida;
          
          InsumoDTO insumo = new InsumoDTO();
          insumo.setCodigoInsumo(httpservletrequest.getParameter("seleccion"));
          insumo.eliminar();
               } 
	                   
        httpservletresponse.sendRedirect(enviara);
		
		//httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/insumo.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}
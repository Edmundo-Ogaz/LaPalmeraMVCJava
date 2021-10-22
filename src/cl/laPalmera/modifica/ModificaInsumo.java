package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.InsumoDTO;

public class ModificaInsumo extends HttpServlet
{

    public ModificaInsumo()
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
      	
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaInsumo.jsp&titulo=Listado Insumo";
          enviara = enviara + "&filcodigo="+filcodigo;
          enviara = enviara + "&filnombre="+filnombre; 
          enviara = enviara + "&filunidadmedida="+filunidadmedida;
          
          InsumoDTO insumo = new InsumoDTO();
          insumo.setCodigoInsumo(httpservletrequest.getParameter("codigo"));
          insumo.setNombreInsumo(httpservletrequest.getParameter("nombre"));
          insumo.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));
          insumo.setStockCriticoInsumo(httpservletrequest.getParameter("stockcritico"));
          insumo.setPesoInsumo(httpservletrequest.getParameter("peso"));
          insumo.setObservacionInsumo(httpservletrequest.getParameter("observacion"));
          insumo.modificar();
          } 
	       
		httpservletresponse.sendRedirect(enviara);
		
		//httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/insumo.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}